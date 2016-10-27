

int MaxSubSequenceSum(const int Array[], int size) {
/*
    int maxsum = 0, tmpsum = 0;
    
    for (int i=0; i < size; i++) {
        tmpsum = 0;
        for (int j=i; j < size; j++) {
           tmpsum += Array[j];
           if (tmpsum > maxsum) maxsum = tmpsum; 
        }
    }
    return maxsum;
*/
/*
    int tmpsum = 0, maxsum = 0;
    for (int i = 0; i < size; i++) {
        tmpsum += Array[i];
        if (tmpsum > maxsum)
            maxsum = tmpsum;
        else if (tmpsum < 0)
            tmpsum = 0;
    }
    return maxsum;
    */
    
}

int MaxSequenceSum_recursion(int Array[], int start, int end) {
    int lefMaxSum = 0, leftMaxBoardSum = 0;
    int rightMaxSum = 0, rightMaxBoardSum = 0;
    int center, i;
    
    /*处理基准情况，也就是说只有一个元素的情况，即start ＝＝ end*/
    if (start == end)
        return Array[start];
        
    /* recursion 条件 new_start = start, new_leftend = (start+end)/2*/
    //左边的最大和由分解后的函数求出， 具体怎么求出来我们不需要关心，
    lefMaxSum ＝ MaxSequenceSum_recursion(Array, start, (start+end)/2);
    rightMaxSum = MaxSequenceSum_recursion(Array, (start+end)/2+1, end);
    
    //这里我们不考虑上面分析的情况，我们假定就是对的， 这样利于分析不要被干扰，其实就是对的
    //我们现在计算包含start 到 end这个区间里分治之后左边部分包含最后一个元素的最大的值，
    //与右边部分包涵第一个元素的最大值；
    leftMaxBoardSum = 0; rightMaxBoardSum = 0;
    int lefttmpsum = 0; int righttmpsum = 0;
    for (int i = (start+end)/2; i > start; i--) {
       lefttmpsum += Array[i];
       if (lefttmpsum > leftMaxBoardSum)
            leftMaxBoardSum = lefttmpsum; 
    }
    for (int i = (start+end)/2+1; i < left; i++) {
        righttmpsum += Array[i];
        if (righttmpsum > rightMaxBoardSum)
            rightMaxBoardSum = righttmpsum;
    }
    
    int midsum = leftMaxBoardSum + rightMaxBoardSum;
    //比较所有的最大值，返回最大的一个
    if (midsum > lefMaxSum && midsum > rightMaxSum)
        return midsum;
    else if (lefMaxSum > midsum && leftMaxSum > rightMaxSum)
        reutn leftMaxSum;
    else
        return rightMaxSum;
}

