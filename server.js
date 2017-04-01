var express = require('express');
var app = express();

var serverVersion = 1.2;
var forceToUpdate = false;
var dbTestID = "";
var versionJSON = {
            version       : serverVersion, 
            forceToUpdate : forceToUpdate
          };

//db
var mysql = require('mysql');
var conn = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'root',
    database:'nodejs',
    port: 3306
});
conn.connect();

var selectSQL = 'select * from t_user limit 10';//where id = 3';
var insertSQL = 'insert into t_user(name) values("conan"),("fens.me")';
//query
function select() {
	conn.query(selectSQL, function (err, rows) {
	    if (err) console.log(err);

	    console.log("SELECT ==> ");
	    for (var i in rows) {
	        dbTestID = rows[i]['name'];
	        console.log(rows[i]['name']);
	        versionJSON = {
	          version       : serverVersion, 
	          forceToUpdate : forceToUpdate, 
	          dbTestID      : dbTestID
	        };
	    }
	});
} 

function add() {
	conn.query(insertSQL, function (err, res) {
        if (err) console.log(err);
        console.log("INSERT Return ==> ");
        console.log(res);
    });
}

//select();

app.get('/', function (req, res) {
   console.log("主页 GET 请求");
   res.sendFile('/Users/qiuhong/Desktop/node/http/index.html');
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


app.get('/add', function (req, res) {
   console.log("add 请求");
   var name = req.query.name;

   if (name != null) {
    insertSQL = 'insert into t_user(name) values("' + name +'")';
    conn.query(insertSQL, function (err, res1) {
        if (err) {
          console.log(err);
          res.send(err);
        } else {
          res.send(res1);
        }
    });
  }

})

app.get('/delete', function (req, res) {
  console.log("delete 请求");
  var id = req.query.id;
  var name = req.query.name
  if (id != null && name != null) {
    res.send("请只输入一个参数");
    return;
  }

  if (id != null) {
    var SQL = 'delete from t_user where id= "' + id +'"';
    conn.query(SQL, function (err, res1) {
        if (err) {
          console.log(err);
          res.send(err);
        } else {
          res.send(res1);
        }
    });
  } else if (name != null) {
    var SQL = 'delete from t_user where name= "' + name +'"';
    conn.query(SQL, function (err, res1) {
        if (err) {
          console.log(err);
          res.send(err);
        } else {
          res.send(res1);
        }
    });
  }

})

 
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

app.get('/test', function (req, res) {
   
   // res.send('<h2>用户名密码错误</h2>');
   res.sendFile('/Users/qiuhong/Desktop/node/qq.png');
   console.log('\ntest 请求:');
   console.log(req.headers);

})

app.get('/get', function (req, res) {
   
   conn.query(selectSQL, function (err, rows) {
      if (err) console.log(err);

      var json = "[";
      var jsonOne = ";"
      console.log("SELECT ==> ");
      for (var i in rows) {
          jsonOne = {
              id : rows[i]['id'],
              name : rows[i]['name'],
              create_date : rows[i]['create_date'],
          }
          json = json + jsonOne + ","
      }
      json = json + "]"
      res.send(jsonOne);
  });

})

var server = app.listen(8081, function () {
  var host = server.address().address
  var port = server.address().port
  console.log("应用实例，访问地址为 http://%s:%s", host, port)
})