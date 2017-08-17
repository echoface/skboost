#include <thread>
#include <mutex>
#include <condition_variable>
#include <stdlib.h>
#include <functional>
#include <queue>
#include <iostream>
#include <unistd.h>
#include "ts_queue.h"

class RunLoop {
public:
    RunLoop() :
        running_(false),
        thread_(NULL) {
    }

    virtual ~RunLoop() {
        quit_();
        if (thread_)
            delete thread_;
    }


    std::function<void()> Start() {
        if (running_) return NULL;

        auto t = std::bind(&RunLoop::Run, this);

        thread_ = new std::thread(t);

        quit_ = std::bind([&]() {
          std::unique_lock<std::mutex> lck(mutex_);
          if (running_) {
            running_ = false;
          }
          con_.notify_all();
        });
        return quit_;
    }

    void Wait() {
      if (thread_ && thread_->joinable())
        thread_->join();
    }

    void Put(int x) {
      queue_.push(x);
      {
        std::unique_lock<std::mutex> lck(mutex_);
        con_.notify_one();
      }
    }
private:
    void Run() {
        running_ = true;
        std::cout << "runloop start" << std::endl;
        while(running_) {
            std::unique_lock<std::mutex> lck(mutex_);
            while(queue_.empty() && running_) {
                con_.wait(lck);
            }

            while (!queue_.empty()) {
                int v;
                if (queue_.try_pop(v))
                    handle(v);
            }
        }
        std::cout << "runloop end";
    }

    void handle(int& t) {
        std::cout << t << " - ";
        usleep(10);
        fflush(NULL);
    }
private:
    bool running_;

    std::mutex mutex_;
    std::thread* thread_;
    SafeQueue<int> queue_;
    std::condition_variable con_;

    std::function<void() > quit_;
};
