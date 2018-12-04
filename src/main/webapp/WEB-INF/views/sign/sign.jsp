<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 - CURRENT</title>
<link rel="shortcut icon" type="image/x-icon" href="images/favicon.png" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
<link rel="stylesheet" href="../css/bootstrap.min.css" />
<link rel="stylesheet" href="../css/bootstrap-material-design.min.css" />
<link rel="stylesheet" href="../css/ripples.min.css" />
<link rel="stylesheet" href="../css/style.css" />
<script src="../js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/sign.css">
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
.phoneInput{float:left;width:340px;margin-bottom:30px;}
.phoneInputBtn{float:left;margin-top:10px;}
.certification{clear:both;}
.signCloseBtns{width:100%;}
.error{color: red; }
</style>
<script type="text/javascript">
function telAjax(){
	var member_tel = $("#tel").val();
	$.ajax({
		type :"GET",
		url :"/signProcessAjax",
		data : "member_tel="+member_tel,
		sucess : function(data){	
		}
	});
}
</script>
<script type="text/javascript">
function telSaveAjax(){
	var telnum = $("#telnum").val();
	$.ajax({
		type :"GET",
		url :"/signProcessAjax",
		data : "telnum="+telnum,
		sucess : function(data){	
		}
	});
}
</script>
</head>
<body>
<div class="wraps">
	<div class="container">
		<div class="well box">
			<form action="/signProcess" method="post">
				<h1>CURRENT 회원가입</h1>
				<br>
				<div class="form-group label-floating">
					<label class="control-label">이메일</label>
					<input type="email"	id ="email" name="member_mail" value="" class="form-control" autofocus="autofocus" required />
				</div>
				<div class="form-group label-floating">
					<label class="control-label">이름</label>
					<input type="text" id = "name" name="member_name" value="" class="form-control" autofocus="autofocus" required />
				</div>
				<div class="form-group label-floating">
					<label class="control-label">비밀번호</label>
					<input type="password" name="member_pass" id ="password" class="form-control" required />
				</div>
				<div class="form-group label-floating">
					<label class="control-label">비밀번호 확인</label>
					<input type="password" name="" class="form-control" id ="passCheck" required />
					<span class="error"> 비밀번호가 일치하지 않습니다.</span>
				</div>
				<div class="phoneSignDiv">
					<div class="form-group label-floating phoneInput">
						<label class="control-label">휴대폰 번호</label>
						<input type="text" id ="tel" name="member_tel" class="form-control" required />
					</div>
					<div class="phoneInputBtn">
						<button onclick="telAjax();" class="btn btn-primary btn-raised" >인증</button>
					</div>
				</div>
				<div class="phoneSignDiv">
					<div class="form-group label-floating phoneInput">
						<label class="control-label">인증번호</label>
						<input type="text" class="form-control" id ="telnum" name="telSendNumber" required />
					</div>
					<div class="phoneInputBtn">
						<button onclick="telSaveAjax();" class="btn btn-primary btn-raised" >확인</button>
					</div>
				</div>		
				<br>
				<input type="submit" value="회원가입" class="btn btn-primary btn-raised" /><br>
				<a href="/" class="btn btn-primary btn-raised signCloseBtns">취소</a>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.1.0.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$(".error").hide();
	//커서의 위치가 다른곳을 선택했을 때의 이벤트 발생
	//blur()이벤트 사용
	$("#passCheck").blur(function() {
		if($("#passCheck").val() != $("#password").val()){
			$("#passCheck").next().show();
		} else{
			$("#passCheck").next().hide();
		}
	});
});
</script>

<script src="../js/material.min.js"></script>
<script>
	$.material.init()
</script>
</body>
</html>
















