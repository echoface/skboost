//a simple helloworld code show how to create a module

function hello(name) {
	console.log('hello ', name);
}

function greet(name) {
	console.log('nice to meet you, ', name)
}

module.exports = {
	hello: hello,
	greet: greet
};