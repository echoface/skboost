#include <iostream>

class Operator {
public:
    Operator() {
        std::cout << "Operator obj:" << ++m_objs << std::endl;
    }
    ~Operator() {
        std::cout << "Operator obj:" << --m_objs << std::endl;
    }
    
    /*重载类的成员运算符是， 形参省略运算符左边的成员this
      重载前置--运算符, --C  单目运算符，没有左边的参数
    */
    int operator--() { 
       return 1; 
    }
    int operator++(int i) { //重载后置单目运算符，奇怪的参数
        return 2;
    }

private:
    static long m_objs;
};

long Operator::m_objs = 0;

int main() {
    Operator op;
    int a = --op;
    int b = op++;
    std::cout << "a is:" << a << "b is:" << b << std::endl;
}



