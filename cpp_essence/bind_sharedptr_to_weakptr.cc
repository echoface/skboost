#include <iostream>
#include <functional>
#include <memory>

class B {
public:
  virtual void f() {
    std::cout << " f call " << std::endl;
  };
  std::function<void()> resume_;
};

void triggle(std::weak_ptr<B> weak_b) {
  std::shared_ptr<B> b_ptr = weak_b.lock();
  if (!b_ptr) {
    std::cout << "B has Gone when this be triggle" << std::endl;
  }
  std::cout << "trig :" << b_ptr.use_count() << std::endl;
  b_ptr->f();
}

int main() {

  //std::function<void(int, int, int)>
  std::shared_ptr<B> b_ptr = std::make_shared<B>();

  {
    //std::weak_ptr<B> weak(b_ptr);
    std::cout << "add weak count :" <<  b_ptr.use_count() << std::endl;

    b_ptr->resume_ = std::bind(triggle, b_ptr);
    std::cout << "after bind count :" <<  b_ptr.use_count() << std::endl;

    //b_ptr->resume_ = std::function<void()> null;
    std::function<void()> resume2_ = b_ptr->resume_;
    std::cout << "after copy count :" <<  b_ptr.use_count() << std::endl;
  }

  std::cout << "count :" <<  b_ptr.use_count() << std::endl;

  b_ptr->resume_();

  std::cout << "count :" <<  b_ptr.use_count() << std::endl;
  return 0;
}
