#pragma once

class IComms {
 public:
  IComms() = default;
  virtual ~IComms() = default;

  virtual void StartUp() = 0;
  virtual void ShutDown() = 0;
};
