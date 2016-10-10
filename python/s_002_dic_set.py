# dict in python equal map in other language
# it's a key-value storage in memory
# seems like json object

dic = dict() # create a new empty dictionary {}

#>>> dict(one=1, two=2)
#{'two': 2, 'one': 1}

dic = {'name': "gonghuan", 'age': 24}
# access   impl by hash map
# dic[key]
dic['name'] # gonghuan 
dic.get("age") # 24
dic.get("h", -1) # tell it when no 'h' return the -1

#delete
dic.pop("age") #remove age item

#和list比较，dict有以下几个特点：

#查找和插入的速度极快，不会随着key的增加而变慢；
#需要占用大量的内存，内存浪费多。
#而list相反：

#查找和插入的时间随着元素的增加而增加；
#占用空间小，浪费内存很少。
#所以，dict是用空间来换取时间的一种方法。

# set is a serail of unique value storage in a set
num_set = set([1,2,3,4, 3]) # {4,2,1,3}
num_set.add(3) # ok, but no effect if set has had the value 3
num_set.remove(3)

num_set2 = {1, 3, 8}

num_set & num_set2 # new set {1,3}
num_set | num_set2 # new set {1,2,3,4,8}


#list can imply a sort method make it be a ordered list
li = [1, 2, 4, 3, 0]
li.sort() # li -> [0, 1, 2, 3, 4]

#对于不变对象来说，调用对象自身的任意方法，也不会改变该对象自身的内容。
#相反，这些方法会创建新的对象并返回，这样，就保证了不可变对象本身永远是不可变的。

a = 'abc'
b = a.replace('a', "A")
a # abc
b # Abc
