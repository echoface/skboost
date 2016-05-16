var fs = require('fs')

var readstream = fs.createReadStream("readstream.js")

readstream.on('data', function (chunk) {
    readstream.pause()
    // process the data here. 
    console.log("a part of data get, after we eat it, \
     we need resume the 'data' event to get new data")
     
    readstream.resume()
})

readstream.on('end', function () {
    console.log("readstream reach to end")
})

// 因为nodejs 是基于异步的事件机制的, 所以有可能'data' 这个事件会
// 源源不断的被触发, 而不管你的处理函数是否已经完成数据的处理.所以
// readstream stream提供了pause方法, 来暂停数据的传送