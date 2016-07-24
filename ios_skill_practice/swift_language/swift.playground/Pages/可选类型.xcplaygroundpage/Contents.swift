//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

//: optional 可选类型
let possibleNumber = "123" // it is a string
let convertedNumber = Int(possibleNumber)
// convertedNumber 被推断为类型 Int？ 或者类型 Optional Int
// 因为这个构造器类型可能失败， 所以构造器返回的是个可选类型 （opational) Int 而不是一个Int
// 可以选得Int 被写作 Int？ 而不是 Int，  ？ 问好暗示这个值是可选类型.....

//: nil 可以给一个可选变量赋 nil 来表示它 没有值
var serverResponseCode: Int? = 404
serverResponseCode = nil
serverResponseCode

var serverResponseCode2: Int?
serverResponseCode2

var number2: Int
//number2  // it will give a swift compile error, because number2 is not a optional

var number3: Int?
number3     // it will work well, cauz... it is a optional

//: 可选变量名称后面强制加上 ! 表示强制解析（force unwrapping）, !!!: 这是很危险的操作， 使用前一定要确保判断了 可选变量值 != nil
//number3! // it will give run time error, cauz it was nil

number3 = 43434
number3! // it ok
number3

/*
可选绑定
使用可选绑定(optional binding)来判断可选类型是否包含值,如果包含就把值赋给一个临时常量或者变 量。可选绑定可以用在 和 语句中,这条语句不仅可以用来判断可选类型中是否有值,同时可以将可选 类型中的值赋给一个常量或者变量。 和 语句,请参考控制流。
像下面这样在 语句中写一个可选绑定:

if [let | var] constantName = someOptional {
statements
}

你可以包含多个可选绑定在 语句中,并使用 子句做布尔值判断。
if let firstNumber = Int("4"), secondNumber = Int("42") where firstNumber < secondNumber {
print("\(firstNumber) < \(secondNumber)")
}
// prints "4 < 42"

*/

//: 隐式解析可选类型

let possibleString: String? = "An optional string."
let forcedString: String = possibleString! // 需要惊叹号来获取值
/*
// got error: error: value of optional type 'String?' not unwrapped; did you mean to use '!' or '?'?
let valueString: String = possibleString
*/

// 使用 隐式解析可选类型
let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString // 不需要感叹号




