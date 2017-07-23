d = dict()

d["huan"] = "gonghuan"
d["card"] = "many"
d['age'] = 1991

print(d)

import pickle
import pickletools as pt

bytesio = pickle.dumps(d)
fd = open("obj_list.txt", "wb")
pickle.dump(d, fd)
fd.close()



fd = open("obj_list.txt", "rb")
d = pickle.load(fd)
fd.close()
print(d)

import os

if os.path.isfile("obj_list.txt"):
    os.remove("obj_list.txt")


import json

d = dict(name='huan', age=1992, score=100)
fd = open("t.json", "w")
json.dumps(d, fd)
fd.close()

fd = open("t.json", "r")
json.load("t.json", fd)
fd.close()

if os.path.isfile("t.json"):
    os.remove("t.json")


# 类序列化成对象

class Animal(object):
    def __init__(self, name, sex, t):
        self.name_ = name
        self.sex_ = sex
        self.type_ = t

a = Animal(name="cat", sex="femal", t="mimi")
def Animal2Dict(anm):
    return {
        'name':  anm.name_,
        'sex': anm.sex_,
        'type': anm.type_
    }

json.dumps(a, default=Animal2Dict)
