#include <iostream>

class Operator {
public:
    Operator() {
        //这样做是危险的，因为构造函数可以重载..... 所以看到m_objs < 0 不要奇怪
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
    
    int operator [] (int index) {
        return index;
    }
    int operator = (Operator& op) { //只能重载成成员函数
        std::cout << __FUNCTION__ << std::endl; 
        return 2;
    }
    
    friend inline std::ostream& operator << (std::ostream& os, Operator& op) {
        os << &op;
        return os;
    }
    
    Operator(const Operator& op) {
        std::cout << "kaobei constructor" << std::endl;
    }


private:
    static long m_objs;
};

long Operator::m_objs = 0;

int main() {
    Operator op;
    Operator op2;
    int a = --op;
    int b = op++;
    int cc = (op2 = op);
    std::cout << cc << std::endl;
    Operator c = op2;
    std::cout << "a is:" << a << "b is:" << b << std::endl;
    std::cout << op << ":" << op2 << ":" <<  c << std::endl;
    int index = op2[1];
    std::cout << index << std::endl;
}



