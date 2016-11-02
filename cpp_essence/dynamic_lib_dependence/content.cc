#include "content.h"
#include <iostream>


Content::Content() {
    std::cout << __FUNCTION__ << "created" << std::endl;
}

Content::~Content() {
    std::cout << __FUNCTION__ << "destroyed" << std::endl;
}
    
void Content::content_01() {
    std::cout << __FUNCTION__ << "called" << std::endl;
}
void Content::content_02(int arg) {
    std::cout << __FUNCTION__ << "called" << std::endl;
}
void Content::content_03(int arg) {
    std::cout << __FUNCTION__ << "called" << std::endl;
}