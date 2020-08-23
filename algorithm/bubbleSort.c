#include "stdio.h"

void BubbleSort_0(int arr[], int size) {
    for(int i=0; i < size-1; i++) {
        for(int j=i+1; j < size; j++) {
            if (arr[i] > arr[j]) {
                int tmp = arr[i];
                arr[i] = arr[j];
                arr[j] = tmp;
            }
        }
    }
}

void BubbleSort_1(int arr[], int size) {
    for(int i=0; i < size-1; i++) {

        /* 这里这个内循环的目标就是将i这个位置的元素要变成没有比较过的元素中
         * 最小的［假设升序］；那么我们就要从最右端size－1开始，用相邻的两个
         * 元素两两比较；如果左边>右边； 则交换两个元素即可!
         */
        for(int j=size-1; j > i; j--) {
            if (/*左边*/arr[j-1] > arr[j]/*右边*/) {
                int tmp = arr[j];
                arr[j] = arr[j-1];
                arr[j-1] = tmp;
            }
        }
    }
}

int main() {
    int arr[10] = {2, 4, 3, 8,  1, 5 , 9, 7, 0, 6};
    //BubbleSort_0(arr, 10);
    BubbleSort_1(arr, 10);
    for(int i=0; i < 10; i++) {
        printf("\n[%d]-", arr[i]);
    }
}
