#include <iostream>

#include "api.h"
#include "content.h"

class MtmImpl: public Api {
    public:
    MtmImpl() {
        std::cout << __FUNCTION__ << "created" << std::endl;
    }
    ~MtmImpl() {
        std::cout << __FUNCTION__ << "gone" << std::endl;
    }

    void mtm_function();

    //override
    void api_01() override {
        std::cout << __FUNCTION__ << "called" << std::endl;
    }

    void api_02(int arg) override {
        std::cout << __FUNCTION__ << "called" << std::endl;
    }

    void api_03(int arg) override {
        std::cout << __FUNCTION__ << "called" << std::endl;
    }

    Content* getContent() {
        return content_;
    }
    private:
    Content* content_;

};