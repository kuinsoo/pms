
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		.error{color: red;}
		#telerror{color: red;}
		#passError{color: red;}
		#nameError{color:red;}
		#phoneMypageError{color:red;}
		#Emailerror{color:red;}
		/* video background */
		.videoBgs{width:100%;height:100%;position:absolute;top:0px;left:0px;}
		.videoBgs > video{width:100%;}
	</style>
<script type="text/javascript">

	// document.ready에는 var를 넣으면 안된당.!!!
	//var passwordRules = /^[0-9a-z]+$/;

	//숫자와 문자 포함 형태의 6~12자리 이내의 암호 정규식
	var certificationNumber;


	$(document).ready(function() {
		$("#memberTelNot").hide();
		$("#passError").hide();
		$("#telerror").hide();
		$(".error").hide();
		$("#nameError").hide();
		$("#phoneMypageError").hide();
		$("#Emailerror").hide();
		
		var msg = '${msg}';
		if(msg=='Y'){
			alert(" 회원 가입이 불가능한 회원입니다.");
		}

		//커서의 위치가 다른곳을 선택했을 때의 이벤트 발생
		//blur()이벤트 사용
		$("#passCheck").blur(function() {
			if($("#passCheck").val() != $("#password").val()){
				$("#passCheck").next().show();
			} else{
				$("#passCheck").next().hide();
			}
		});
	}); // document.ready 끝 
		
	<!-- 핸드폰 번호 입력 후 인증 버튼 -->
		function telAjax(){
			var member_tel = $("#tel").val();
			$.ajax({
				type :"GET",
				url :"/signProcessAjax",
				data : "member_tel="+member_tel,
				success : function(data){
					certificationNumber= data;
				}
			});
		}
		function onkeyup_event(){
			if(certificationNumber ==  $("#telnum").val()){
				$("#telerror").hide();

			}else{
				$("#telerror").show();
			}
		}
		
		/* 이메일 정규식을 위함 /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/; */
		function onkeyup_eventEmail(){
			if(!/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i.test($("#email").val())){
				$("#Emailerror").show();
			}else{
				$("#Emailerror").hide();
			}
		}
		
		
		/*
		// 핸드폰 번호 확인을 위해서 
			if("${memberVo.member_tel}"== $("#tel")){
						$("#memberTelNot").show();
					}
		*/
		function onkeyup_eventPhoneNum(){
			if(!/^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/.test($("#tel").val())){
				$("#phoneMypageError").show();
				$("#phoneNumSaveBtn").prop('readonly', true);
				
				
				return false;
			
			}else {
				$("#phoneMypageError").hide();
				$("#phoneMypageError").hide();
				$("#phoneNumSaveBtn").prop('readonly', false);
			}
		}
		
		/*
		if(!/^[a-zA-Z0-9]{10,15}$/.test(password)){
		*/
		function onkeyup_event2(){
			if(!/^[a-zA-Z0-9]{6,10}$/.test($("#password").val())){
				$("#passError").show();
				
				return false;
			}else {
				$("#passError").hide();
			}
		}
		function onkeyup_eventName(){
			if(!/^[가-힣]{2,4}$/.test($("#signMembername").val())){
				$("#nameError").show();
				return false;
			}else {
				$("#nameError").hide();
			}
		}
	</script>
</head>
<body>
<div class="wraps">
	<div class="videoBgs">
		<video src="../video/currentVideo.mp4" muted autoplay="true" loop="true"></video>
	</div>
	<div class="container">
		<div class="well box">
			<form action="/signProcess" method="post">
				<h1>CURRENT 회원가입</h1>
				<br>
				<div class="form-group label-floating">
					<label class="control-label">이메일</label>
					<input type="email"	id ="email" name="member_mail" onkeyup="onkeyup_eventEmail();"  class="form-control" autofocus="autofocus" required />
					<span id="Emailerror"> 이메일 형식에 맞지않습니다..다시 입력해주세요. </span>
				</div>
				<div class="form-group label-floating">
					<label class="control-label">이름</label>
					<input type="text" id = "signMembername" name="member_name"  onkeyup="onkeyup_eventName();" value="" class="form-control" autofocus="autofocus" required />
					<span id="nameError"> 한글 이름 2~4자 이내로 입력해주세요. </span>
				</div>
				<div class="form-group label-floating">
					<label class="control-label">비밀번호</label>
					<input type="password" name="member_pass" id ="password" onkeyup="onkeyup_event2();" class="form-control" required />
					<span id="passError"> 총 6~10 글자로 다시 입력해주세요.. (영문이나 숫자로) </span>
				</div>
				<div class="form-group label-floating">
					<label class="control-label">비밀번호 확인</label>
					<input type="password" name="" class="form-control" id ="passCheck" required />
					<span class="error"> 비밀번호가 일치하지 않습니다.</span>
				</div>
				<div class="phoneSignDiv">
					<div class="form-group label-floating phoneInput">
						<label class="control-label">휴대폰 번호</label>
						<input type="text" id ="tel"  onkeyup="onkeyup_eventPhoneNum();"  name="member_tel" class="form-control" required />
						<span id ="phoneMypageError">올바르지 않습니다..(-) 없이 입력해 주세요.  </span>
							<%-- <c:if test="${member_tel == 'false'}">
								<span id ="memberTelNot"> 사용자가 있는 핸드폰 번호입니다. </span>
							</c:if> --%>
					</div>
					<div class="phoneInputBtn">
						<button onclick="telAjax();" class="btn btn-primary btn-raised" id="phoneNumSaveBtn" >인증</button>
					</div>
				</div>
				<div class="form-group label-floating certification">
					<label class="control-label">인증번호</label>
					<input type="text" class="form-control" onkeyup="onkeyup_event();" id ="telnum" name="telSendNumber" required />
					<span id="telerror"> 인증번호가 일치하지 않습니다.</span>
				</div>
				<br>
				<input type="submit" value="회원가입" class="btn btn-primary btn-raised" /><br>
				<a href="/" class="btn btn-primary btn-raised signCloseBtns">취소</a>
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