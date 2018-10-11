#include "Comms.h"
#include <QJsonDocument>
#include <QObject>

void Comms::SetCommsAddress(QString ip, QString port) {
  ip_ = ip + ":" + port;
};

void Comms::GetPatientsList() {
  QString errors;
  QTimer get_timer;
  QVector<Patient> patients;
  QString comm_errors;

  QNetworkAccessManager* manager = new QNetworkAccessManager();

  QNetworkRequest request;
  request.setUrl(QUrl(ip_ + SeedEndpoint));

  manager->get(request);
  QObject::connect(
      manager, &QNetworkAccessManager::finished,
      [&](QNetworkReply* reply) { ProcessGetPatientsList(reply); });
};

void Comms::ProcessGetPatientsList(QNetworkReply* reply) {

  QVector<Patient> patients;
  QString errors("");

  if (reply->error() != QNetworkReply::NoError) {
    errors = reply->errorString();
    emit SendPatients(patients, errors);
    return;
  }

  QJsonDocument jsonDoc = QJsonDocument::fromJson(reply->readAll());
  QJsonArray jsonArray = jsonDoc.array();

  foreach (const QJsonValue& value, jsonArray) {
    patients.push_back(ReadJsonPatient(value.toObject()));
  }

  emit SendPatients(patients, errors);
}

void Comms::PostPatient(Patient patient) {
    qDebug() << "Comms::PostPatient";
  QJsonDocument patientDocument = CreateJsonPatient(patient);
  QNetworkAccessManager* manager = new QNetworkAccessManager();

  QNetworkRequest request;
  request.setUrl(QUrl(ip_ + SeedEndpoint));
  request.setHeader(QNetworkRequest::ContentTypeHeader,"application/json");
  manager->post(request, patientDocument.toJson());
  QObject::connect(
      manager, &QNetworkAccessManager::finished,
      [&](QNetworkReply* reply) { ProcessPostPatient(reply); });
}

void Comms::ProcessPostPatient(QNetworkReply* reply) {
  qDebug() << "Comms::ProcessPostPatient";
  QString errors("");

  if (reply->error() != QNetworkReply::NoError) {
    errors = reply->errorString();
    qDebug() << errors;
    return;
  }
}

Patient Comms::ReadJsonPatient(QJsonObject obj) {
  Patient patient;
  patient.id = obj[json_id].toInt();
  patient.name = obj[json_name].toString();
  patient.surname = obj[json_surname].toString();
  patient.email = obj[json_email].toString();
  patient.dateOfBirth = obj[json_dob].toString();

  PatientAddress address;
  QJsonObject add = obj[json_address].toObject();

  address.coordinates = add[json_coordinates].toString();
  address.street = add[json_street].toString();
  address.city = add[json_city].toString();
  address.zip = add[json_zip].toString();
  patient.address = address;

  return patient;
}

QJsonDocument Comms::CreateJsonPatient(Patient patient) {

  QJsonObject patientObject;
  patientObject.insert(json_name, patient.name);
  patientObject.insert(json_surname, patient.surname);
  patientObject.insert(json_email, patient.email);
  patientObject.insert(json_dob, patient.dateOfBirth);

  QJsonObject addressObject;
  addressObject.insert(json_coordinates, patient.address.coordinates);
  addressObject.insert(json_street, patient.address.street);
  addressObject.insert(json_city, patient.address.city);
  addressObject.insert(json_zip, patient.address.zip);
  patientObject.insert(json_address, addressObject);

  QJsonDocument patientDocument(patientObject);
  qDebug() << patientDocument;
  return patientDocument;
}
