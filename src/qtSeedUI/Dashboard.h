#include <QObject>
#include <memory>
#include "IBusiness.h"

class Dashboard : public QObject {
  Q_OBJECT
 public:
  Dashboard(QObject *parent, std::shared_ptr<IBusiness> &business_logic);

 private:
  std::shared_ptr<IBusiness> business_logic_;
};
