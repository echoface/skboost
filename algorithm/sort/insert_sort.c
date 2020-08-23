#include "stdio.h"

#include "tool.h"

void insert_sort(int a[], int len) {
  for (int i=1; i < len; i++) {
    int value = a[i]; //get the value
    int j = i-1;

    // 因为 [0-i] 所有元素都是已经排序的.所以如果i+1
    // 移动所有比a[i+1]大的元素, 之后将i+1放入空出的位置
    for (; j >= 0 && a[j] > value; j--) {
      int tmp = a[j];
      a[j] = a[j+1];
      a[j+1] = tmp;
    }
    a[j+1] = value;
    print_arr(a, len);
  }
}

int main() {
    int arr[10] = {2, 4, 3, 8,  1, 5 , 9, 7, 0, 6};
    printf("origin array:");print_arr(arr, 10);
    insert_sort(arr, 10);
    printf("final result:");print_arr(arr, 10);
}
