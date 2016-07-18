var fs = require("fs")

//利用同步方法将文件读取出来并作为参数写入到新的文件中
function copy(src, dst) {
    fs.writeFileSync(dst, fs.readFileSync(src))
}

function main(argv) {
    copy(argv[0],argv[1])
}

//process is a global variale, it express current proccess
main(process.argv.slice(2))
