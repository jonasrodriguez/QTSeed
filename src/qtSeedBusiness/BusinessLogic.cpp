#include "BusinessLogic.h"
#include <QDebug>
#include "BusinessDefinitions.h"
#include "Comms.h"
#include "DbManager.h"

BusinessLogic::BusinessLogic() : logged_user_("") {
  comms_ = std::unique_ptr<IComms>(new Comms);
  db_ = std::unique_ptr<IDb>(new DbManager);
}

void BusinessLogic::StartUp() {
  QVector<patient> pat;
  db_->StartUp();
  comms_->SetCommsAddress("http://127.0.0.1", "8080");
  comms_->GetPatients(pat);
}

bool BusinessLogic::loginUser(QString user, QString pass) {
  if (db_->CheckUser(user, pass)) {
    logged_user_ = user;
    return true;
  } else
    return false;
}
