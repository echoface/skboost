class Student(object):

    @property
    def score(self):
        print("getter score")
        return self._score
    
    @score.setter
    def score(self, v):
        print("setter score")
        self._score = v

std = Student()

std.score = 100
print(std.score)

from enum import Enum

Month = Enum('Month', (1, 2, 3,4,5,6,7,8,9,10,11,12))