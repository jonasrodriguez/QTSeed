#ifndef IBUSINESS_H
#define IBUSINESS_H

#include <QObject>
#include "BusinessDefinitions.h"

class IBusiness : public QObject {
  Q_OBJECT
 public:
  IBusiness() = default;
  virtual ~IBusiness() = default;

  virtual void StartUp() = 0;
  virtual void ShutDown() = 0;
  virtual bool loginUser(QString user, QString password) = 0;

 signals:
  void SendPatientList(QVector<Patient> patients);

 public slots:
  virtual void ProcessPatients(QVector<Patient> patients, QString errors) = 0;
};

#endif  // IBUSINESS_H
