<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 - CURRENT</title>
<link rel="shortcut icon" type="image/x-icon" href="images/favicon.png" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
<link rel="stylesheet" href="../css/bootstrap.min.css" />
<link rel="stylesheet" href="../css/bootstrap-material-design.min.css" />
<link rel="stylesheet" href="../css/ripples.min.css" />
<link rel="stylesheet" href="../css/style.css" />
<script src="../js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/login.css">
<style>
.wraps{width:100%;height:100%;display:flex;justify-content:center;align-items:center;}
body{margin:0;background:#ddd}
body > .wraps > .container{width:500px;}
.wraps div.well{padding:30px !important;}
div.well input[type="submit"]{width:100%;height:50px}
.box{opacity:0.95;border-radius:20px !important;padding:0}
.col-md-6.box div{background-color:rgba(0, 0, 0, 0.5);margin-right:10px;padding:15px;border-radius:20px;margin-bottom:10px}
.col-md-6.box div *:not(span){color:white}
.box ul{padding-left:15px;list-style:none}
.box li{width:90%}
.status span{float:right}
.status-success span{color:#4CAF50}
.status-warning span{color:#FFC107}
.status-danger span{color:#F44336}
.well.box.info{background-color:#F44336;color:white;font-size:15px;text-align:center}
</style>

</head>
<body>
<div class="wraps">
	<div class="container">
		<div class="well box">
			<form action="#" method="post">
				<h1>CURRENT 로그인</h1>
				<br>
				<div class="form-group label-floating">
					<label class="control-label">이메일</label>
					<input type="email"	name="" value="" class="form-control" autofocus="autofocus" required />
				</div>
				<div class="form-group label-floating">
					<label class="control-label">비밀번호</label>
					<input type="password" name="" class="form-control" required />
				</div>
				<br> <input type="submit" value="로그인" class="btn btn-primary btn-raised" /><br>
				<a href="#">비밀번호 찾기</a>
			</form>
		</div>
	</div>
</div>

<script src="../js/material.min.js"></script>
<script>
	$.material.init()
</script>
</body>
</html>