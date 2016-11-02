#include <iostream>

#include "clientcontext.h"
#include "content.h"
#include "mtm_impl.h"

int main() {

    MtmImpl* mtm = new MtmImpl();

    std::cout << "create clientContext" << std::endl;
    ClientContext* client = new ClientContext(mtm);

    std::cout << "call mtm->mtm_function() this will create content" << std::endl;
    mtm->mtm_function();

    std::cout << "call client->function_test() this will call mtm function" << std::endl;
    client->function_test();

    std::cout << "call mtm->getContent()" << std::endl;
    mtm->getContent();
    
}