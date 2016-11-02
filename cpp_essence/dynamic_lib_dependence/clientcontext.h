
#ifndef XXXXXXX_HH_
#define XXXXXXX_HH_

#include "api.h"

class ClientContext {
    public:

    ClientContext(Api* api) : api_(api)  {
        std::cout << __FUNCTION__ << "created" << std::endl;
    }   

    ~ClientContext() {
        api_ = NULL;
    }


    void function_test();

    private:
    Api* api_;
   
};

#endif