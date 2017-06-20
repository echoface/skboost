def log(func):
    def wrap(*args, **kw):
        print('before call:')
        _rs = func(*args, **kw)
        print('after call')
        return _rs
    return wrap

@log
def say(content):
    print("say:", content)

say("Hello Huan")

import functools

def log2(text):
    def decorator(func):
        def wrap(*args, **kw):
            print('before call: %s' % text)
            _rs = func(*args, **kw)
            print('after call: %s' % text)
            return _rs
        return wrap
    return decorator

@log2("HuanGong")
def say2(content):
    print("say: %s"% content)
    return ""

say2("Nice To Meet you")

int16 = functools.partial(int, base=16)
int2 = functools.partial(int, base=2)

int2("100") # 4
int16("0f") #15