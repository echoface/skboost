# function

# python using isinstance judge the the obj type

# using raise TypeError thrown a error info
def function(arg1, arg2, arg3):
    if not isinstance(arg2, (int, float, str)): # arg check
        raise TypeError("input args type error")
    print(arg1, arg2, arg3)
    return True

function(1, "gonghuan", 2.0)

#pay attention to default arg value!!!: see below

def f2(l = []):
    l.append("end")
    print(l)

f2(); # ["endl"]
f2([1,2,3,4,5]) # [1,2,3,4,5,"end"]
f2(); # ["end", "end"]
f2(); # ["end", "end", "end"]
f2([1]) # [1,"end", "end", "end", "end"]
# python 中， 默认参数是在编译运行前就确定下来的一个变量， l只是指向这个变量[] 而已， 当你传入实参时， 内部就用的实参， 当没有传入参数时， 用的就是默认的参数对象[]， 而[]是可变的， 每次调用f2()之后， 就往这个默认参数中append了一个数据， 导致默认的这个数据一直在变， 所以形参一定要是个不可变量，不然很容易掉进坑里


# 函数的可变参数 用*var 表示， tuple list 等数据可以在变量前加一个*list *tuple来将list tuple转化成可变参数量

def add(*nums):
    int sum = 0
    for v in nums:
        sum = sum+v
    print(nums)

add(1, 2)
