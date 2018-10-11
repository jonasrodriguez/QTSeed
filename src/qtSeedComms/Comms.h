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
  void GetPatientsList() override;
  void PostPatient(Patient patient) override;

 private:
  Patient ReadJsonPatient(QJsonObject obj);
  QJsonDocument CreateJsonPatient(Patient patient);

  void ProcessGetPatientsList(QNetworkReply *);
  void ProcessPostPatient(QNetworkReply *);

 private:
  QString ip_;
};
