var http = require('http')

http.createServer(function (request, response) {
    
    var body = []
    //console.log(request.method);
    console.log("\nrequest header:\n",request.headers);
    /*
    request.on('data', (chunk) => {
        console.log('i got a chunk of data')
        body.push(chunk)
    });*/
    
    request.on('data', function (chunk) {
        body.push(chunk);
    });
    
   request.on('end', function () {
        body = Buffer.concat(body);
        console.log('\nI got a chunk of data:\n')
        console.log(body.toString());
    });
    
    /*request.on('end', ()=> {
        body = Buffer.concat(body)
        console.log(body.toString())
    })*/
    
    
    response.writeHead(200, "text")
    response.end("hello world");
}).listen(9222);



// create a test client
var option = {
    hostname: 'localhost',
    port: 9222,
    path: '',
    method: 'POST',
    headers: {
        'Content-Type': 'application/x-www-form-urlencoded'
    }  
};

var request = http.request(option, function (response) {
    console.log("\nserver's response:\n", response.headers)
})

request.write('hello nice to meet you here')
request.end()