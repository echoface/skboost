var http = require('http')
var zlib = require('zlib')

http.createServer(function (request, response) {
    var i = 1024, data = ''
    while(i--) {
        data += '.'
    }
    // 如果client 接受gzip的数据,那么我们就将数据压缩后传递
    if ((request.headers['accept-encoding'] || '').indexOf('gzip') != -1) {
        zlib.gzip(data, function (error, gzipedData) {
            response.writeHead(200, {
                'Content-Type': 'text/plain',
                "Content-Encoding": 'gzip'
            })
            response.end(gzipedData);
        })
    } else {
        response.writeHead(200, {
            'Content-Type': 'text/plain'
        })
        response.end(dta)
    }
}).listen(9222)

var options = {
        hostname: 'localhost',
        port: 9222,
        path: '/',
        method: 'GET',
        headers: {
            'Accept-Encoding': 'gzip, deflate'
        }
};

http.request(options, function (res) {
    var body = []
    res.on('data', function (chunk) {
        body.push(chunk);
    })
    res.on('end', function () {
        body = Buffer.concat(body);
        
        if (res.headers['content-encoding'] === 'gzip') {
            zlib.gunzip(body, function (error, result) {
                console.log("\nGet Data:\n", result.toString());
            })
        } else {
            console.log("\nGet unziped data:\n", body.toString());
        }
    })
}).end();