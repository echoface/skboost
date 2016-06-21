var fs = require("fs");

var data = fs.readFileSync("resource/data.txt");

console.log(data.toString());
console.log("program end");
