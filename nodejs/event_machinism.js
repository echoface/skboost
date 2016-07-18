
//EventEmitter 对象如果在实例化时发生错误，会触发 'error' 事件。
//当添加新的监听器时，'newListener' 事件会触发，
//当监听器被移除时，'removeListener' 事件被触发。

var events = require("events")

var eventEmitter = new events.EventEmitter();


var onBtClicked = function clicked(key) {
	console.log("bt clicked");
}

eventEmitter.on('bt_click', onBtClicked);


console.log("program is going to leave")

eventEmitter.emit("bt_click");

setTimeout(function () {
	eventEmitter.emit('timeout2s');
}, 2000);

eventEmitter.addListener('timeout2s', function () {
	console.log('第三个侦听函数');
})

eventEmitter.on('timeout2s', function (){
	console.log('第一个侦听函数');
});

eventEmitter.on('timeout2s', function (){
	console.log('第二个侦听函数');
});



