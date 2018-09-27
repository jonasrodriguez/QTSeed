#pragma once
#include <memory>
#include "IBusiness.h"
#include "IComms.h"
#include "IDb.h"

class BusinessLogic : public IBusiness {
 public:
  BusinessLogic();
  ~BusinessLogic() = default;

  void StartUp() override;

  bool loginUser(QString user, QString pass) override;

 private:
  void CloseComms();

 private:
  std::unique_ptr<IComms> comms_;
  std::unique_ptr<IDb> db_;
  QString logged_user_;
};
