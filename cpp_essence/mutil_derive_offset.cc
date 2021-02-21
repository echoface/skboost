#include <iostream>

struct B {
  char ba[0xFF] = {};
};

struct B2 {
  char ba[0xF] = {};
};

class D : public B,
          public B2 {
  void* p;
};

int main() {
  D* dp = new D();
  B* bp = (B*)dp;
  B2* b2p = (B2*)dp;

  D* dpfromb2p = (D*)b2p;

  std::cout << "d ptr" << dp << std::endl;
  std::cout << "b ptr" << bp << std::endl;
  std::cout << "b2 ptr" << b2p << std::endl;
  std::cout << "dpfromb2p ptr" << dpfromb2p << std::endl;
  return 0;
}

