var express = require('express');
var app = express();
app.use(express.static('http'));
app.use(express.static('h5'));

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

var selectSQL = 'select * from t_user limit 10';
var insertSQL = 'insert into t_user(name) values("conan"),("fens.me")';

var server = app.listen(8084, function () {
	var host = server.address().address;
	var port = server.address().port;
	console.log("应用实例，访问地址为 http://" + host + ":" + port);
})

app.get('/', function (req, res) {
	console.log("主页 GET 请求");
	res.sendFile(__dirname + '/http/login.html');
})

app.get('/report_submit', function (req, res) {
	console.log("report_submit GET 请求");
	var project = req.query.project;
	var submitter = req.query.submitter;
	var importance = req.query.importance;
	var completed = req.query.completed;
	var issures = req.query.issures;
	var plan = req.query.plan;

	if (project == "" || submitter == "") {
		res.send('项目代号和提交者不能为空！'); 
	} else {
		insertSQL = 'INSERT INTO week_reports SET ';
		insertSQL = insertSQL + 'project = "'+project+'",';
		insertSQL = insertSQL + 'submitter = "'+submitter+'",';
		insertSQL = insertSQL + 'importance = "'+importance+'",';
		insertSQL = insertSQL + 'completed = "'+completed+'",';
		insertSQL = insertSQL + 'issures = "'+issures+'",';
		insertSQL = insertSQL + 'plan = "'+plan+'";';
		conn.query(insertSQL, function (err, res1) {
			if (err) {
				console.log(err);
				res.send('{"success" : false}');
			} else {
				res.send('{"success" : true}');
        	}
    	});
  	}
})

app.get('/report_update', function (req, res) {
	console.log("report_update GET 请求");
	var id = req.query.databaseID;
	var project = req.query.project;
	var submitter = req.query.submitter;
	var importance = req.query.importance;
	var completed = req.query.completed;
	var issures = req.query.issures;
	var plan = req.query.plan;
	
	if (project == "" || submitter == "") {
		res.send('项目代号和提交者不能为空！'); 
	} else {
		insertSQL = 'UPDATE week_reports SET ';
		insertSQL = insertSQL + 'project = "'+project+'",';
		insertSQL = insertSQL + 'submitter = "'+submitter+'",';
		insertSQL = insertSQL + 'importance = "'+importance+'",';
		insertSQL = insertSQL + 'completed = "'+completed+'",';
		insertSQL = insertSQL + 'issures = "'+issures+'",';
		insertSQL = insertSQL + 'plan = "'+plan+'" where id = ' + id +';';
		conn.query(insertSQL, function (err, res1) {
			if (err) {
				console.log(err);
				res.send('{"success" : false}');
			} else {
				res.send('{"success" : true}');
        	}
		});
	}
})

// app.get('/download',function(req,res,next){
//   var filePath = __dirname + '/app-release.apk';
//   console.log("下载 请求");
//   res.download(filePath,'autoupdate.apk');
// });


// app.get('/add', function (req, res) {
//    console.log("add 请求");
//    var name = req.query.name;

//    if (name != null) {
//     insertSQL = 'insert into t_user(name) values("' + name +'")';
//     conn.query(insertSQL, function (err, res1) {
//         if (err) {
//           console.log(err);
//           res.send('{"success" : false, "result": ' + err + '}');
//         } else {
//           res.send('{"success" : true, "result": ' + res1 + '}');
//         }
//     });
//   }

// })

app.get('/report_delete', function (req, res) {
	console.log("delete 请求");
	var id = req.query.id;

	if (id == null) {
		res.send("参数错误");
		return;
	} else {
		var SQL = 'delete from week_reports where id= "' + id +'"';
		conn.query(SQL, function (err, res1) {
			if (err) {
				console.log(err);
				res.send('{"success" : false}');
			} else {
				res.send('{"success" : true}');
			}
		});
	}
})

 
app.get('/login', function (req, res) {
	console.log("登录 请求");
	var username = req.query.username;
	var password = req.query.pwd;

	var selectSQL = 'select * from user where username = "' + username + '"';
	conn.query(selectSQL, function (err, rows) {
		if (err) {
			console.log(err);
			res.send('{"success" : false, "result": "datebase error"}');
		} else {
			if (rows.length == 0) {
				res.send('{"success" : false, "result": "用户名不存在"}');
				return;
			} else if (rows.length > 1){
				res.send('{"success" : false, "result": "用户名存在重复，请联系管理员"}');
				return;
			};

			if (password == rows[0]['password']) {
				res.send('{"success" : true, "result": "登陆成功", "permission": '+rows[0]['permission']+'}');
			} else {
				res.send('{"success" : false, "result": "用户名密码错误"}');
			}
		}
	});
})

app.get('/change_pwd', function (req, res) {
    console.log("change_pwd GET 请求");

    var username = req.query.username;
    var oldPwd = req.query.oldPwd;
    var newPwd = req.query.newPwd;

    selectSQL = 'select * from user where username = "' + username + '"';
    var updateSQL = 'UPDATE user SET password = "' + newPwd +'" where username = "' + username + '"';
    //查询用户名 和 密码
    conn.query(selectSQL, function (err, rows) {
        if (err) {
          console.log(err);
          console.log(rows);
          res.send('{"success" : false, "result": "datebase error"}');
        } else {
        	if (oldPwd == rows[0]['password']) {
        		//原密码正确 修改密码
        		conn.query(updateSQL, function (err, rows1) {
			        if (err) {
			          	console.log(err);
			          	res.send('{"success" : false, "result": "datebase error"}');
			        } else {
			         	res.send('{"success" : true, "result": "修改成功"}');
			        }
			    });	
        	} else {
        		res.send('{"success" : false, "result": "原密码错误"}');
        	};

        }
    });
})

app.get('/getReportsByName', function (req, res) {
	var limit = req.query.limit;
	var username = req.query.username;
	if (username == 'all') {
		selectSQL = 'select * from week_reports order by id desc limit ' + limit;
	} else {
		selectSQL = 'select * from week_reports WHERE submitter = "'+ username +'" ORDER BY id DESC LIMIT ' + limit;
	}
   
	conn.query(selectSQL, function (err, rows) {
		if (err) console.log(err);
		console.log("SELECT ==> ");
		res.send(rows);
	});
})

// app.get('/getLastReports', function (req, res) {
//   var num = req.query.num;
//   selectSQL = 'select * from week_reports ORDER BY "add_time" DESC LIMIT ' + num; //where `No.` = ' + id;
   
//   conn.query(selectSQL, function (err, rows) {
//       if (err) console.log(err);
//       console.log("getLast ==> ");
//       console.log(rows);
//       res.send(rows);
//   });

// })

app.get('/getProjectByName', function (req, res) {
	var username = req.query.username;
	if (username == '李培正' || username == '裘鸿' || username == 'all') {
		selectSQL = 'select * from project';
		conn.query(selectSQL, function (err, rows) {
			if (err) console.log(err);
			console.log("SELECT ==> ");
			res.send(rows);
		});
	} else {
		//TODO: 2个项目经理的情况
		selectSQL = 'select * from project WHERE manager = "'+ username +'"';
		conn.query(selectSQL, function (err, rows) {
			if (err) console.log(err);
			console.log("SELECT ==> ");
			res.send(rows);
		});
	}

})


