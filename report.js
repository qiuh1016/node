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

exports.report_submit = function (req, res) {
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
};

exports.report_get_by_name = function (req, res) {
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
}