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

// 下面这个例子显示如何通过 pipe 和 zlib 模块，对文件进行压缩
var zlib = require('zlib');

fs.createReadStream('data.txt')
	.pipe(zlib.createGzip())
	.pipe(fs.createWriteStream('input.txt.gz'));


// 解压是同样地道理，但是这里有一个难题， 就是如果我需要对文件夹进行压缩解压呢？
// stackoverflow 上有个做法： http://stackoverflow.com/questions/15530435/node-js-zip-unzip-a-folder
// 大致思想是利用fstream 读取文件夹编程stream，利用pipe传递给 tar模块，tar模块继承自stream，
// 同样地利用pipe传递给一个zlib.Gzip, 最后通过pipe传递给一个writestream
/*
var fstream = require('fstream'),
    tar = require('tar'),
    zlib = require('zlib');

fstream.Reader({ 'path': 'path/to/my/dir/', 'type': 'Directory' }) /* Read the source directory * /
.pipe(tar.Pack()) /* Convert the directory to a .tar file * /
.pipe(zlib.Gzip()) /* Compress the .tar file * /
.pipe(fstream.Writer({ 'path': 'compressed_folder.tar.gz' }); /* Give the output file name * /

*/

































