#include <QObject>
#include <memory>
#include "IBusiness.h"

class Login : public QObject {
  Q_OBJECT
  Q_PROPERTY(bool loginSuccess READ getLoginSuccess NOTIFY loginChanged)
  Q_PROPERTY(QString loginError READ getLoginError NOTIFY loginErrorChanged)
 public:
  Login(QObject *parent, std::shared_ptr<IBusiness> &business_logic);

  bool getLoginSuccess() const { return login_success_; }
  QString getLoginError() const { return login_error_; }

 signals:
  void loginChanged();
  void loginErrorChanged();

 public slots:
  void ProcessLoginStatus(bool loginStatus);
  void buttonLogin(QString user, QString pass);

 private:
  std::shared_ptr<IBusiness> business_logic_;
  bool login_success_;
  QString login_error_;
};
