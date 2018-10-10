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
  request.setUrl(QUrl(ip_ + "/seed/v1/patients"));

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
