//从流中读取数据
var fs = require('fs');
var data = '';

var readablestream = fs.createReadStream('data.txt')
readablestream.setEncoding('utf8');
readablestream.on("data", function (chunk) {
	data += chunk;
	console.log('i got a chunk of data:', chunk);
});

readablestream.on("end", function () {
	console.log(data)
});

readablestream.on("error", function (error) {
	console.log(error.stack);
});

readablestream.on("finish", function () {
	console.log("readablestream finished");
});

console.log("code end");



// 将数据流写入文件
var writerstream = fs.createWriteStream('output.txt');
writerstream.write(data, 'utf8');
writerstream.end();
writerstream.on("finish", function () {
	console.log("writefinished");
});

writerstream.on("error", function (err) {
	console.log("error info", err.stack);
});

console.log("code end for writestream");




// pipe stream

var wtitestream2 = fs.createWriteStream("output2.txt");
readablestream.pipe(wtitestream2);
console.log("pipe stream for read to write end");

