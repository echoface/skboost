require("fs")

console.log("seems it work well")

var buf = new Buffer("nice to meet you")
// 打印出buffer来
console.log(buf)
// access the byte by index
buf[2] // 'c' of nice
// buffer has 6 Constuctor from [string, array, size, buffer, ]
var bufFromArray = new Buffer([0x11, 0x22, 0x33, 0x44])

var bufwithSizeByte = new Buffer(2)
//bufwithSizeByte = "hello nice to meet you, nodejs" //

/*
Buffer与字符串有一个重要区别。字符串是只读的，并且对字符串的任何修改得到的都是
一个新字符串，原字符串保持不变。至于Buffer，更像是可以做指针操作的C语言数组。
例如，可以用[index]方式直接修改某个位置的字节。
*/

console.log(bufwithSizeByte) // he   
bufwithSizeByte[1] = "c"
console.log(bufwithSizeByte) // hc




