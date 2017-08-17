#include <thread>
#include <iostream>
#include <functional>
#include <memory>

struct Config {
  bool run_mode;
  int  thread_count;
  int  max_file_count;
};

class Base {

  Config GetConfig() {
    return config_.get();
  }

private:
  std::shared_ptr<Config*> config_;
};


int main() {

}
