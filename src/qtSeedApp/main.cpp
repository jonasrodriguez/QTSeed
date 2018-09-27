#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <memory>

#include "BusinessLogic.h"
#include "Dashboard.h"
#include "IBusiness.h"
#include "Login.h"

int main(int argc, char *argv[]) {
  QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

  QGuiApplication app(argc, argv);

  QQmlApplicationEngine engine;

  std::shared_ptr<IBusiness> business_logic(new BusinessLogic);
  business_logic->StartUp();

  Login login(nullptr, business_logic);
  engine.rootContext()->setContextProperty("loginLogic", &login);

  Dashboard dashboard(nullptr, business_logic);
  engine.rootContext()->setContextProperty("dashboardLogic", &dashboard);

  engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
  if (engine.rootObjects().isEmpty()) return -1;

  return app.exec();
}
