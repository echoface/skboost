#include "api.h"
#include <iostream>

#include "clientcontext.h"


void ClientContext::function_test() {
        api_->api_01();
        api_->api_02(2);
        api_->api_03(3);
    }