
nums = range(1, 5)
for i in nums:
    for j in nums:
        for k in nums:
            if (i != j and i != k and j != k) :
                print(i, j, k)
