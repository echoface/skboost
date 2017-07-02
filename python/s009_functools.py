import sys
import functools

# int(str, base) //convert a number descript by str to a int value using base
# int("10", 2); 把二进制描述的字符串“10”转化成int型的值
int("11", 2) # 3
int("ff", 16) #255
int("234", 10) # 234

int2 = functools.partial(int, base=2)
int2("110") # 6

def say(content = ""):
    print("say " + content)

sayhello = functools.partial(say, "hello")

