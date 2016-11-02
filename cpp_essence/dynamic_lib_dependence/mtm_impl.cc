#include "mtm_impl.h"
#include <iostream>

    void MtmImpl::mtm_function() {
       content_ = new Content();
        
       api_01(); 
       api_02(2); 
       api_03(3); 

       content_->content_01();
       content_->content_02(2);
       content_->content_02(3);
    }
