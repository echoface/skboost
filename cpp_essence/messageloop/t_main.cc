#include <thread>
#include <stdio.h>
#include <stdlib.h>
#include "./run_loop.h"

#include <unistd.h>
int main() {
    int nthread = std::thread::hardware_concurrency();
    std::cout << "support threads:" <<  nthread << std::endl;

    RunLoop run_loop;

    auto quit = run_loop.Start();

    std::vector<std::thread*> t_v;
    for (int i = 0; i < 1000; i++) {
        t_v.push_back(new std::thread([&run_loop]() {
                                    for (int n = 100; n > 0; n--) {
                                    run_loop.Put(n);
                                }
                    }));
    }

    for (const auto& i : t_v)
        i->join();


    quit();
    std::cout << "quit loop" << std::endl;
    run_loop.Wait();
    std::cout << "end" << std::endl;
    return 0;
}
