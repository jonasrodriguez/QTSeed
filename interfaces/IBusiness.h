#pragma once
#include <QString>
class IBusiness {
 public:
  IBusiness() = default;
  virtual ~IBusiness() = default;

  virtual void StartUp() = 0;
  virtual bool loginUser(QString, QString) = 0;
};
