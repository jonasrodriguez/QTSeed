#pragma once
#include <QtNetwork>
#include <QNetworkAccessManager>
#include <QJsonObject>
#include "IComms.h"

class Comms : public IComms {
 public:
  Comms() {}
  ~Comms() = default;

  void SetCommsAddress(QString, QString) override;
  void GetPatientsList() override;

 private:
  void ProcessGetPatientsList(QNetworkReply *);
  Patient ReadJsonPatient(QJsonObject obj);

 private:
  QString ip_;
};
