#pragma once
#include "IComms.h"

class Comms : public IComms {
 public:
  Comms();
  ~Comms() = default;

  void StartUp() override;
  void ShutDown() override;
};
