//: [Previous](@previous)

import Foundation

var name:String  = " gonghuan"
var str = "Hello, \(name) wellcome to playground"

//: [Next](@next)

// [type_key:type_value] 是定义字典的简写形式
// 
// wroing var dic0:Dictionary = [:]
var dic1 = [String:Int]()
// or
var dic2 = [:] //it is a dictionary
dic2.dynamicType

var array = [] //it is a array
dic1.dynamicType


//可选值用变量后面加一个? 来表示
var optionalString: String? = "huan.gong"
print(optionalString)
var optionalString2: String?
print(optionalString2)
print(optionalString2 == nil)

// 使用let 和 if配合来处理缺失的情况
if let name = optionalString {
    var greeting = "hello , \(name)"
    print("\(greeting)")
} else {
    print("wellcomt to playground")
}

if let name = optionalString2 {
    var greeting = "hello , \(name)"
    print("\(greeting)")
} else {
    print("wellcomt to playground")
}

//使用 ?? 来表示, 如果一个变量的默认值缺失的话, 使用默认值来替代
print("Hi, nice to meet you \(optionalString)")
print("Hi, nice to meet you \(optionalString2)")

// for 循环的几种形式
var num = 2
for x in 1..<12 {
   num = 2 * num
}

var sum:Int = 0;
for var x:Int = 0; x < 100; ++x {
    sum += x
}
print(sum)


// 函数的申明
func max(array:Array<Int>) ->Int {
    var max:Int = 0
    for x in array {
        if x > max {
            max = x
        }
    }
    print(max)
    return max
}

var test_array: Array<Int> = [1, 2, 3, 4, 6, 12, 2, 8, 111, 90]
print("the max num in array is: \(max(test_array))")

// 可以使用元祖来返回多个值
func maxAndMin(array:Array<Int>) -> (max: Int, min: Int) {
    var maxvalue = array[0]
    var minvalue = array[0]
    for value in array {
        if value >= maxvalue {
            maxvalue = value
        } else if value <= minvalue{
            minvalue = value
        }
    }
    return (maxvalue, minvalue)
}

print("the max value and the min vaule is : \(maxAndMin(test_array))")

maxAndMin(test_array).dynamicType
var tuple = maxAndMin(test_array)
tuple.dynamicType
tuple.0
tuple.1
tuple.max
tuple.min


// 可以使用元祖来返回多个值
func maxAndMininarray(array:Array<Int>) -> [Int] {
    var maxvalue = array[0]
    var minvalue = array[0]
    for value in array {
        if value >= maxvalue {
            maxvalue = value
        } else if value <= minvalue{
            minvalue = value
        }
    }
    return [maxvalue, minvalue]
}

// 在swift中， 函数参数可以是可变个参数， 使用参数类型＋...来描述这些参数，
// 这些参数在函数内部是以数组的形式存在和访问的 eg：
func sumOf(values: Int...) ->Int {
    var sum = 0
    for num in values {
        sum += num
    }
    return sum
}

sumOf()
sumOf(1, 2, 3, 4)
//sumOf(1...100)
var serailNum = 1...100
serailNum.dynamicType


//函数可以作为返回值 ，也可以作为 参数， 使用（argType －> returnType）描述 eg：
func makeAdder(step:Int) -> (Int->Int) {
    func addnum(Num:Int)->Int {
       return step + Num
    }
    return addnum
}
var increment = makeAdder(3)
increment(8)

// function as a argument for another function

func isFive(value: Int) -> Bool {
    if value == 5 {
        return true
    } else {
        return false
    }
}

func hasAnyMatches(list: [Int], condition: (Int -> Bool)) -> Bool {
    for item in list {
        if (condition(item)) {
            return true
        }
    }
    return false
}

hasAnyMatches([1, 2, 4, 7, 8, 12, 111, 122, 990, 099],
              condition: isFive)

hasAnyMatches([1, 2, 4, 7, 8, 5, 111, 122, 990, 099],
              condition: isFive)

var numbers = [1, 2, 4, 7, 8, 5, 111, 122, 990, 099]
//闭包函数体通过 in 与 参数以及返回值 分开
// map 会逐个的将可迭代的原色调用 所map的函数
let  mapedNumbers = numbers.map({
    (number: Int) -> Bool in
    let result = (0 == number%2)
    return result
})
print(mapedNumbers)

//default sort
numbers.sort()

//numbers.sort(<#T##isOrderedBefore: (Int, Int) -> Bool##(Int, Int) -> Bool#>)
func OrderArray(value1:Int, value2:Int) -> Bool {
    return value1 > value2
}
numbers.sort(OrderArray)

//: 一个简便到没法看懂的写法
//: numbers.sort{$0 > $1}
let sortedNumbers = numbers.sort({
    $0 > $1
})

print(sortedNumbers)

// 类的神明与结构，类似C++ 只是没有那么多繁琐的东西了 like ＋1
class Person {
    let className = "Person"
    var name: String = "NONE"
    var address: String = "Unknow"
    var Phone: String = "Unknow"
    
    init() {
        name = "gonghuan"
    }
    
    deinit {
    }
    
    func infomation() ->String {
        return name + address +  Phone
    }
    
    func phoneNum() ->String {
        return Phone
    }
}

class blackMan : Person {
    var skinColor: Int = 0
    override func infomation() -> String {
        return "funny BlackMan"
    }
}















