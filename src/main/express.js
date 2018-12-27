
//프레임워크 
var https = require('https');
var express = require('express');

//파일리드 허용 
var fs = require('fs');
//외부 파일 호출 
var serverJS = require('./server.js');


//https
var options = {  
		key: fs.readFileSync('./keys/key.pem'),
		cert: fs.readFileSync('./keys/cert.pem')
};
var port=8089;	// ..만약 EADDRINUSE 에러가 뜬다면 = 이미 쓰고있다는 뜻
var app = express();
app.use(express.urlencoded());
https.createServer(options, app).listen(port, function(){  
	  console.log("Https server에 귀기울이고 있다 " + port);
	});

//데이터베이스 및 오라클 선언  
var oracledb = require('oracledb');
var dbConfig = require('./dbconfig.js');
oracledb.autoCommit = true;

//나만의 (라우터)경로 설정
app.use('/', express.static(__dirname + '/webapp/WEB-INF/views/meet'));

//(라우터로 들어오는)파라미터 받기 
var bodyParser = require("body-parser");
app.use(bodyParser.urlencoded({extended:true}));
app.use(bodyParser.json());

//(라우터가 들어오는) 포트 개방 
app.all('/*', function(req, res, next) {
	console.log(" \n * app.all * \n  ");
	res.header("Access-Control-Allow-Origin", "*");
	res.header("Access-Control-Allow-methods", "GET,POST,PUT");
	res.header("Access-Control-Allow-Headers", "X-Requested-With,X-PINGOTHER, Content-Type");
	res.header("Access-Control-Max-Age", "86400");
	next();
});

//*** 데이터 받기 
app.post('/test', function (req, res) {
	console.log("\n * app.post * \n");
	var userid = req.body.userid,
	username = req.body.username,
	chatMessage = req.body.chatMessage,
	roomid=req.body.roomid;

	console.log(chatMessage);
	console.log(userid);
	console.log(username);
	console.log(roomid);
	
	// 연결 : 데이터베이스(오라클) 연결 
	oracledb.getConnection({
				user          : "current1",
				password      : "java",
				connectString : "119.203.240.166/orcl",
			},
			function(err, connection){
				if (err) {
					console.error(err.message);
					return;
				}
				console.log("짝짝짝-오라클 DB에 정상적으로 연결되었습니다.");

				//	연결.실행 검증(SELECT문) 
				connection.execute(      
					"insert into chatting values('chat'||seq_CHAT_ID.nextval, 'meet'||seq_MEETING_ID.currval ,'"+username+"',sysdate,'"+chatMessage+"','"+userid+"','"+roomid+"')",
					function(err, result){
						if (err) {
							console.error(err.message);
							doRelease(connection);
							return;
						}
						doRelease(connection);
						console.log("--성공--");
					});
				
			});
	function doRelease(connection){
		connection.release(
			function(err) {
				if (err) {
					console.error(err.message);
				}
			});
		};
});


//*** 데이터 받기 
app.post('/meetProjObj', function (req, res) {
	console.log("\n * app.post 2 * \n");
	var project_id = req.body.project_id,
	projectTitle = req.body.projectTitle,
	roomid = req.body.roomid,
	roomTitle = req.body.roomTitle,
	member_name = req.body.member_name,
	member_mail = req.body.member_mail;

	console.log(project_id);
	console.log(projectTitle);
	console.log(roomid);
	console.log(roomTitle);
	console.log(member_name);
	console.log(member_mail);

	// 연결 : 데이터베이스(오라클) 연결 
	oracledb.getConnection({
				user          : "current1",
				password      : "java",
				connectString : "119.203.240.166/orcl",
			},
			function(err, connection){
				if (err) {
					console.error(err.message);
					return;
				}
				console.log("짝짝짝-오라클 DB에 정상적으로 연결되었습니다.");

				//	연결.실행 검증(SELECT문)   + MEETING_CONTENT - 회의록 
				connection.execute(      
					"insert into meeting(MEETING_ID, MEETING_PROJECT, MEETING_TITLE, MEETING_OVERVIEW, MEETING_FOUNDER, MEETING_SDATE, MEETING_EDATE)  " +
					"values('meet'||seq_MEETING_ID.nextval, '"+project_id+"','"+roomid+"','"+roomTitle+"','"+member_mail+"',sysdate, sysdate+((1/1440)*30) )",
					function(err, result){
						if (err) {
							console.error(err.message);
							doRelease(connection);
							return;
						}
						doRelease(connection);
						console.log("--성공--");
					});
			});
	function doRelease(connection){
		connection.release(
			function(err) {
				if (err) {
					console.error(err.message);
				}
			});
		};
});


//*** 데이터 받기 
app.post('/saveDoc', function (req, res) {
	console.log("\n * app.post 3 * \n");
	var content = req.body.content,
	project_id = req.body.project_id,
	roomid = req.body.roomid;

	console.log(project_id);
	console.log(content);
	console.log(roomid);

	// 연결 : 데이터베이스(오라클) 연결 
	oracledb.getConnection({
				user          : "current1",
				password      : "java",
				connectString : "119.203.240.166/orcl",
			},
			function(err, connection){
				if (err) {
					console.error(err.message);
					return;
				}
				console.log("짝짝짝-오라클 DB에 정상적으로 연결되었습니다.");

				//	연결.실행 검증(SELECT문)   + MEETING_CONTENT - 회의록 
				connection.execute(      
					"update meeting set MEETING_CONTENT='"+content+"' where MEETING_PROJECT='"+project_id+"' and MEETING_TITLE='"+roomid+"'",
					function(err, result){
						if (err) {
							console.error(err.message);
							doRelease(connection);
							return;
						}
						doRelease(connection);
						console.log("--성공--");
					});
			});
	function doRelease(connection){
		connection.release(
			function(err) {
				if (err) {
					console.error(err.message);
				}
			});
		};
});
