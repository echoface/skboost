#include <iostream>

class Base {
  public:
    Base() {
      std::cout << "base created" << std::endl;
    }
    ~Base() {
      std::cout << "base destroyed" << std::endl;
    }

    virtual void foo() {
      std::cout << "base::foo called" << std::endl;
    }
  private:
    virtual void p_foo() {
      std::cout << "base::p_foo virtual function called" << std::endl;
    }
    void private_f() {
      std::cout << "Base::priavte_f called" << std::endl;
    }
  protected:
    virtual void protected_f() {
      std::cout << "base::protected_f called" << std::endl;
    }
};

class Item : public Base {
  public:
    Item() {
      std::cout << "Item created" << std::endl;
    }
    ~Item() {
      std::cout << "Item destroyed" << std::endl;
    }

    virtual void foo() override {
      std::cout << "Item::foo called" << std::endl;

      //ERROR: attempt access base::private function
      //Base::private_f(); //failed this is Base Private


      //OK: attemp access Base::protected function
      Base::protected_f(); //ok


      // access p_foo()
      p_foo();
    }
  private:
    virtual void p_foo() override {
      std::cout << "Item::p_foo called" << std::endl;

      //error: becuase private member f can only access by itself
      //Base::private_f(); //failed this is Base Private function

      //error: becuase private member f can only access by itself
      //Base::p_foo(); //still error
    }
  protected:
    virtual void protected_f() override {
      std::cout << "Item::protected_f called" << std::endl;
    }
};

int main() {

  Item *item = new Item(); //先构造base，再构造Item，析构时先析构Item 再析构Base

  //test 1 base pointer to access function 所谓的动态绑定， 就是说函数调用以指针实际指向的对象决定， 在base中用virtual指定，
  //那么这个函数就会在base对象的vtable中，实际调用的时候，在实际的对象（继承自base的类对象）中根据vtable中的函数找到实际对
  //像中的实现进行调用， 这个就是动态绑定；
  Base* pbase = item;
  pbase->foo(); //在类外部，public继承的话 只能访问base & item 的public成员

  // 如果一个函数定义成private， 那么，这个函数只能由对象本身的函数访问， 继承对象也不能访问基类的private成员； 私有就是私有
  // 自己之外谁也不可以访问

  // protected: 就是表明这个函数是受到保护的， 他能由自己， 自己的派生对象访问， 但是不能在对象之外的代码访问， 代码之外只能
  // 访问public的东西；

  delete pbase;
}
