var fs = require("fs")

//version0中如果遇到文件非常非常大,整个程序会卡死, 同时也有内存风险
//so we create a readstream for src file, and using pipe copy to writestream from readstream
function copy(src, dst) {
    fs.createReadStream(src).pipe(fs.createWriteStream(dst))
}

function main(argv) {
    copy(argv[0],argv[1])
}

//process is a global variale, it express current proccess
main(process.argv.slice(2))
