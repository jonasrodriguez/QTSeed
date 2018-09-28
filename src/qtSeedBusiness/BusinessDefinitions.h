#pragma once

#include <QString>

struct patientAddress {
  QString coordinates;
  QString street;
  QString city;
  int zip;
};

struct patient {
  int id;
  QString name;
  QString surname;
  QString email;
  QString dateOfBirth;
  patientAddress address;
};
