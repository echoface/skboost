#include "tool.h"
#include "vector"
#include <vector>

/* return the position split left and right */
int partition(int arr[], int l, int r) {
  int piovt = l;
  int value = arr[l];

  int r_iter = r;
  int l_iter = l;

  while (l_iter < r_iter) {

    //find first value from left less than value
    while (l_iter < r_iter) {
      if (arr[r_iter] < value) {
        arr[piovt] = arr[r_iter];
        piovt = r_iter;
        //r_iter--;
        l_iter++;
        break;
      }
      r_iter--;
    }

    // find first value from right great than value
    while(l_iter < r_iter) {
      if (arr[l_iter] >= value) {
        arr[piovt] = arr[l_iter];
        piovt = l_iter;
        //l_iter++;
        r_iter--;
        break;
      }
      l_iter++;
    }
  }
  arr[piovt] = value;
  return piovt;
}

void quick_sort(int arr[], int l, int r) {
  if (l < r) {
    int new_piovt = partition(arr, l, r);
    quick_sort(arr, l, new_piovt - 1);
    quick_sort(arr, new_piovt+1, r);
  }
}

std::vector<std::vector<int>> cases {
    {1},
    {1, 2},
    {2, 1},
    {1, 2, 3},
    {2, 3, 1},
    {1, 2, 3, 4, 5},
    {5, 4, 3, 2, 1},
    {1, 3, 4, 2, 5},
    {4, 3, 5, 2, 1},
    {1, 4, 0, 5, 0, 9, 1, 2, 1, 0, 2, 6, 5, 8, 3, 3, 1, 3, 0, 7}
};

void test_partition() {
  for (auto& v : cases) {
    printf("orign:"); print_arr(v.data(), v.size());
    partition(v.data(), 0, v.size() - 1);
    printf("after:");print_arr(v.data(), v.size());
  }
}

void test_quick_sort() {
  for (auto& v : cases) {
    printf("orign:"); print_arr(v.data(), v.size());
    quick_sort(v.data(), 0, v.size() - 1);
    printf("after:");print_arr(v.data(), v.size());
  }
}

int main() {
  //test_partition();
  test_quick_sort();
  return 0;
}
