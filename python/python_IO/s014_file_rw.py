import os
import sys
try:
    f =  open('TestData/line_data.txt', 'r')
except FileNotFoundError as e:
    print("file not find")

try:
    for line in f.readlines():
        print(line, '#')
finally:
    f.close()


# more effective way, don't need f.close, with will to for us

products_list = []
with open('TestData/line_data.txt', 'r') as f:
    key_list = f.readline().split('#')
    for line in f.readlines():
        l = line.split('#')
        products_list.append({
            "name": l[0],
            "id": l[1],
            "price": l[2],
            "count": l[3][:-1]
        })
    
print(products_list)

from io import BytesIO
from io import StringIO

f = StringIO()
# f ""
f.write("HuanGong\n Nice To Meet YOU.");
# HuanGong\n Nice To Meet YOU.|
f.seek(0)
# | HuanGong\n Nice To Meet YOU.
f.readline()
# HuanGong
content = f.getvalue()

bf = BytesIO()
bf.write("国家".encode('utf_8'))
bf.writelines("中国".encode())
