var net  = require('net');

net.createServer(function (socket) {
    socket.on('data', function (data) {
        socket.write([
            'HTTP/1.1 200 OK',
            'Content-Type: text/plain',
            'Content-Length: 11',
            '',
            'socket server give your a gretting'
        ].join('\n'));
    });
}).listen(9222)



function next(i, len, callback) {
    if (i < len) {
        async(arr[i], function (value) {
            arr[i] = value;
            next(i + 1, len, callback);
        });
    } else {
        callback();
    }
}(0, arr.length, function () {
    // All array items have processed.
});