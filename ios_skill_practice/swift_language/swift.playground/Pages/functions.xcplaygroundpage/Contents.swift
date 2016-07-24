//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)




//: 参数也可以既当做传 入参数,也当做传出参数,也就是说,一旦函数执行结束,传入的参数值可以被修改。
//: swift中奇葩的地方（叫做超出C语言理解范围） 函数参数中有个外部参数名 与内部参数名， 第一个参数外部参数名可以省略， 后面的不能省略， 要省略的话要用 _ 符号来表明这是省略的
//: !!!一般情况下,第一个参数省略其外部参数名,第二个以及随后的参数使用其局部参数名作为外部参数名




//: right 的写法
var value1: Int = 112
var value2: Int = 24

func swapInt(var v1:Int, var _ v2:Int) {
    let sum:Int = v1 + v2
    v1 = sum - v1
    v2 = sum - v2
}
swapInt(12, 11) //: 若函数定义没有写那个 _ 那调用的哲理就要显式的写外部变量名
//: 表明不会改变外部变量的值
value1
value2



/* /: 会报错 的写法
var value1: Int = 112
var value2: Int = 24

func swapInt(var v1:Int, var v2:Int) {
let sum:Int = v1 + v2
v1 = sum - v1
v2 = sum - v2
}
swapInt(12, 11) //: 这句报错， 说v2 没有传递， tmd 明明传了， 这就是外部变量名搞的鬼
*/


func printInt(v1:Int) {
    print("the value 1 is:\(v1), the value 2 is:\(v1)")
    //    swapInt(12, v2: 11)
}
printInt(1)


//: swift 默认是常量参数， 如果需要在函数中改变值， 在参数变量前加 var 关键字标示

//: 从上面的代码中可以看出， 如果使用上面的那种方式， 你只能改变的时函数作用域内部的值， 参数是值复制的方式， 外部变量其实都没有别改变， 要想改变， see 下面的方法， 好比C++中得引用， C中得指针....
//: 输入输出参数(In-Out Parameters)
func swapInt2( inout v1:Int, inout v2:Int) {
    let tmp = v1
    v1 = v2
    v2 = tmp
}

var var1: Int = 111
var var2: Int = 222
swapInt2(&var1, v2: &var2)
var1
var2
/* 其他的写法
func swapInt2( inout v1:Int, inout _ v2:Int) {
let tmp = v1
v1 = v2
v2 = tmp
}

var var1: Int = 111
var var2: Int = 222
swapInt2(&var1, &var2)

func swapInt2( inout first v1:Int, inout second v2:Int) {
let tmp = v1
v1 = v2;v2 = tmp
}

var var1: Int = 111
var var2: Int = 222
swapInt2(first: &var1, second: &var2)

*/






//: 函数类型， 函数类型是指 一个函数的参数和返回值综合起来表明函数的样式
func f() { //: 函数类型 （）-> Void
    return
}

func f1() -> Int { //: 函数类型 （）-> Int
    return 1
}

func f2(v1: Int, _ v2: Int) -> String { //: 函数类型 （Int, Int）-> String
    return "one"
}
//: 有了函数类型， 我们自然可以定义函数类型的变量 常量， 可选变量 etc
var myf: ()->Void = f
let myf_const: ()->Void = f
let myf_const_and_opt: ()->Void?
myf_const_and_opt = f

//: ？？？？ 这是闭包吗？ clouse
func chooseStepFunction(backwards: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backwards ? stepBackward : stepForward
}
var currentValue = -4
let moveNearerToZero = chooseStepFunction(currentValue > 0)
// moveNearerToZero now refers to the nested stepForward() function
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")
// -4...
// -3...
// -2...
// -1...
// zero!
