content: content.cc content.h
    g++ -shared -fpic -o libclientcontext.so clientcontext.cc
    g++ -c -g mtm_impl.cc
    ar cr libmtm.a mtm_impl.o
    g++ -c -g content.cc
    g++ -c -g content.cc
    g++ -o main.bin main_parts.cc libmtm.a libcontent.a -L. -lclientcontext