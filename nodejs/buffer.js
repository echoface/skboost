/*JavaScript 语言自身只有字符串数据类型，没有二进制数据类型。但在处理像TCP流或文件流时，
必须使用到二进制数据。因此在 Node.js中，定义了一个 Buffer 类，该类用来创建一个专门存放二进制数据的缓存区。

  在 Node.js 中，Buffer 类是随 Node 内核一起发布的核心库。Buffer 库为 Node.js
带来了一种存储原始数据的方法，可以让 Node.js 处理二进制数据，每当需要在 Node.js 中处理I/O操作中移动的数据时，
就有可能使用 Buffer 库。原始数据存储在 Buffer 类的实例中。一个 Buffer 类似于一个整数数组，
但它对应于 V8 堆内存之外的一块原始内存。

*/

//create buffer
var buf0 = new Buffer(10);
var buf1 = new Buffer([8,8,0,0,1,1,2,2]);
var buf2 = new Buffer("buffer data", "utf-8");

//写入缓冲区
// buf.write(string[, offset[, length]][, encoding]), return the real size writen to buffer
var len = buf0.write("data write to buffer", 0, 20, 'utf-8');
console.log("len:",len); //10, 虽然我们想将“data write to buffer”这20字节全部写入， 但是buf0只有10字节的大小，所以写入成功地只有十个字节
// buffer.toString(encoding = utf-8, start=0, end = buffer_end)

//从缓冲区读取数据
console.log(buf0.toString("utf-8"));




function another_test() {
	console.log("\n=========another test start===========\n")

	buf = new Buffer(26);
	for (var i = 0 ; i < 26 ; i++) {
	  buf[i] = i + 97;
	}

	console.log( buf.toString('ascii'));       // 输出: abcdefghijklmnopqrstuvwxyz
	console.log( buf.toString('ascii',0,5));   // 输出: abcde
	console.log( buf.toString('utf8',0,5));    // 输出: abcde
	console.log( buf.toString(undefined,0,5)); // 使用 'utf8' 编码, 并输出: abcde

	console.log("\n=========another test END===========\n")
}

var evt = require("events");
var eventEmitter = new evt.EventEmitter();
eventEmitter.on('exit', another_test);
eventEmitter.emit("exit");



//将 Buffer 转换为 JSON 对象

var json = buf1.toJSON();
console.log(json);




//缓冲区合并
var new_buff = Buffer.concat([buf0, buf1, buf2]);
console.log(new_buff.length);



//缓冲区比较
var res = buf1.compare(new Buffer([8,8,0,0,1,1,2,2]));
console.log(res); // 0
res = buf1.compare(new Buffer("hello"));
console.log(res);

res = Buffer.compare(buf2, buf1);
console.log(res);




//copy
/*
buf.copy(targetBuffer[, targetStart[, sourceStart[, sourceEnd]]])
targetBuffer - 要拷贝到得目标 Buffer 对象。
targetStart - 数字, 可选, 默认: 0
sourceStart - 数字, 可选, 默认: 0
sourceEnd - 数字, 可选, 默认: buffer.length

no return value
*/

buf0.copy(buf1);



//缓冲区裁剪
/*
Node 缓冲区裁剪语法如下所示：
buf.slice([start[, end]])
参数
参数描述如下：
start - 数字, 可选, 默认: 0
end - 数字, 可选, 默认: buffer.length
返回值
**返回一个新的缓冲区，它和旧缓冲区指向同一块内存，但是从索引 start 到 end 的位置剪切。**
*/

var buffer1 = new Buffer('HuanGong'); //8
// 剪切缓冲区
var buffer2 = buffer1.slice(0,4);
console.log("buffer2 content: " + buffer2.toString()); //Huan


// lenght 属性； 标示buffer所占用的内存长度
var name = new Buffer("属性");

console.log('byte of "属性"：', name.length)


//随机读取
buf1[0] //8
buf1[1] //8


