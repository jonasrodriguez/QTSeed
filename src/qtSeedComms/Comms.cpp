#include "Comms.h"
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QObject>

void Comms::SetCommsAddress(QString ip, QString port) {
  ip_ = ip + ":" + port;
};

void Comms::GetPatients(QVector<patient>& patients) {
  qDebug() << "GetPatients" << endl;
  QNetworkAccessManager* manager = new QNetworkAccessManager();
  QNetworkRequest request;
  request.setUrl(QUrl(ip_ + "/seed/v1/patients"));
  manager->get(request);
  QObject::connect(manager, &QNetworkAccessManager::finished,
                   [=](QNetworkReply* reply) { qDebug() << reply->readAll(); });
};
