#include "Login.h"
#include <QDebug>

Login::Login(QObject *parent, std::shared_ptr<IBusiness> &business_logic)
    : QObject(parent), business_logic_(business_logic), login_success_(false) {}

void Login::buttonLogin(QString user, QString pass) {
  login_success_ = business_logic_->LoginUser(user, pass);

  emit loginChanged();
}
