//: [Previous](@previous)

import Foundation

//: 数组初始化方法。定义初始化.
//: [Type]  是 Array<Type>的简写, 一般使用简写形式
//: [Int]() 相当于int的数组的构造函数.....
//define a empty arrary
var array1: Array<Int> = Array<Int>()
var array2: [Int] = array1
var array3 = array2 //推断.....
var array4 = [Int]()


// 构造函数...构造
var threeInts = [Int](count: 3, repeatedValue: 1)
// 通过运算推断.....
var sixInts = threeInts + threeInts

// c style initialize
var fiveInts = [1, 2, 3, 4, 5]

//Access and Modify an array

//count
fiveInts.count
array1.count

//empty
if array2.isEmpty {
    print("this array is empty")
}

//apend new item to array
array1.append(1)
array1.append(2)
array1.append(3)

array2 += array1
array2 += [12,33,44]


// indices
array1[0]
array1[0...1]
array1[0...2]
array1[0..<2]

//insert and remvoe element 
array2.insert(6, atIndex: 0)

array2.removeAtIndex(2)

for num in array2 {
    print(num)
}

fiveInts.enumerate()
for (index, value) in fiveInts.enumerate() {
    print("index: \(index), value: \(value)")
}

//another way to access array
var count = fiveInts.count
for x in 0..<count {
    print("index: \(x), value: \(fiveInts[x])")
}







