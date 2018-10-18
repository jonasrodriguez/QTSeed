#ifndef ICOMMS_H
#define ICOMMS_H

#include <QObject>
#include "BusinessDefinitions.h"

class IComms : public QObject {
  Q_OBJECT
 public:
  IComms() = default;
  virtual ~IComms() = default;

  virtual void SetCommsAddress(QString ip, QString port) = 0;
  virtual void GetPatientList() = 0;
  virtual void PostPatient(Patient patient) = 0;
  virtual void DeletePatient(int patientId) = 0;

 signals:
  void SendPatients(QVector<Patient> patients, QString errors);
};

#endif  // ICOMMS_H
