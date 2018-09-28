#pragma once
#include <QtNetwork>
#include "IComms.h"

class Comms : public IComms {
 public:
  Comms() {}
  ~Comms() = default;

  void SetCommsAddress(QString, QString) override;
  void GetPatients(QVector<patient>&) override;

 private:
  QString ip_;
};
