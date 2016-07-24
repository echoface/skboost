//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

//: 类型的重命名， 在swift中使用typealias 关键字， 作用等同于C语言中的typedefine
//: 一个典型的例子....., 不同C语言的是 swift中需要用等于号来指明
typealias FruitName = String

var name: FruitName = "apple"

//: 元组的定义和使用
//: 定义， 使用（ ）来标示
var networkStatus = (404, "page not found")

//: 访问
networkStatus.0
networkStatus.1

let (code, status) = networkStatus
print("network error code is : \(code)")
print("network error string is : \(status)")

//如果只需要访问元组中的部分值得时候， 分解的时候可以通过 _ 来排除不想访问的值
let (code2, _) = networkStatus
print("network error code is : \(code2)")

//: 同时， 可以在定义元组的时候给其内部元素命名
var studentinfo = (Name:"HuanGong", Age: 24, Score: 98)
studentinfo.Name
studentinfo.Age
studentinfo.Score






