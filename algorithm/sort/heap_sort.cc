
#include <queue>
#include <vector>
#include "tool.h"

void heap_sort(int arr[], int len) {
  std::priority_queue<int, std::vector<int>, std::greater<int>> q;
  for (int i = 0; i < len; i++) {
    q.push(arr[i]);
  }
  for (int i = 0; i < len; i++) {
    arr[i] = q.top();
    q.pop();
  }
}

// ** 这里直接利用的Heap 的O(Nlog(N)) 的特性, 空间复杂度增加O(N)
int main() {
    int arr[10] = {2, 4, 3, 8,  1, 5 , 9, 7, 0, 6};
    printf("origin array:");print_arr(arr, 10);
    heap_sort(arr, 10);
    printf("final result:");print_arr(arr, 10);
}
