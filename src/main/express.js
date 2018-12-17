
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
var port=8080;	// ..만약 EADDRINUSE 에러가 뜬다면 = 이미 쓰고있다는 뜻 
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
	res.header("Access-Control-Allow-Headers", "X-Requested-With");
	next();
});

//*** 데이터 받기 
app.post('/test', function (req, res) {
	console.log("\n * app.post * \n");
	var userid = req.body.userid,
	username = req.body.username,
	chatMessage = req.body.chatMessage;

	console.log(userid);
	console.log(username);
	console.log(chatMessage);
	

	// 연결 : 데이터베이스(오라클) 연결 
	oracledb.getConnection({
				user          : "current2",
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
					"insert into chatting values(seq_CHAT_ID.nextval||'chat', '2room', '"+username+"',sysdate,'"+chatMessage+"','"+userid+"')",
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

