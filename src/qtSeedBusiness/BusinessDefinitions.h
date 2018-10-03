#ifndef BUSINESSDEFINITIONS_H
#define BUSINESSDEFINITIONS_H

#include <QString>

struct PatientAddress {
  QString coordinates;
  QString street;
  QString city;
  QString zip;
};

struct Patient {
  int id;
  QString name;
  QString surname;
  QString email;
  QString dateOfBirth;
  PatientAddress address;
};

#endif  // BUSINESSDEFINITIONS_H
