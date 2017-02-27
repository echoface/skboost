#!/user/bin/python
# -*- coding: UTF-8 -*-

money = int(raw_input("input money"))

bounds = (1000000, 600000, 400000, 200000, 100000, 0)
percent = (0.01, 0.015, 0.03, 0.05, 0.075, 0.1)

sum = 0
for i in range(0, 6):
    if (money > bounds[i]):
        sum += percent[i] * (money - bounds[i])
        money = bounds[i]

print(sum)
