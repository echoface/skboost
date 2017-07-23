import os

current_path = os.path.abspath(".")

os.name == "posix"
#true

os.uname()
#posix.uname_result(sysname='Darwin', nodename='macmini.local', release='16.6.0', version='Darwin Kernel Version 16.6.0: Fri Apr 14 16:21:16 PDT 2017; root:xnu-3789.60.24~6/RELEASE_X86_64', machine='x86_64')

os.environ

os.environ.clear()


os.mkdir("tmp")
os.rmdir("tmp")

os.path.split("/Home/gh/file.txt")
# ('/Home/gh', 'file.txt')

fd = open("file.txt")
fd.close()

os.rename("file.txt", "new.txt")

os.remove("new.txt")

# 列表生成器
[x for x in os.listdir('.') if os.path.isdir(x)]

