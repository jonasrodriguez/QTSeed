#pragma once
#include <QVector>
#include "BusinessDefinitions.h"

class IComms {
 public:
  IComms() = default;
  virtual ~IComms() = default;

  virtual void SetCommsAddress(QString, QString) = 0;
  virtual void GetPatients(QVector<patient>&) = 0;
};
