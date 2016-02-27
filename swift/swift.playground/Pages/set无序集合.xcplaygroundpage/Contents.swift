//: [Previous](@previous)

import Foundation

//: [Next](@next)
//: ### Set
//: set descript a serial number of item in a mess

//: Initialization
// hashable

let number = 10
number.hashValue

let PI = 3.14
PI.hashValue

let string: String = "Swift"

let emptySet = Set<Character>()

// ["a", "e", "b", "i", "f"]
let vowel: Set<Character> = ["a", "e", "b", "i", "f"]
vowel.dynamicType

var arrayInit:[Int]
// error: var arrayInit:Int[]
arrayInit.dynamicType

var arrayInit2: [Int] = [1, 2, 3]
// erro: var arrayInit2: Int[] = [1, 2, 3]

var evenarray = [2, 4, 6, 8, 10]
evenarray.dynamicType
evenarray.indexOf(2)
evenarray[0]


var evenSet: Set<Int> = [2, 4, 6, 8, 10]
evenSet.dynamicType
evenSet.contains(2)
evenSet.contains(3)
// 集合只含有同样的值只有一个.
evenSet.insert(2)
evenSet.insert(2)

var intvar = 12
intvar = Int(12/2.1)



vowel.count

emptySet.isEmpty


