#include <stdio.h>
/*
 * 插入排序相对于冒泡排序，数据上减少了数据交换的次数
 * */

void InsertSort_0(int arr[], int size) {
    for (int i=0; i < size - 1; i++) {
        
        int min_index = i;
        for (int j=i+1; j < size; j++) { //找出最小元素的下标
            if (arr[j] < arr[min_index])
                min_index = j;
        }
        if (min_index == i)  {//说明 arr[i] 就是最小的元素， 无需进行数据交换
            continue;
        }
        int tmp = arr[i];
        arr[i] = arr[min_index];
        arr[min_index] = tmp;
    }
}

int main() {

    int arr[10] = {2, 4, 3, 8,  1, 5 , 9, 7, 0, 6};
    InsertSort_0(arr, 10);
    for(int i=0; i < 10; i++) {
        printf("\n[%d]-", arr[i]);
    }
}
