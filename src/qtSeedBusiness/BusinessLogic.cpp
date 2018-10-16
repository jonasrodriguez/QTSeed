#include "BusinessLogic.h"
#include <QDebug>
#include "Comms.h"
#include "DbManager.h"

BusinessLogic::BusinessLogic() : logged_user_("") {
  comms_ = std::unique_ptr<IComms>(new Comms);
  db_ = std::unique_ptr<IDb>(new DbManager);

  QObject::connect(comms_.get(),
                   SIGNAL(SendPatients(QVector<Patient>, QString)), this,
                   SLOT(ProcessPatients(QVector<Patient>, QString)));
}

void BusinessLogic::StartUp() {
  db_->StartUp();
  comms_->SetCommsAddress("http://127.0.0.1", "8080");

  GetPatientsList();
}

void BusinessLogic::ShutDown() {
  QCoreApplication::processEvents();
  db_.reset();
  comms_.reset();
}

bool BusinessLogic::LoginUser(QString user, QString pass) {
  if (db_->CheckUser(user, pass)) {
    logged_user_ = user;
    return true;
  } else
    return false;
}

void BusinessLogic::GetPatientsList() {
  comms_->GetPatientsList();
}

void BusinessLogic::ProcessPatients(QVector<Patient> patients, QString errors) {
  if (!errors.isEmpty()) {
    qDebug() << "Comms errors! " << errors;
  }
  else {
    emit SendPatientList(patients);
  }
}

void BusinessLogic::SaveNewPatient(Patient patient) {
  comms_->PostPatient(patient);
}

void BusinessLogic::DeletePatient(int patientId) {
  comms_->DeletePatient(patientId);
}
