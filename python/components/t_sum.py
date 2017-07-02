def t_sum(*arg):
    sum = 0
    for v in arg:
        sum = sum + v
    return sum

if __name__ == '__main__':
    t_sum(1,2,3,4)
    t_sum(*[1,2,3,4])


