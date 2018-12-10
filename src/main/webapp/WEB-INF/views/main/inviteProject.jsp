<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>초대받은 프로젝트</title>
<link rel="shortcut icon" type="image/x-icon" href="/images/favicon.png" />
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
<style type="text/css">
*{margin:0px;padding:0px;box-sizing:border-box;font-family: 'NanumSquare', sans-serif;}
.inviteProjectContainer{width:100%;height:100%;}
.inviteProjectContainerTitle{width:100%;height:50px;background-color:#eee;}
.inviteProjectContainerTitle > h4{font-weight:normal;font-size:20px;line-height:50px;text-indent:10px;}
.inviteProjectContent{width:100%;height:330px;}
.inviteProjectContent > .inviteProjectContentTexts> span{display:block;font-size:20px;padding:20px 0px 10px 20px;}
.inviteProjectContentInputText{width:460px;height:30px;margin-left:20px;outline:none;font-size:20px;}

.inviteProjectContents > span{display:block;font-size:20px;padding:20px 0px 10px 20px;}
.inviteProjectContentTextarea{width:460px;height:100px;margin-left:20px;outline:none;font-size:20px;}
.userMessage{width:100%;text-align:center;}
.userMessage > span{display:block;font-size:18px;letter-spacing:-0.5px;margin-top:20px;}
.inviteProjectFooter{display:flex;justify-content:center;align-items:center;width:100%;heihgt:70px;margin-top:20px;}
.inviteProjectFooter > .inviteProjectY{width:100px;height:40px;font-size:18px;border:none;background-color:#746fcc;color:#fff;outline:none;border:1px solid #494687;cursor:pointer;}
.inviteProjectFooter > .inviteProjectN{width:100px;height:40px;font-size:18px;margin-left:20px;outline:none;border:1px solid #000;background-color:#fff;cursor:pointer;}
</style>

</head>

<body>
<div class="inviteProjectContainer">
	<div class="inviteProjectContainerTitle">
		<h4>초대받은 프로젝트</h4>
	</div>
	<c:forEach items="${inviteProjectList }" var="inviteVo" >
	<div class="inviteProjectContent">
		<div class="inviteProjectContentTexts">
			<span>프로젝트 명</span>
			<input type="text" class="inviteProjectContentInputText" value="${inviteVo.project_title }" readonly />
		</div>
		<div class="inviteProjectContents">
			<span>프로젝트 개요</span>
			<textarea class="inviteProjectContentTextarea" readonly>'${inviteVo.project_overview}'</textarea>
		</div>
		<div class="userMessage">
			<span>${inviteVo.invite_name} 님이 초대하셨습니다.<br>초대를 수락 하시겠습니까?</span>
		</div>
	</div>
	</c:forEach>
	<div class="inviteProjectFooter">
		<input type="button" class="inviteProjectY" value="수락"/>
		<input type="button" class="inviteProjectN" value="취소" />
	</div>
</div>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$(".inviteProjectY").click(function(){
		window.opener.invitePrject('Y','${project_id}')
		window.close();
	});
	$(".inviteProjectN").click(function(){
		window.opener.invitePrject('N','${project_id}')
		window.close();
	});
});
</script>
</body>
</html>