var pt = require('path')


var currentpath = process.cwd()
var normalizepath = pt.normalize(".")
// 通过normalize 函数之后, windows he unix*
// 下斜杠和反斜杠是不同的, 可以通过下面的正则表达式得到全平台可用的路径
// .replace(/\\/g, '/')

var ext_name = pt.extname(currentpath)

console.log(__filename)
console.log(__dirname)


console.log(process.env.PATH)
var env_path = process.env.PATH.split(':')

var delimiter = pt.delimiter

