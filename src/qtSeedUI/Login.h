#include <QObject>
#include <memory>
#include "IBusiness.h"

class Login : public QObject {
  Q_OBJECT
  Q_PROPERTY(bool loginSuccess READ getLoginSuccess NOTIFY loginChanged)
 public:
  Login(QObject *parent, std::shared_ptr<IBusiness> &business_logic);

  bool getLoginSuccess() const { return login_success_; }
 signals:
  void loginChanged();

 public slots:
  void buttonLogin(QString user, QString pass);

 private:
  std::shared_ptr<IBusiness> business_logic_;
  bool login_success_;
};
