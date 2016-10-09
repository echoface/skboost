#include "stdio.h"

typedef struct Node {
    int data;   //indicator node data
    int next; //indicator next postion
}Slist;
/* 说明： 静态链表中， 我们需要明确， 数组中第一个节点0 和最后一个节点N-1 都不存放数据，用来作为辅助功能
    第一个节点index 0:  data不存放数据，next 指向第一个空闲的节点的index
    最后一个节点N－1:    data不存放数据； next 存储第一个有数据节点的 index;
    存有数据的最后一个node的 next 为0； 表示链表尾部； 
*/


int init_link(Slist list[], const int size) {
    for (int i = 0; i < size; i++) { // 完成空链表，每个都是空的
        list[i].next = i+1;
    }
    //set last node's cursor point to first index 0
    list[size-1].next = 0; // 因为还是空的， 所以next 存的下表就是第一个节点的index 表示空链表
    return 0;
}

bool insert_node(Slist list[], int position, int new_data) {
    //检测插入位置的合理性
    if (position < 1 || position > sizeof(list)/sizof(Slist)-1) {
        return false;
    }
    //找到next指向position的node；
    int new_data_index = get_next_free_node(list);
    if (new_data_index) { //下个节点有效， 也就是说链表还没满
        list[new_data_index].data = new_data; //存入数据
        //index 为N－1的节点 next存放的是第一个有数据的节点；所以从它开始寻找，找到要插入位置的index
        int target_postion_index = sizeof(list)/sizof(Slist)-1;
        for(int i=0; i < position -1; i++) {
           target_postion_index = list[target_postion_index].next; 
        }
        //我们要在target_postion_index节点后面插入我们的节点
        //step 1:新节点的next指向 target_postion_index 节点的next元素
        list[new_data_index].next = list[target_postion_index].next; 
        //step 2:将 target_postion_index 节点指向我们新插入的节点
        list[target_postion_index].next = new_data_index;
        return true;
    }
    //如果 new_data_index == 0的话， 说明static的这个链表已经填满了
    return false;
}

int get_next_free_node(Slist list[]) {
    //这里做两件事情， 
    // 1. 将数组中index为0的node的游标取出来， 因为这个游标保存的是第一个｀空闲｀node的index；
    // 2. 因为这个空闲的node已经被取出去了， 所以要修改 index为0的node的游标，让这个游标指向 步骤1 中取出来的node的游标｛即 指向下一个空node］｝
    int i = list[0].next;
    if (i != 0) //说明还存在空闲节点
        list[0].next = list[i].next; //不停的分配， 最后 list[0].next 会等于0；表示没有空间了
    return i;
}

bool delete_node(Slist list[], int index) {
    /* 先说明这个操作再写代码；要记得静态链表的结构：index为0的节点的next指向第一个空节点的index
        index为N－1的节点指向第有数据节点的index； 最后一个非空节点的next指向0
       所以要做的是： 
       1，将要删除节点的前一个节点的next指向 要删除节点的next
       2，将要删除节点的next指向第一个空节点的index，即list[0].next
       3. 将节点添加到空节点的组中， 即 list[0].next 指向当前要删除节点的index
        */
}

int main() {
    Slist list[1024];
    printf("sizeof list:%lu\n", sizeof(list)); //8192 byte
    init_link(list, 1024);
    return 0;
}