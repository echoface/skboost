var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {
  res.send('respond with a resource');
  console.log("hello nice too meet you ")
});

router.get('/api/weatherinfo/shanghai', function(req, res, next) {
  print("\n==================================================\n");
  console.log(req);
  print("\n==================================================\n");
  console.log(res);
  print("\n==================================================\n");
  console.log(res);



  res.json({success:1});
  
});

module.exports = router;
