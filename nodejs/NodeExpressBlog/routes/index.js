/*
var express = require('express');
var router = express.Router();

/* GET home page. * /
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

module.exports = router;
*/

module.exports = function(app) {


  app.get('/ajaxtest', function(req, res) {
    console.log("get ajaxtest")
    //res.send("../views/ajax.html");
    res.render("ajax");
  });

  app.get('/', function(req, res) {
    console.log("\ni get a request\n");
    res.render("index", {title: "HOME"})
  });

  app.get('/reg', function(req, res) {
    res.render("reg", {title: "enroll"})
  });
  app.post('/reg', function(req, res) {
  });

  app.get('/login', function(req, res) {
    res.render("login", {title: "login"})
  });
  app.post('/login', function (req, res) {
    //req.data = hasuser(data.name);
    //var result = passwordeque(data.psd.hash""
    //resulut == true;
    res.send("loggin suscees")


  });

  app.get('/post/search', function (req, res) {
    res.render("post", {title: "post"})
  });
  app.post('/post', function (req, res) {
  });

  app.get('/logout', function (req, res) {
  });

  app.get('/api/weatherinfo/shanghai', function(req, res, next) {
    /*
    console.log("\n==================================================\n");
    console.log(req);
    console.log("\n==================================================\n");
    console.log(res);
    console.log("\n==================================================\n");
    console.log(res);
    */

    res.json({
      success:1,
      name: "gonghuan",
      age: 24,
      image: "http://g.hiphotos.baidu.com/image/pic/item/c2cec3fdfc03924578c6cfe18394a4c27c1e25e8.jpg",
      sex: "man",
      sexy: "yes",
      rich: "yes",
      high: "yes",
      hansome: "ofcause"
    });

});
}

