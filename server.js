var express = require('express');
var bodyParser = require('body-parser');
var multer  = require('multer');
var xlsx = require('node-xlsx');
var fs = require('fs');

var app = express();
app.use(express.static('http'));
app.use(bodyParser.urlencoded({ extended: false }));
app.use(multer({ dest: '/tmp/'}).array('file'));

// 创建 application/x-www-form-urlencoded 编码解析 
var urlencodedParser = bodyParser.urlencoded({ extended: false })

//db
var mysql = require('mysql');
var db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'root',
    database:'nodejs',
    port: 3306
});
db.connect();

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

app.get('/index', function (req, res) {
	console.log("主页 GET 请求");
	res.sendFile(__dirname + '/http/index.html');
})

var report = require('./report.js');

app.get('/report_submit', function (req, res) {
	var project = req.query.project;
	var submitter = req.query.submitter;
	var importance = req.query.importance;
	var completed = req.query.completed;
	var issures = req.query.issures;
	var plan = req.query.plan;

	var myDate = new Date();
	console.log(myDate.toLocaleString() + " - report_submit: " + submitter);

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
		db.query(insertSQL, function (err, res1) {
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

	var id = req.query.databaseID;
	var project = req.query.project;
	var submitter = req.query.submitter;
	var importance = req.query.importance;
	var completed = req.query.completed;
	var issures = req.query.issures;
	var plan = req.query.plan;

	var myDate = new Date();
	console.log(myDate.toLocaleString() + " - report_update: " + submitter);
	
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
		db.query(insertSQL, function (err, res1) {
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
//     db.query(insertSQL, function (err, res1) {
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
		db.query(SQL, function (err, res1) {
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
	
	var username = req.query.username;
	var password = req.query.pwd;

	var myDate = new Date();
	console.log(myDate.toLocaleString() + " - login: " + username);

	var selectSQL = 'select * from user where username = "' + username + '"';
	db.query(selectSQL, function (err, rows) {
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

    var username = req.query.username;
    var oldPwd = req.query.oldPwd;
    var newPwd = req.query.newPwd;

    var myDate = new Date();
	console.log(myDate.toLocaleString() + " - change_pwd: " + username);

    selectSQL = 'select * from user where username = "' + username + '"';
    var updateSQL = 'UPDATE user SET password = "' + newPwd +'" where username = "' + username + '"';
    //查询用户名 和 密码
    db.query(selectSQL, function (err, rows) {
        if (err) {
          console.log(err);
          console.log(rows);
          res.send('{"success" : false, "result": "datebase error"}');
        } else {
        	if (oldPwd == rows[0]['password']) {
        		//原密码正确 修改密码
        		db.query(updateSQL, function (err, rows1) {
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
	var myDate = new Date();
	console.log(myDate.toLocaleString() + " - getReportsByName: " + username);

	if (username == 'all') {
		selectSQL = 'select * from week_reports order by id desc limit ' + limit;
	} else {
		selectSQL = 'select * from week_reports WHERE submitter = "'+ username +'" ORDER BY id DESC LIMIT ' + limit;
	}
   
	db.query(selectSQL, function (err, rows) {
		if (err) console.log(err);
		res.send(rows);
	});
})


//上拉加载功能
app.get('/getReportsByNameForLoadMore', function (req, res) {
	var lastDataID = req.query.lastDataID;
	var limit = req.query.limit;
	var username = req.query.username;
	var myDate = new Date();
	console.log(myDate.toLocaleString() + " - getReportsByNameForLoadMore: " + username);
	if (username == 'all') {
		selectSQL = 'select * from week_reports WHERE id < '+lastDataID+' ORDER BY id DESC LIMIT ' + limit;
	} else {
		selectSQL = 'select * from week_reports WHERE submitter = "'+ username +'" AND id < '+lastDataID+' ORDER BY id DESC LIMIT ' + limit;
	}
   
	db.query(selectSQL, function (err, rows) {
		if (err) console.log(err);
		res.send(rows);
	});
})

//暂时没用到这个功能
app.get('/getReportsByID', function (req, res) {
	var databaseID = req.query.databaseID;
	selectSQL = 'select * from week_reports WHERE id = "'+ databaseID +'"';
   
	db.query(selectSQL, function (err, rows) {
		if (err) console.log(err);
		console.log("getReportsByID ==> ");
		res.send(rows);
	});
})

// app.get('/getLastReports', function (req, res) {
//   var num = req.query.num;
//   selectSQL = 'select * from week_reports ORDER BY "add_time" DESC LIMIT ' + num; //where `No.` = ' + id;
   
//   db.query(selectSQL, function (err, rows) {
//       if (err) console.log(err);
//       console.log("getLast ==> ");
//       console.log(rows);
//       res.send(rows);
//   });

// })


app.get('/project_name_get', function (req, res) {
	var username = req.query.username;
	if (username == 'all') {
		selectSQL = 'select * from project WHERE finished = 0';
		db.query(selectSQL, function (err, rows) {
			if (err) console.log(err);
			res.send(rows);
		});
	} else {
		selectSQL = 'SELECT * from project WHERE finished = 0 and (manager = "'+ username +'" OR manager_2 = "'+ username +'")';
		db.query(selectSQL, function (err, rows) {
			if (err) console.log(err);
			res.send(rows);
		});
	}

})

app.get('/contract_get_number', function (req, res) {

	var submitter 		= req.query.submitter;
	var contract_number;
	var contract_name 	= req.query.contract_name;
	var company 		= req.query.company;
	var contract_type 	= req.query.contract_type;
	var money 			= req.query.money;
	var sign_date 		= req.query.sign_date;
	var begin_date 		= req.query.begin_date;
	var end_date 		= req.query.end_date;

	var myDate = new Date();
	console.log(myDate.toLocaleString() + " - contract_get_number: " + submitter);

	var tableName = 'contract_number';
	var contract_sum = 0;

	var ForS = contract_type == '付款合同' ? 'F' : 'S';
	var date = new Date();
	var year = date.getFullYear();

	//先查询合同数
	db.query('select count(*) from ' + tableName + ' where year = "' + year + '" AND ForS = "'+ ForS +'"', function (err, res1) {
		if (err) {
			console.log(err);
			res.send('{"success" : false}');
			return;
		} else {
			contract_sum = res1[0]['count(*)'] + 1;

			var contract_digital_number = "";
			if (contract_sum < 10) {
				contract_digital_number = '000' + contract_sum;
			} else if (contract_sum >= 10   || contract_sum < 100) {
				contract_digital_number = '00' + contract_sum;
			} else if (contract_sum >= 100  || contract_sum < 1000) {
				contract_digital_number = '0' + contract_sum;
			} else if (contract_sum >= 1000 || contract_sum < 10000) {
				contract_digital_number = contract_sum;
			}

			
			contract_number = 'HDYF' + ForS + year.toString().substring(2,4) + contract_digital_number;

			insertSQL = 'INSERT INTO ' + tableName + ' SET ';
			insertSQL = insertSQL + 'submitter = "' 		+ submitter			+ '",';
			insertSQL = insertSQL + 'contract_number = "' 	+ contract_number 	+ '",';
			insertSQL = insertSQL + 'contract_name = "'		+ contract_name		+ '",';
			insertSQL = insertSQL + 'company = "'			+ company			+ '",';
			insertSQL = insertSQL + 'money = "'				+ money				+ '",';	
			insertSQL = insertSQL + 'sign_date = "'			+ sign_date			+ '",';
			insertSQL = insertSQL + 'begin_date = "'		+ begin_date		+ '",';
			insertSQL = insertSQL + 'end_date = "'			+ end_date			+ '",';
			insertSQL = insertSQL + 'year = "'				+ year 				+ '",';
			insertSQL = insertSQL + 'ForS = "'				+ ForS 				+ '";';

			db.query(insertSQL, function (err, res1) {
				if (err) {
					console.log(err);
					res.send('{"success" : false}');
				} else {
					res.send('{"success" : true, "contract_number": "'+contract_number+'"}');
		    	}
			});
    	}
	});

})

app.get('/getContractListByName', function (req, res) {
	var username = req.query.username;
	var myDate = new Date();
	console.log(myDate.toLocaleString() + " - getContractListByName:" + username);
	if (username == 'all') {
		selectSQL = 'select * from contract_number order by id desc';
	} else {
		selectSQL = 'select * from contract_number WHERE submitter = "'+ username +'" ORDER BY id DESC';
	}
   
	db.query(selectSQL, function (err, rows) {
		if (err) console.log(err);
		res.send(rows);
	});
})

app.get('/getAllContact', function (req, res) {
	var myDate = new Date();
    console.log(myDate.toLocaleString() + " - getAllContact");

 	selectSQL = 'select * from user';
 	db.query(selectSQL, function (err, rows) {
		if (err) console.log(err);
		res.send(rows);
 	});
})

app.get('/getFileList', function (req, res) {
	var myDate = new Date();
	console.log(myDate.toLocaleString() + " - getFileList");
	selectSQL = 'select * from file_list order by file_number desc';
   
	db.query(selectSQL, function (err, rows) {
		if (err) console.log(err);
		res.send(rows);
	});
})


app.post('/file_upload', urlencodedParser, function (req, res) {

	var file_number = req.body.file_number;
	var file_title = req.body.file_title;

	console.log(req.body.file_number);
	console.log(req.files[0]);  // 上传的文件信息
 
	var des_file = __dirname + "/http/pdf/" + req.files[0].originalname;
	fs.readFile(req.files[0].path, function (err, data) {
		fs.writeFile(des_file, data, function (err) {

			if( err ){
				console.log( err );
			} else {

				var file_name = req.files[0].originalname.replace('.pdf', '');
				response = {
					success: true,
					message: 'File uploaded successfully', 
					filename: file_name
				};

				//insert db
				insertSQL = 'INSERT INTO file_list SET ';
				insertSQL = insertSQL + 'file_number = "'	+ file_number	+ '",';
				insertSQL = insertSQL + 'file_name = "'		+ file_name		+ '",';
				insertSQL = insertSQL + 'file_title = "'	+ file_title	+ '";';
				db.query(insertSQL, function (err, res1) {
					if (err) {
						console.log(err);
						res.send('{"success" : false}');
					} else {
						res.send( JSON.stringify( response ) );
						console.log( response );
			    	}
				});
				
			}

			//删除临时文件
			fs.unlink(req.files[0].path, function(err) {
				console.log('删除上传临时文件');
			})
			
		});
	});

})



app.get('/project_plan_submit', function (req, res) {

	var project = req.query.project;
	var plan = req.query.plan;
	var month = req.query.month;

	var myDate = new Date();
	console.log(myDate.toLocaleString() + " - project_plan_submit: ");

	if (project == "" || plan == "" || month == "") {
		res.send('项目代号和提交者不能为空！'); 
	} else {
		insertSQL = 'INSERT INTO project_plan SET ';
		insertSQL = insertSQL + 'project = "'+project+'",';
		insertSQL = insertSQL + 'plan = "'+plan+'",';
		insertSQL = insertSQL + 'month = "'+month+'";';
		db.query(insertSQL, function (err, res1) {
			if (err) {
				console.log(err);
				res.send('{"success" : false}');
			} else {
				res.send('{"success" : true}');
        	}
    	});
  	}
})

app.get('/project_plan_get', function (req, res) {

	var project = req.query.project;
	var month = req.query.month;

	var myDate = new Date();
	console.log(myDate.toLocaleString() + " - project_plan_get: ");

	selectSQL = 'SELECT * FROM project_plan WHERE project = "'+project+'" AND `month` = "'+month+'"';
	db.query(selectSQL, function (err, rows) {
		if (err) console.log(err);
		res.send(rows);
	});
})

app.get('/db_operate', function(req, res) {
	sql = req.query.sql;
	db.query(sql, function(err, rows) {
		if(err) {
			var response = {
				success: false,
				err: err
			}
			res.send(JSON.stringify(response));
		} else {
			var response = {
				success: true,
				result: rows
			}
			res.send(JSON.stringify(response));
		}
	})
})

app.get('/make_db_excel', function(req, res) {

	selectSQL = req.query.sql;
	db.query(selectSQL, function(err, rows) {

		if (err) {
			var response = {
				success: false,
				err: err
			}
			res.send(JSON.stringify(response));
		} else {
			var data = [];

			//表头
			if (rows.length != 0) {
				var keyArr = [];
				for (var key in rows[0]) {
					keyArr.push(key);
				}
				data.push(keyArr);
			}

			//json数组遍历
			for (var i in rows) {
				var arr = [];
				var value = rows[i];
				//json key 遍历
				for (var key in value) {
					arr.push(value[key]);
				}
				data.push(arr);
			}
			var buffer = xlsx.build([
			    {
			        name:'sheet1',
			        data:data
			    }        
			]);

			//将文件内容插入新的文件中
			var fileName = new Date().getTime()+ '.xlsx';
			var filePath = __dirname +'/DB/excel/' + fileName;
			fs.writeFile(filePath,buffer,{'flag':'w'}, function(err) {
				if (err) {
					var response = {
						success: false,
						err: err
					}
					res.send(JSON.stringify(response));
				} else {
					
					console.log("下载 请求");
					var response = {
						success: true,
						filePath: filePath,
						fileName: fileName
					}
					res.send(JSON.stringify(response));
					// res.download(filePath,fileName);
					// fs.unlink(filePath);
				}
				
			});
		}		
	});
})

app.get('/download_db_excel', function(req, res) {
	var filePath = req.query.filePath;
	var fileName = req.query.fileName;
	res.download(filePath, fileName);
})



app.get('/test', function (req, res) {
	var myDate = new Date();
	console.log(myDate.toLocaleString() + " - test");
	var username = req.query.submitter;
	if (username == "123") {
		res.send('{"success" : true}');
	} else {
		res.send('{"success" : false}');
	}
	
})

