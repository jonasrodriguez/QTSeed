#include "BusinessLogic.h"
#include <QDebug>
#include "Comms.h"
#include "DbManager.h"

BusinessLogic::BusinessLogic() : logged_user_("") {
  comms_ = std::unique_ptr<IComms>(new Comms);
  db_ = std::unique_ptr<IDb>(new DbManager);
}

void BusinessLogic::StartUp() {
  comms_->StartUp();
  db_->StartUp();
}

void BusinessLogic::CloseComms() { comms_->ShutDown(); }

bool BusinessLogic::loginUser(QString user, QString pass) {
  if (db_->CheckUser(user, pass)) {
    logged_user_ = user;
    return true;
  } else
    return false;
}
