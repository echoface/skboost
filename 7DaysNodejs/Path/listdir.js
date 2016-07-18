var fs = require('fs')
var path = require('path')
function callback(pathname) {
    console.log(pathname)   
}

function listdir(dir, callback) {
    fs.readdirSync(dir).forEach(function (file) {
        var pathname = path.join(dir, file)
        
        if (fs.statSync(pathname).isDirectory()) {
            listdir(pathname, callback)
        } else {
            callback(pathname)
        }
    })
}
var dir = process.argv.slice(2)[0]
console.log("list all file on directory:", dir)
listdir(dir, callback)
process.exit(0)


//异步的这里我写不出来, 假以时日, 回来在战
function listdirAsync(dir, callback, finish) {

}
