/*
分析Node.js 的 HTTP 服务器：
 - 第一行请求（require）Node.js 自带的 http 模块，并且把它赋值给 http 变量。
 - 接下来我们调用 http 模块提供的函数： createServer 。
   这个函数会返回 一个对象，这个对象有一个叫做 listen 的方法，
   这个方法有一个数值参数， 指定这个 HTTP 服务器监听的端口号。

   所以当我们用浏览器打开http://127.0.0.1:8889/时， 
   我们的这个server就接收到了这个HTTP请求， 我们通过response.end('hello world!');
   返回给这个请求一个数据， 数据的格式是{'Content-Type': 'text/plain'}
*/

var http = require("http");


function rpl(request, response) {
	response.writeHead(200, {'Content-Type': 'text/plain'});

	//send data to requester
	response.end('hello world!');
}

http.createServer(rpl).listen(8889);

console.log("server running at http://127.0.0.1:8889/")