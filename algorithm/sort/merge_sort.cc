#include "tool.h"
#include <type_traits>
#include <cstring>

void merge(int arr[], int left, int mid, int right) {
  if (right - left < 1) {
    return;
  }
  int size = right - left + 1;
  int dst[size] = {0};

  int dst_idx = 0;
  int l_iter = left;
  int r_iter = mid + 1;
  while (dst_idx < size) {
    if (arr[l_iter] < arr[r_iter]) {
      dst[dst_idx++] = arr[l_iter++];
    } else {
      dst[dst_idx++] = arr[r_iter++];
    }

    if (l_iter > mid) {
      while(r_iter <= right) {
        dst[dst_idx++] = arr[r_iter++];
      }
      break;
    }

    if (r_iter > right) {
      while(l_iter <= mid) {
        dst[dst_idx++] = arr[l_iter++];
      }
      break;
    }
  }
  memcpy(arr + left, dst, size * sizeof(int));
}

void merge_sort(int arr[], int left, int right) {
  if (left < right) {
    int mid = (left + right) / 2;
    merge_sort(arr, left, mid);
    merge_sort(arr, mid + 1, right);
    merge(arr, left, mid, right);
  }
}

int main() {
    int arr[10] = {2, 4, 3, 8,  1, 5 , 9, 7, 0, 6};
    printf("origin array:");print_arr(arr, 10);
    merge_sort(arr, 0, 10 - 1);
    printf("final result:");print_arr(arr, 10);
}
