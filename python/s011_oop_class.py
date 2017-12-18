class Student:
    
    def __init__(self, name, age, id):
        self.name_ = name
        self.age_  = age
        self.id_  = id
        self.__private_data = {}

    def get_private(self):
        return self.__private_data 

    def set_private(self, data):
        self.__private_data = data
    
    def class_method(data):
        print(data)
    
    class_data = "Student"

std = Student("Huan.Gong", age = 25, id = "000001")
print(std.name_, std.age_, std.id_)

## error , __parivate_data is private
#print(std.__private_data)
# access it by class function
std.set_private("hello private data")
# still can access the private data by a "weird" way,
print(std._Student__private_data)

print(Student.class_data)

# can add property outside
std.class_level = "01"

Student.class_method("hello")



## inherit 

class Base:
    def __init__(self, data1, data2):
       self.__data1 = data1
       self.__data2 = data2
    
    def update_data1(self, data1):
        self.__data1 = data1
        print("BaseClass update_data1")
        return self.__data1

    def update_data2(self, data2):
        self.__data2 = data2
        return self.__data2

class Inherit(Base):
    def __init__(self, data):
        super.__init__(super, data)

    def update_data1(self, data1):
        print("subclass update_data1")        
        return super.update_data1(super, data1)

base = Inherit("gonghuan")
print(base.update_data1("huan"))


