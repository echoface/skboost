#include <cstddef>
#include <cstdio>
#include <vector>
#include <memory>
#include <iostream>
#include <unistd.h>

class Node {
public:
  Node(int v)
    : next_(nullptr),
      value_(v) {
  }
  bool IsOdd() {
    return value_ % 2 == 1;
  }

  bool HasNext() {return next_ != nullptr;}

  Node* next_ = nullptr;
  int value_;
};

void Print(Node* head) {
  while(head) {
    std::cout << head->value_ << "->";
    head=head->next_;
  }
  std::cout << std::endl;
}


bool NeedSwap(Node* node, bool head_odd) {
  return head_odd && !node->IsOdd() ;
}

Node* SplitList(Node* head) {
  if (head == nullptr || head->next_ == nullptr) {
    return head;
  }
  // 指向第一个odd节点
  Node* p =  head;

  Node* q =  nullptr;
  Node* q_start = nullptr;
  bool head_odd = head->IsOdd();

  Node* iter = head->next_;
  while(iter->HasNext()) {
    if (head_odd != iter->IsOdd()) {
      break;
    }
    iter = iter->next_;
  };

  Print(head);
  Print(iter);

  while (iter->HasNext()) {
    if (head_odd != iter->next_->IsOdd()) {

      std::cout << "skip:" << iter->value_ << std::endl;
      iter = iter->next_;

    } else {

      std::cout << "swap:" << iter->value_ << std::endl;

      Node* n = iter->next_; //save

      iter->next_ = n->next_;      // 使n 脱离list
      n->next_ = nullptr;
      if (q == nullptr) {
        q_start = q = n;
      } else {
        q->next_ = n;
        q = n;
      }
    }
  }
  q->next_ = head;
  return q_start;
}

int main(int argc, char** argv) {
  std::vector<int> values = {1, 2, 3, 4, 5, 5, 6, 8, 10, 21};
  Node* head = nullptr;
  Node* iter = head;
  for (int v : values) {
    if (iter) {
      iter->next_ =  new Node(v);
      iter = iter->next_;
    } else {
      head =  iter = new Node(v);
    }
  }
  Print(SplitList(head));
  return 0;
}
