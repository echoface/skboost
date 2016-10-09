import os
import posixpath

list = ['g', 'h', 'ni', 'hao']
# 访问
list[0]
list[len(list) - 1] #last one
#list.count(value) -> index 
#list.append(object)
#list.extend(iterable)
#list.insert(index, object)
#list.pop()
#list.remove(value)  类似于其它语言中的数组， 但是里面可以存各种变量


#tuple 由（）来定义， 类似于list列表 但是值一旦定义之后便不能修改
tuple1 ＝ (1， 2，3)
#tuple1[0] = 1 #TypeError: 'tuple' object does not support item assignment
tuple1[0]
#!!!!!! 只有一个元素时要小心
tuple2 = (1,) # 如果写成 tuple2= （1） 那么这只是定义了一个数值变量1而已


#python 是用缩进来定义代码块的

#条件判断等代码块的开始用：冒号来标示
if 3 > 2 :
    print("this is True!")
elif 5 > 3:
    print("elif 5>3")
else:
    print("else")
    
   