#pragma once
#include <QJsonObject>
#include <QNetworkAccessManager>
#include <QtNetwork>
#include "IComms.h"

static const QString SeedEndpoint = "/seed/v1/patients";

class Comms : public IComms {
 public:
  Comms() {}
  ~Comms() = default;

  void SetCommsAddress(QString, QString) override;
  void GetPatientList() override;
  void PostPatient(Patient patient) override;
  void DeletePatient(int patientId) override;

 private:
  Patient ReadJsonPatient(QJsonObject obj);
  QByteArray CreateJsonPatient(Patient patient);

  void ProcessGetPatientsList(QNetworkReply *);
  void ProcessPostPatient(QNetworkReply *);
  void ProcessDeletePatient(QNetworkReply *);

 private:
  QString ip_;
};
