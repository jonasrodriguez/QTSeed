#include "Dashboard.h"

Dashboard::Dashboard(QObject *parent,
                     std::shared_ptr<IBusiness> &business_logic)
    : QObject(parent), business_logic_(business_logic) {}
