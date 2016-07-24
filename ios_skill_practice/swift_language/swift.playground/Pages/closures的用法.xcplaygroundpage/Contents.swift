//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)
// swift 是在闭包这块真的是做的出神入化额， 可是，你考虑过程序狗的感受么！！！！


// 闭包就是一个代码块， 可以捕获闭包所在的上下文环境中得变量，值，函数等等
// 坑人第一弹： 尾随闭包(Trailing Closures)

// 函数声明！ 尾随闭包要求闭包必须作为函数最后一个参数才行，否则就错了
func someFunctionThatTakesAClosure(closure: () -> Void) { // 函数体部分
}
// 以下是不使用尾随闭包进行函数调用 
someFunctionThatTakesAClosure({
 //闭包主体部分 
})

// 以下是使用尾随闭包进行函数调用 看上去有点奇葩吧， 这竟然是个函数调用， 
// 可官方教程上就是这样的，对！ 它就是函数调用....
someFunctionThatTakesAClosure() {
// 闭包主体部分 
}

// 如果函数只需要闭包表达式一个参数,当您使用尾随闭包时,您甚至可以把 () 省略掉:
someFunctionThatTakesAClosure {
    // 闭包主体部分
}
