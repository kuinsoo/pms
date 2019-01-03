<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CURRENT ADMIN</title>
<link rel="shortcut icon" type="image/x-icon" href="/images/favicon.png" />
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.css">
<style type="text/css">
/* ADMIN COMMON */
*{margin:0px;padding:0px;box-sizing:border-box;font-family:'NanumSquare', sans-serif;}
html, body{height:100%;}
a{text-decoration:none;}
ul{list-style-type:none;}

/* ADMIN HEADER */
.header{width:100%;height:85px;position:fixed;z-index:1;}
.topHeader{width:100%;height:50px;background-color:#333;}
.adminLogo{float:left;margin-left:20px;color:red;font-size:20px;line-height:50px;}
.adminLogo > a{color:red;}
.adminInfo{float:right;color:#fff;font-size:17px;line-height:50px;margin-right:20px;}
.adminInfo > a{color:#f00;margin-left:20px;}
.adminInfo > span{color:#ccc;}
.subHeader{width:100%;height:35px;background-color:#494b50;}
.subHeader > ul > li{
	display:inline-block;font-size:17px;line-height:35px;
	width:100px;height:35px;text-align:center;border-right:1px solid #333;
}
.subHeader > ul > li > a{color:#fff;}

/* ADMIN CONTAINER */
.adminContainer{width:100%;padding-top:85px;}
.adminRightContentInner{width:100%;position:relative;overflow:hidden;padding:50px 40px 20px 40px;}

/* ADMIN LEFT MENU */
.adminLeftMenu{width:15%;height:100%;float:left;}
.adminLeftMenuTitle {
	display:flex;justify-content:center;align-items:center;width:100%;height:200px;
	flex-direction:column;border-bottom:1px solid #dee3db;
}
.adminLeftMenuTitle > i{font-size:50px;}
.adminLeftMenuTitle > p{font-size:30px;}

.adminRightContent{width:85%;border-left:1px solid #dee3db;float:left;}
.adminRightContentTop {
	width:100%;height:40px;border-bottom:1px solid #dee3db;line-height:40px;text-indent:20px;
}
.adminRightContentTop > p{font-size:17px;}
.adminRightContent > .adminRightContentInner > h2 {
	display:block;font-size:20px;width:100%;border-bottom:1px solid #333;
	padding-bottom:10px;
}
.adminRightContent > .adminRightContentInner > h2 > span{color:#ccc;font-size:17px;padding-left:10px;font-weight:normal;}

/* 테이블 */
.adminTitleInputContent{width:100%;margin-top:20px;}
.adminTitleInputContent > table{width:100%;border-collapse:collapse;margin-top:50px;}
.adminTitleInputContent > table > tbody > tr:first-child {
	border-top:2px solid #333;border-bottom:1px solid #dee3eb;
}
.adminTitleInputContent > table > tbody > tr:last-child {
	border-bottom:1px solid #dee3db;
}
.adminTitleInputContent > table > tbody > tr > td{padding:10px;}
.adminTitleInputContent > table > tbody > tr > td > input[type="text"] {
	border:none;outline:none;font-size:20px;text-indent:5px;width:100%;
}
.adminTitleInputContent > table > tbody > tr > td > textarea {
	font-size:20px;padding:10px;outline:none;width:99%;height:500px;
}
.adminTitleInputContent > table > tbody > tr > .titleTd {
	background-color:#f6f6f6;font-size:20px;text-indent:5px;
}
.adminCreateBtns{width:100%;height:50px;margin-top:20px;}
.adminCreateList {
	width:80px;height:40px;background-color:#fa2828;color:#fff;border:none;cursor:pointer;
	font-size:17px;float:left;outline:none;text-align:center;line-height:40px;
}
.adminCreateBtn{width:80px;height:40px;background-color:#fa2828;color:#fff;border:none;cursor:pointer;font-size:17px;float:right;outline:none;}



/* ADMIN FOOTER */
.footerContent{width:100%;clear:both;text-align:center;border-top:1px solid #dee3db;}
.footerContent > p{font-size:18px;padding:20px;line-height:30px;}
.footerContent > p > span{font-weight:bold;}
</style>
</head>

<body>
<div class="header">
	<div class="topHeader">
		<div class="adminLogo">
			<a href="/main">CURRENT ADMIN</a>
		</div>
		<div class="adminInfo">
			${memberVo.member_name}<span>님</span> (${memberVo.member_mail})
			<a href="/logout">로그아웃</a>
		</div>
	</div>
	<div class="subHeader">
		<ul>
			<li><a href="/admin">공지사항</a></li>
			<li><a href="/adminGuide">가이드</a></li>
		</ul>
	</div>
</div>
<div class="adminContainer">
	<div class="adminLeftMenu">
		<div class="adminLeftMenuTitle">
			<i class="icon-settings icons"></i>
			<br>
			<p>공지사항</p>
		</div>
	</div>
	<div class="adminRightContent">
		<div class="adminRightContentTop">
			<p>CURRENT ADMIN > 공지사항</p>
		</div>
		<div class="adminRightContentInner">
			<h2>공지사항 정보 관리<span>공지사항 정보를 입력하실 수 있습니다.</span></h2>
			<form action="/adminInsert" method="post" id="adminInsert">
				<div class="adminTitleInputContent">
					<input type="hidden" name="member_mail" value="${memberVo.member_mail}" />
					<input type="hidden" name="board_id" value="1" />
					<table>
						<colgroup width="10%" />
						<colgroup width="90%" />
						<tr>
							<td class="titleTd">제목</td>
							<td><input type="text" name="post_title" pattern="<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>" required /></td>
						</tr>
						<tr>
							<td class="titleTd">게시물 내용</td>
							<td>
								<textarea id="smarteditor" name="post_content" required></textarea>
							</td>
						</tr>
					</table>
				</div>
				<div class="adminCreateBtns">
					<a href="/admin" class="adminCreateList">목록</a>
					<button type="submit" class="adminCreateBtn">등록</button>
				</div>
			</form>
		</div>
	</div>
	<div class="footerContent">
	    <p>
	        대전광역시 중구 중앙로 76 영민빌딩 2층 203호<br>
	        기관명: (재)대덕인재개발원, 최종프로젝트 PMS(Project Management System)<br>
	        Copyright 2018 <span>DDIT 203 Class, CURRENT</span> All rights reserved.
	    </p>
	</div>
</div>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="../SE2/js/HuskyEZCreator.js"></script>
<script type="text/javascript">
var oEditors = []; // 개발되어 있는 소스에 맞추느라, 전역변수로 사용하였지만, 지역변수로 사용해도 전혀 무관 함.

$(document).ready(function() {
	// Editor Setting
	nhn.husky.EZCreator.createInIFrame({
		oAppRef : oEditors, // 전역변수 명과 동일해야 함.
		elPlaceHolder : "smarteditor", // 에디터가 그려질 textarea ID 값과 동일 해야 함.
		sSkinURI : "../SE2/SmartEditor2Skin.html", // Editor HTML
		fCreator : "createSEditor2", // SE2BasicCreator.js 메소드명이니 변경 금지 X
		htParams : {
			// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseToolbar : true,
			// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : true,
			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : true, 
		}
	});

	// 전송버튼 클릭이벤트
	$("button[type=submit]").click(function(){
		if(confirm("저장하시겠습니까?")) {
			// id가 smarteditor인 textarea에 에디터에서 대입
			oEditors.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
		}
	});
});
</script>
</body>
</html>