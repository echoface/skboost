import os
import sys

from datetime import datetime

now = datetime.now()
print(now)

# timestamp from 1970 second.ms
now.timestamp()

dt = datetime(2017, 8, 17, 10, 20)

t = 1502936400.0
dt2 =  datetime.fromtimestamp(t)
