#include "Comms.h"
#include <QObject>
#include <QJsonDocument>

void Comms::SetCommsAddress(QString ip, QString port) {
  ip_ = ip + ":" + port;
};

void Comms::GetPatientsList() {

  QString errors;
  QTimer get_timer;
  QVector<Patient> patients;
  QString comm_errors;

  qDebug() << "Comms::GetPatients";
  QNetworkAccessManager* manager = new QNetworkAccessManager();

  QNetworkRequest request;
  request.setUrl(QUrl(ip_ + "/seed/v1/patients"));

  manager->get(request);
  QObject::connect(manager, &QNetworkAccessManager::finished,
                   [&](QNetworkReply* reply) { ProcessGetPatientsList(reply); });
};

void Comms::ProcessGetPatientsList(QNetworkReply *reply)
{
    qDebug() << "Comms::ProcessPatients()";
    QVector<Patient> patients;
    QString errors("");

    if (reply->error() != QNetworkReply::NoError) {
        errors = reply->errorString();
        emit SendPatients(patients, errors);
        return;
    }

    QJsonDocument jsonDoc = QJsonDocument::fromJson(reply->readAll());
    QJsonArray jsonArray = jsonDoc.array();

    foreach (const QJsonValue & value, jsonArray) {
        patients.push_back(ReadJsonPatient(value.toObject()));
    }

    emit SendPatients(patients, errors);
}

Patient Comms::ReadJsonPatient(QJsonObject obj) {

    Patient patient;
    patient.id = obj["id"].toInt();
    patient.name = obj["name"].toString();
    patient.surname = obj["surname"].toString();
    patient.dateOfBirth = obj["dob"].toString();

    PatientAddress address;
    QJsonObject add = obj["address"].toObject();

    address.coordinates = add["coordinates"].toString();
    address.street = add["street"].toString();
    address.city = add["city"].toString();
    address.zip = add["zip"].toString();
    patient.address = address;

    return patient;
}
