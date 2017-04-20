var xlsx = require('node-xlsx');
var fs = require('fs');
//读取文件内容
// var obj = xlsx.parse(__dirname+'/test.xlsx');
// var excelObj=obj[0].data;
// console.log(excelObj);

var mysql = require('mysql');
var db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'root',
    database:'nodejs',
    port: 3306
});
db.connect();

var selectSQL = 'SELECT * from project_plan  WHERE `month` = "2017-4" ORDER BY project';

db.query(selectSQL, function(err, rows) {
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
	fs.writeFileSync(fileName,buffer,{'flag':'w'});

});