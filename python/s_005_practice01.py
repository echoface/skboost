
numbers = range(1, 5)
for i in numbers:
    for j in numbers:
        for k in numbers:
            if (i !=j and i != k and j != k):
                print(i, j, k)
