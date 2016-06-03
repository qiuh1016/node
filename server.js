// var fs = require('fs')
// http = require('http')
// path = require('path');
// var server = http.createServer(function(req, resp) {
// 	var transfer = new Transfer(req, resp);
// 	var filePath = '/Users/Desktop/QQyinle_427.apk';
// 	transfer.Download(filePath);
// });
// server.listen('8888');

// console.log('Server running at http://127.0.0.1:8888/');


var express = require('express');
var app = express();

var serverVersion = 1.2;
var forceToUpdate = false;
var versionJSON = {version: serverVersion, forceToUpdate: forceToUpdate};

app.get('/', function (req, res) {
   console.log("主页 GET 请求");
   res.send('Hello GET');
})

app.get('/version', function (req, res) {
   console.log("版本 请求");
   res.send(JSON.stringify(versionJSON))
   // res.send('{"version" : 1.1, "forceToUpdate": false}');
})

app.get('/download',function(req,res,next){
  var filePath = '/Users/qiuhong/Desktop/node/app-release.apk';
  console.log("下载 请求");
  res.download(filePath,'autoupdate.apk');
});

app.get('/login', function (req, res) {
   console.log("登录 请求");
   var username = req.query.username;
   var password = req.query.password;

   if (username == "admin" && password == "123") {
   	res.send('登录成功');
   } else {
   	res.send('用户名密码错误');
   } 

})


var server = app.listen(8081, function () {
  var host = server.address().address
  var port = server.address().port
  console.log("应用实例，访问地址为 http://%s:%s", host, port)
})