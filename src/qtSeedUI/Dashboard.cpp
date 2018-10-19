#include "Dashboard.h"
#include <QDebug>

Dashboard::Dashboard(QObject *parent,
                     std::shared_ptr<IBusiness> &business_logic)
    : QObject(parent), business_logic_(business_logic), login_success_(false) {

    QObject::connect(business_logic_.get(), &IBusiness::SendLoginStatus, this, &Dashboard::ProcessLoginStatus);
}

void Dashboard::buttonLogin(QString user, QString pass) {
  business_logic_->LoginUser(user, pass);
}

void Dashboard::ProcessLoginStatus(bool loginStatus) {
  login_success_ = loginStatus;
  if (!login_success_) {
      login_error_ = QString("User/Password rejected by the server.");
      emit loginErrorChanged();
  }

  emit loginChanged();
}
