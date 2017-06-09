import os

import sys

# define funtion

def f():
    print("hello")

print(os.path.curdir)

absdirname = os.path.abspath(".")

#2^3
pow(2, 3)

## ** 
2**3 # 2^3
2*3  # 2x3

def f_2(n = 2):
    print(n)

f_2()

#return value
def f_return():
    return 1, 2, 3


# 定义默认参数要牢记一点; 默认参数必须指向不变对象
# python 中， 默认参数在函数编译解析的时候就确定了， 如果默认参数是一个可变的对象的话，这个对象可能被改变，导致函数行为异常
#eg：
def err_default_arg(l = []): # default arg is [], it is list, it can be change
    l.append("hello")

err_default_arg() # output ["hello"]
err_default_arg() # output ["hello", "hello"]

# correct def and behaviour
def ok_default_arg(L = None):
    if L is None:
        L = []
    L.append("hello")
    return L


# 定义可变参数； “*变量名”，这样来表示可变参数
def sum(*args):
    sum = 0
    for n in args:
        sum = sum + n
    return sum

sum(1,2,3,4,5)

# python 允许将一个list truple通过在前面加一个*的方式作为可变参数传递进取
sum(*range(101))


#关键字参数
def keyarg(name, **kw):
    print(name, kw) #kw 打印出来应该是一个对象 对一个dict对象 用**可以传递参数

d = {"n": 1, "k": 2}
keyarg("huan", **d)

d = {'a': 1, 'b': 2, 'c': 3}
for k in d:
    print(k) ## output key, a, b, c

for k in d:
    print(d[k]) ## output value

for v in d.values():
    print(v) ## out 1, 2, 3 values

for k, v in d.items():
    print(k, v) ##a 1