<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<title>MAIN - CURRENT</title>
<link rel="shortcut icon" type="image/x-icon" href="images/favicon.png" />
<%-- NANUM SQUARE FONT --%>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.css">
<link rel="stylesheet" href="../css/swiper.min.css">
<link rel="stylesheet" href="../css/jquery-ui.css">
<style type="text/css">
<%-- COMMON --%>
*{margin:0px;padding:0px;font-family:'NanumSquare', sans-serif;box-sizing:border-box;}
a{text-decoration:none;color:#000;}
html, body{height:100%;overflow-x:hidden;}
ul{list-style-type:none;}
#wrap{width:100%;height:100%;}

<%-- HEADER --%>
header{width:100%;min-width:1200px;height:60px;background-color:rgba(255,255,255,0.8);border-bottom:1px solid #ccc;position:fixed;z-index:3;}
.headerContainer{width:1400px;height:60px;margin:0 auto;}
.headerContainer > .currentMenu{width:45px;height:45px;float:left;margin-top:7px;}

<%-- LEFT MENU BUTTON --%>
.menu-trigger, .menu-trigger span{display:inline-block;transition:all .4s;box-sizing:border-box;}
.menu-trigger{display:block;position:relative;top:10px;left:5px;width:50px;height:30px;float:left;}
.menu-trigger span{position:absolute;left:0;width:70%;height:4px;background-color:#000;border-radius:4px;}
.menu-trigger span:nth-of-type(1){top:0px;}
.menu-trigger span:nth-of-type(2){top:10px;}
.menu-trigger span:nth-of-type(3){top:20px;}
.menu-trigger.active span:nth-of-type(1) {
	-webkit-transform:translateY(10px) rotate(-45deg);
	transform:translateY(10px) rotate(-45deg);
}
.menu-trigger.active span:nth-of-type(2){opacity:0;}
.menu-trigger.active span:nth-of-type(3) {
	-webkit-transform:translateY(-10px) rotate(45deg);
	transform:translateY(-10px) rotate(45deg);
}

.headerContainer > .currentLogo{width:200px;height:50px;margin-top:7px;float:left;cursor:pointer;margin-left:10px;}
.headerContainer > .currentAllSearch {width:500px;height:50px;margin-top:7px;margin-left:10px;float:left;}
.headerContainer > .currentAllSearch > select {
	width:120px;height:45px;font-size:18px;text-indent:10px;outline:none;float:left;border:1px solid #333;padding-top:5px;cursor:pointer;background:none;
}
.headerContainer > .currentAllSearch > .headerSearchInputText {
	width:300px;height:45px;margin-left:-1px;text-indent:10px;font-size:18px;outline:none;float:left;background:none;
	border:none;border-top:1px solid #333;border-left:1px solid #333;border-bottom:1px solid #333;padding-top:5px;
}
.headerContainer > .currentAllSearch > i {
	font-size:20px;display:block;width:35px;height:45px;line-height:45px;cursor:pointer;float:left;
	border-top:1px solid #333;border-right:1px solid #333;border-bottom:1px solid #333;padding-bottom:5px;
}
.headerContainer > .headerRightContent{width:280px;height:45px;margin-top:5px;float:right;}
.headerContainer > .headerRightContent > a > .teamInvite {
	width:130px;height:40px;border:1px solid #333;border-radius:20px;margin-top:5px;
	display:flex;justify-content:center;align-items:center;float:left;cursor:pointer;
}
.headerContainer > .headerRightContent > a > .teamInvite > i{font-size:18px;}
.headerContainer > .headerRightContent > a > .teamInvite > p{padding-left:10px;font-size:18px;}

<%-- DIM LAYER POPUP --%>
.pop-layers .pop-containers{background-color:#fff;border-radius:10px;}
.pop-layers{display:none;position:absolute;top:50%;left:50%;width:600px;height:auto;z-index:10;}
.dim-layers{display:none;position:fixed; _position:absolute;top:0;left:0;width:100%;height:100%;z-index:100;}
.dim-layers .dimBgs{position:absolute;top:0;left:0;width:100%;height:100%;background:#000;opacity:.5;filter:alpha(opacity=50);}
.dim-layers .pop-layers{display:block;width:600px;}
.pop-layers .pop-containers > .pop-contss > .pop-conts-headers {
	width:100%;height:50px;background-color:#eee;font-size:20px;border-radius:10px 10px 0px 0px;
}
.pop-layers .pop-containers > .pop-contss > .pop-conts-headers > p{float:left;padding:15px;}
.pop-layers .pop-containers > .pop-contss > .pop-conts-headers > a{float:right;padding:15px;}
.pop-layers .pop-containers > .pop-contss > .pop-conts-sections{width:100%;height:350px;font-size:20px;clear:both;}
.pop-layers .pop-containers > .pop-contss > .pop-conts-sections > .pop-conts-section-titles{width:100%;padding:20px;}
.pop-layers .pop-containers > .pop-contss > .pop-conts-sections > .pop-conts-section-titles > span{margin-left:7px;}
.pop-layers .pop-containers > .pop-contss > .pop-conts-sections > .pop-conts-section-titles > .projectTitleInputs { 
	margin-top:7px;font-size:20px;width:100%;outline:none;padding:5px;
}
.projectContentInputs{margin-top:7px;font-size:20px;width:100%;outline:none;padding:5px;}
.layerPopUpBtnsss{width:100%;margin-top:20px;display:flex;justify-content:center;}
.createProjectSubmits {
	font-size:20px;background-color:#746fcc;color:#fff;width:100px;height:50px;border-radius:5px;border:none;outline:none;cursor:pointer;float:left;
}
.layerPopupCloses{display:block;border:1px solid #ccc;width:100px;height:50px;border-radius:5px;float:left;text-align:center;line-height:50px;margin-left:20px;}

.headerContainer > .headerRightContent > .alarm{width:50px;height:50px;float:left;margin-left:10px;display:flex;justify-content:center;align-items:center;}
.headerContainer > .headerRightContent > .alarm > i{font-size:25px;cursor:pointer;}
.headerContainer > .headerRightContent > .alarm > .dialogs > #tabs > ul > li{font-size:20px;}
.headerContainer > .headerRightContent > .alarm > .dialogs > #tabs > #tabs-1 {
	font-size:20px;display:flex;justify-content:center;align-items:center;flex-direction:column;
}
.headerContainer > .headerRightContent > .alarm > .dialogs > #tabs > #tabs-1 > i{font-size:30px;}
.headerContainer > .headerRightContent > .alarm > .dialogs > #tabs > #tabs-1 > p{text-align:center;font-size:20px;margin-top:10px;}
.headerContainer > .headerRightContent > .alarm > .dialogs > #tabs > #tabs-2 {
	font-size:20px;
}
.headerContainer > .headerRightContent > .alarm > .dialogs > #tabs > #tabs-2 > i{font-size:30px;}
.headerContainer > .headerRightContent > .alarm > .dialogs > #tabs > #tabs-2 > p{text-align:center;font-size:20px;margin-top:10px;}
.headerContainer > .headerRightContent > .alarm > .dialogs > #tabs > #tabs-2 > ul > li {
	padding:10px 0px 10px 0px;border-bottom:1px solid #dee3eb;width:100%;vertical-align:middle;cursor:pointer;
}
.headerContainer > .headerRightContent > .alarm > .dialogs > #tabs > #tabs-2 > ul > li > i{vertical-align:middle;}
.headerContainer > .headerRightContent > .alarm > .dialogs > #tabs > #tabs-2 > ul > li > span{vertical-align:middle;}
.headerContainer > .headerRightContent > .currentUser{position:relative;width:70px;height:50px;float:left;display:flex;justify-content:center;align-items:center;}
.headerContainer > .headerRightContent > .currentUser > img{width:40px;height:40px;border-radius:100%;cursor:pointer;}
.headerContainer > .headerRightContent > .currentUser > i{margin-left:5px;color:#333;font-size:14px;cursor:pointer;}
.dialog__trigger, .dialog__action {
	display:block;-webkit-transition:all 150ms ease-out;transition:all 150ms ease-out;-webkit-transform:translateY(0px);
	transform:translateY(0px);
}
.dialog {
	width:300px;background-color:#fff;border:1px solid #dee3eb;border-radius:10px;
	position:absolute;top:0px;right:0px;visibility:hidden;opacity:0;-webkit-transition:all 180ms ease-in;
	transition:all 180ms ease-in;margin-top:20px;box-shadow:0px 0px 5px #000;padding:20px;
}
.dialog.dialog--active{top:40px;visibility:visible;opacity:1;-webkit-transition:all 250ms ease-out;transition:all 250ms ease-out;}
.dialogUserImg{width:100%;text-align:center;border-bottom:1px solid #dee3eb;}
.dialogUserImg > img{border-radius:100%;}
.dialogUserImg > p{font-size:25px;margin-top:10px;padding-bottom:20px;}
.dialog > ul{margin-top:20px;}
.dialog > ul > li{margin:10px 0px 10px 0px;}
.dialog > ul > li > a{font-size:20px;padding-left:10px;}

.dialog__triggers, .dialog__actions {
	display:block;-webkit-transition:all 150ms ease-out;transition:all 150ms ease-out;-webkit-transform:translateY(0px);
	transform:translateY(0px);
}
.dialogs {
	width:500px;background-color:#fff;border:1px solid #dee3eb;border-radius:10px;
	position:absolute;top:0px;right:0px;visibility:hidden;opacity:0;-webkit-transition:all 180ms ease-in;
	transition:all 180ms ease-in;margin-top:20px;box-shadow:0px 0px 5px #000;padding:20px;
}
.dialogs.dialog--actives{top:40px;visibility:visible;opacity:1;-webkit-transition:all 250ms ease-out;transition:all 250ms ease-out;}
.dialogUserImg{width:100%;text-align:center;border-bottom:1px solid #dee3eb;}
.dialogUserImg > img{border-radius:100%;}
.dialogUserImg > p{font-size:25px;margin-top:10px;padding-bottom:20px;}
.dialogs > ul{margin-top:20px;}
.dialogs > ul > li{margin:10px 0px 10px 0px;}
.dialogs > ul > li > a{font-size:20px;padding-left:10px;}

<%-- LEFT MENU --%>
.leftMenuUserInterface {
	width:100%;text-align:center;padding:40px 0px 40px 0px;position:relative;
	background-image:url("images/leftMenuUserInterfaceImg.gif");background-repeat:no-repeat;background-position:50% 50%;background-size:cover;
}
.leftMenuUserInterface > img{border-radius:100%;box-shadow:0px 0px 20px #fff;position:relative;z-index:2;}
.leftMenuUserInterface > p{font-size:25px;margin-top:20px;color:#fff;z-index:2;position:relative;}
.dimLeftMenuUserInterface{width:100%;height:100%;position:absolute;z-index:1;background-color:rgba(0,0,0,0.5);top:0px;left:0px;}
.cbp-spmenu{position:fixed;}
.cbp-spmenu-vertical{width:250px;height:100%;	top:0;z-index:2;border-right:1px solid #dee3eb;}
.cbp-spmenu-left{left:-250px;}
.cbp-spmenu-left.cbp-spmenu-open{left:0px;}
.cbp-spmenu-push{overflow-x:hidden;	position:relative;left:0;}
.cbp-spmenu-push-toright{left:250px;}
.cbp-spmenu-push-toleft{left:-250px;}
.cbp-spmenu, .cbp-spmenu-push{-webkit-transition:all 0.3s ease;-moz-transition:all 0.3s ease;transition:all 0.3s ease;}

.cbp-spmenu-vertical > .currentMainLeftMenu {
	width:100%;float:left;background-color:#fff;
}
.cbp-spmenu-vertical > .currentMainLeftMenu > .firstMenu > li:last-child{margin-bottom:20px;}
.cbp-spmenu-vertical > .currentMainLeftMenu > .firstMenu{border-top:1px solid #dee3eb;border-bottom:1px solid #dee3eb;}
.cbp-spmenu-vertical > .currentMainLeftMenu > .menuList{border-bottom:1px solid #dee3eb;}
.cbp-spmenu-vertical > .currentMainLeftMenu > .menuList > li:last-child{margin-bottom:20px;}
.cbp-spmenu-vertical > .currentMainLeftMenu > ul > li:first-child{margin-top:20px;}
.cbp-spmenu-vertical > .currentMainLeftMenu > ul > li {
	height:38px;font-size:18px;text-align:left;padding:10px 0px 10px 20px;cursor:pointer;text-indent:10px;clear:both;
}
.cbp-spmenu-vertical > .currentMainLeftMenu > ul > li:hover{background-color:#eee;}
.cbp-spmenu-vertical > .currentMainLeftMenu > ul > li > i{vertical-align:middle;float:left;}
.cbp-spmenu-vertical > .currentMainLeftMenu > ul > li > p{float:left;}

<%-- SECTION --%>
.currentMain{width:100%;min-height:100%;height:auto;background-color:#f2f4f7;padding-top:60px;float:left;}
.currentMain > .currentMainContainer{width:1400px;margin:0 auto;}

<%-- MAIN SLIDE --%>
.currentMain > .currentMainContainer > .currentMainSlide {margin-top:20px;width:1400px;height:500px;background-color:#fff;border:1px solid #dee3eb;}
.swiper-container{width:100%;height:100%;}
.swiper-slide {
	text-align:center;font-size:18px;background:#fff;display:-webkit-box;display:-ms-flexbox;display:-webkit-flex;display:flex;
	-webkit-box-pack:center;-ms-flex-pack:center;-webkit-justify-content:center;justify-content:center;-webkit-box-align:center;
	-ms-flex-align:center;-webkit-align-items:center;align-items:center;overflow:hidden;
}
.currentMain > .currentMainContainer > .currentMainProjectCreate {
	display:flex;flex-flow:row wrap;align-content:space-between;justify-content:space-between;
	width:1400px;height:auto;border:1px solid #dee3eb;float:left;margin:20px 0px 0px 0px;background-color:#fff;padding:20px;
}
.currentMain > .currentMainContainer > .currentMainProjectCreate > ul{display:block;width:1300px;margin:auto;}
.currentMain > .currentMainContainer > .currentMainProjectCreate > ul > li:first-child{cursor:pointer;}
.currentMain > .currentMainContainer > .currentMainProjectCreate > ul > li{float:left;margin-left:20px;margin-top:20px;}
.currentMain > .currentMainContainer > .currentMainProjectCreate > ul > li:first-child > a > .projectCard {
	display:flex;justify-content:center;align-items:center;line-height:40px;flex-direction:column;
	font-size:25px;background-color:#fff;border:1px solid #dee3eb;width:300px;height:300px;text-align:center;
}

<%-- DIM LAYER POPUP --%>
.pop-layer .pop-container{background-color:#fff;border-radius:10px;}
.pop-layer{display:none;position:absolute;top:50%;left:50%;width:600px;height:auto;z-index:10;}
.dim-layer{display:none;position:fixed; _position:absolute;top:0;left:0;width:100%;height:100%;z-index:100;}
.dim-layer .dimBg{position:absolute;top:0;left:0;width:100%;height:100%;background:#000;opacity:.5;filter:alpha(opacity=50);}
.dim-layer .pop-layer{display:block;width:600px;}
.pop-layer .pop-container > .pop-conts > .pop-conts-header{width:100%;height:50px;background-color:#eee;font-size:20px;border-radius:10px 10px 0px 0px;}
.pop-layer .pop-container > .pop-conts > .pop-conts-header > p{float:left;padding:15px;}
.pop-layer .pop-container > .pop-conts > .pop-conts-header > a{float:right;padding:15px;}
.pop-layer .pop-container > .pop-conts > .pop-conts-section{width:100%;height:300px;font-size:20px;clear:both;}
.pop-layer .pop-container > .pop-conts > .pop-conts-section > .pop-conts-section-title{width:100%;padding:20px;}
.pop-layer .pop-container > .pop-conts > .pop-conts-section > .pop-conts-section-title > span{margin-left:7px;}
.pop-layer .pop-container > .pop-conts > .pop-conts-section > .pop-conts-section-title > .projectTitleInput{margin-top:7px;font-size:20px;width:100%;outline:none;padding:5px;}
.projectContentInput{margin-top:7px;font-size:20px;width:100%;outline:none;padding:5px;}
.layerPopUpBtnss{width:100%;margin-top:20px;display:flex;justify-content:center;}
.createProjectSubmit {
	font-size:20px;background-color:#746fcc;color:#fff;width:100px;height:50px;border-radius:5px;border:none;outline:none;cursor:pointer;float:left;
}
.layerPopupClose{display:block;border:1px solid #ccc;width:100px;height:50px;border-radius:5px;float:left;text-align:center;line-height:50px;margin-left:20px;}

.currentMain > .currentMainContainer > .currentMainProjectCreate > ul > li > .projectCard {
	display:flex;line-height:40px;flex-direction:column;
	font-size:25px;background-color:#fff;border:1px solid #dee3eb;width:300px;height:300px;text-align:center;
}
.currentMain > .currentMainContainer > .currentMainProjectCreate > ul > li > .projectCard > .projectCardTitle {
	background-color:#746fcc;width:300px;height:180px;line-height:180px;color:#fff;font-size:22px;position:relative;cursor:pointer;
}
.currentMain > .currentMainContainer > .currentMainProjectCreate > ul > li > .projectCard > .projectCardTitle > i{position:absolute;top:20px;left:20px;cursor:pointer;}
.currentMain > .currentMainContainer > .currentMainProjectCreate > ul > li > .projectCard > .projectCardTitle > i:hover{color:yellow;font-weight:bold;}
.currentMain > .currentMainContainer > .currentMainProjectCreate > ul > li > .projectCard > .projectCardUserName{font-size:22px;line-height:30px;}
.currentMain > .currentMainContainer > .currentMainProjectCreate > ul > li > .projectCard > .projectCardUserName > img {
	margin-top:25px;border-radius:100%;width:30px;height:30px;
}

.currentMain > .currentMainContainer > .currentMainProjectCreates {
	display:flex;flex-flow:row wrap;align-content:space-between;justify-content:space-between;
	width:1400px;height:auto;border:1px solid #dee3eb;float:left;margin:20px 0px 20px 0px;background-color:#fff;padding:20px;
}
.currentMain > .currentMainContainer > .currentMainProjectCreates > ul{display:block;width:1300px;margin:auto;}
.currentMain > .currentMainContainer > .currentMainProjectCreates > ul > li:first-child{cursor:pointer;}
.currentMain > .currentMainContainer > .currentMainProjectCreates > ul > li{float:left;margin-left:20px;margin-top:20px;}
.currentMain > .currentMainContainer > .currentMainProjectCreates > ul > li:first-child > a > .projectCard {
	display:flex;justify-content:center;align-items:center;line-height:40px;flex-direction:column;
	font-size:25px;background-color:#fff;border:1px solid #dee3eb;width:300px;height:300px;text-align:center;
}
.currentMain > .currentMainContainer > .currentMainProjectCreates > ul > li > .projectCard {
	display:flex;line-height:40px;flex-direction:column;
	font-size:25px;background-color:#fff;border:1px solid #dee3eb;width:300px;height:300px;text-align:center;
}
.currentMain > .currentMainContainer > .currentMainProjectCreates > ul > li > .projectCard > .projectCardTitle {
	background-color:#746fcc;width:300px;height:180px;line-height:180px;color:#fff;font-size:22px;position:relative;cursor:pointer;
}
.currentMain > .currentMainContainer > .currentMainProjectCreates > ul > li > .projectCard > .projectCardTitle > i{position:absolute;top:20px;left:20px;cursor:pointer;}
.currentMain > .currentMainContainer > .currentMainProjectCreates > ul > li > .projectCard > .projectCardTitle > i:hover{color:yellow;font-weight:bold;}
.currentMain > .currentMainContainer > .currentMainProjectCreates > ul > li > .projectCard > .projectCardUserName{font-size:22px;line-height:30px;}
.currentMain > .currentMainContainer > .currentMainProjectCreates > ul > li > .projectCard > .projectCardUserName > img {
	margin-top:25px;border-radius:100%;width:30px;height:30px;
}


<%-- FOOTER --%>
.currentFooter{width:100%;height:100px;background-color:#fff;border-top:1px solid #dee3eb;clear:left;}
.footerContent{width:1400px;margin:0 auto;}
.footerContent > p{font-size:18px;text-align:left;padding:20px;line-height:30px;}
.footerContent > p > span{font-weight:bold;}
</style>
</head>

<body class="cbp-spmenu-push">

<nav class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-left" id="cbp-spmenu-s1">
	<div class="currentMainLeftMenu">
		<div class="leftMenuUserInterface">
			<div class="dimLeftMenuUserInterface"></div>
			<img src="http://placehold.it/100x100">
			<p>userName</p>
		</div>
		<ul class="firstMenu">
			<li>
				<i class="icon-grid icons"></i>
				<p>전체</p>
			</li>
			<li>
				<i class="icon-star icons"></i>
				<p>즐겨찾기</p>
			</li>
		</ul>
		<ul class="menuList">
			<li>
				<i class="icon-check icons"></i>
				<p>전체 업무</p>
			</li>
			<li>
				<i class="icon-calendar icons"></i>
				<p>전체 일정</p>
			</li>
			<li>
				<i class="icon-bubbles icons"></i>
				<p>회의</p>
			</li>
			<li>
				<i class="icon-bulb icons"></i>
				<p>이슈 히스토리</p>
			</li>
			<li>
				<i class="icon-list"></i>
				<p>투표</p>
			</li>
		</ul>
		<ul class="boardMenu">
			<li>
				<i class="icon-note icons"></i>
				<p>공지사항</p>
			</li>
			<li>
				<i class="icon-diamond icons"></i>
				<p>가이드</p>
			</li>
			<li>
				<i class="icon-question icons"></i>
				<p>Q & A</p>
			</li>
		</ul>
	</div>
</nav>

<div id="wrap">
	<%-- CURRENT HEADER --%>
	<header>
		<div class="headerContainer">
		
			<%-- LEFT MENU --%>
			<div class="currentMenu">
				<a class="menu-trigger" href="#" id="showLeftPush" onclick="return false;">
					<span></span>
					<span></span>
					<span></span>
				</a>
			</div>
		
			<%-- CURRENT LOGO --%>
			<div class="currentLogo">
				<img src="http://placehold.it/200x45">
			</div>
			
			<%-- CURRENT ALL SEARCH --%>
			<div class="currentAllSearch">
				<select>
					<option>ALL</option>
					<option>글</option>
					<option>참여자</option>
				</select>
				<input type="text" placeholder="전체에서 검색" class="headerSearchInputText" />
				<i class="icon-magnifier icons"></i>
			</div>
			
			<div class="headerRightContent">
				<%-- 팀원 초대 --%>
				<a href="#projectCreatePopUps" class="projectCreatePopUps">
					<div class="teamInvite">
						<i class="icon-plus icons"></i>
						<p>팀원초대</p>
					</div>
				</a>
				<div class="dim-layers">
					<div class="dimBgs"></div>
					<div id="projectCreatePopUps" class="pop-layers">
						<div class="pop-containers">
							<div class="pop-contss">
								<div class="pop-conts-headers">
									<p>팀원 초대</p>
									<a href="#" class="btn-layerCloses">
										<i class="icon-close icons"></i>
									</a>
								</div>
								<form action="#" method="post">
									<div class="pop-conts-sections">
										<div class="pop-conts-section-titles">
											<span>이메일을 통해 팀원을 초대할 수 있습니다</span>
											<br>
											<input type="email" name="" placeholder="이메일 입력" class="projectTitleInputs" />
											<br>
											<input type="email" name="" placeholder="example@gmail.com" class="projectTitleInputs" />
											<br>
											<input type="email" name="" placeholder="example@gmail.com" class="projectTitleInputs" />
											<br>
											<input type="email" name="" placeholder="example@gmail.com" class="projectTitleInputs" />
											<br>
											<input type="email" name="" placeholder="example@gmail.com" class="projectTitleInputs" />
											<br>
											<div class="layerPopUpBtnsss">
												<input type="submit" value="초대하기" class="createProjectSubmits">
												<a href="#" class="btn-layerCloses layerPopupCloses">취소</a>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				
				<%-- 알림 기능 --%>
				<div class="alarm dialog__triggers">
					<i class="icon-bell icons"></i>
					<div class="dialogs">
						<div id="tabs">
							<ul>
								<li><a href="#tabs-1">미확인 알림</a></li>
								<li><a href="#tabs-2">전체 알림</a></li>
							</ul>
							<div id="tabs-1">
								<i class="icon-bell icons"></i>
								<p>새 프로젝트 및 새 글이 등록되었을 때,<br>Push 메시지로 알려드려요!</p>
							</div>
							<div id="tabs-2">
								<ul>
									<li>
										<i class="icon-star icons"></i>
										<span>새 프로젝트가 등록 되었습니다!</span>
									</li>
									<li>
										<i class="icon-star icons"></i>
										<span>일감이 추가 되었습니다!</span>
										</li>
									<li>
										<i class="icon-star icons"></i>
										<span>업무가 등록 되었습니다!</span>
									</li>
									<li>
										<i class="icon-star icons"></i>
										<span>일정이 추가 되었습니다!</span>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				
				<%-- CURRENT USER --%>
				<div class="currentUser dialog__trigger">
					<img src="http://placehold.it/40x40" />
					<i class="icon-arrow-down icons"></i>
					<div class="dialog">
						<div class="dialogUserImg">
							<img src="http://placehold.it/100x100">
							<p>userName</p>
						</div>
						<ul>
							<li>
								<i class="icon-settings icons"></i>
								<a href="#">마이페이지</a>
							</li>
							<li>
								<i class="icon-power icons"></i>
								<a href="#">로그아웃</a>
							</li>
						</ul>
					</div>
				</div>				
			</div>
			
		</div>
	</header>
	
	<%-- CURRENT SECTION(MAIN) --%>
	<section class="currentMain">
		<div class="currentMainContainer">
			<div class="currentMainSlide">
				<%-- Swiper --%>
				<div class="swiper-container">
					<div class="swiper-wrapper">
						<div class="swiper-slide">
							<img src="images/slide1.png">
						</div>
						<div class="swiper-slide">
							<img src="http://placehold.it/1400x500">
						</div>
						<div class="swiper-slide">
							<img src="http://placehold.it/1400x500">
						</div>
					</div>
					
					<%-- Add Pagination --%>
					<div class="swiper-pagination"></div>
					
					<%-- Add Arrows --%>
					<div class="swiper-button-next"></div>
					<div class="swiper-button-prev"></div>
				</div>
			</div>
			<div class="currentMainProjectCreate">
				<ul>
					<li>
						<a href="#projectCreatePopUp" class="projectCreatePopUp">
							<div class="projectCard">							
								<div class="projectCardContent">
									<i class="icon-folder-alt icons"></i>
									<br>
									<p>프로젝트 만들기</p>
								</div>
							</div>
						</a>
						<form action="#" method="post">
							<div class="dim-layer">
								<div class="dimBg"></div>
								<div id="projectCreatePopUp" class="pop-layer">
									<div class="pop-container">
										<div class="pop-conts">
											<div class="pop-conts-header">
												<p>프로젝트 만들기</p>
												<a href="#" class="btn-layerClose">
													<i class="icon-close icons"></i>
												</a>
											</div>
											<div class="pop-conts-section">
												<div class="pop-conts-section-title">
													<span>프로젝트명</span>
													<br>
													<input name="" type="text" placeholder="프로젝트명 입력(최대 50자)" class="projectTitleInput" />
													<br><br>
													<span>프로젝트 개요</span>
													<br>
													<textarea name="" class="projectContentInput" placeholder="프로젝트 개요 입력"></textarea>
													<div class="layerPopUpBtnss">
														<input type="submit" value="만들기" class="createProjectSubmit">
														<a href="#" class="btn-layerClose layerPopupClose">취소</a>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</form>
					</li>
					<%-- 진행중인 프로젝트 리스트 --%>
					<li>
						<div class="projectCard">
							<div class="projectCardTitle">
								<i class="icon-star icons"></i>
								샘플 프로젝트 명
							</div>
							<div class="projectCardUserName">
								<img src="http://placehold.it/30x30">
								<br>
								user님 참여중
							</div>
						</div>
					</li>
				</ul>
			</div>
			<div class="currentMainProjectCreates">
				<ul>
					<%-- 초대받은 프로젝트 리스트 --%>
					<li>
						<div class="projectCard">
							<div class="projectCardTitle">
								<i class="icon-star icons"></i>
								샘플 프로젝트 명
							</div>
							<div class="projectCardUserName">
								<img src="http://placehold.it/30x30">
								<br>
								user님 참여중
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</section>
	
	<footer class="currentFooter">
		<div class="footerContent">
			<p>
				대전광역시 중구 중앙로 76 영민빌딩 2층 203호<br>
				기관명: (재)대덕인재개발원, 최종프로젝트 PMS(Project Management System)<br>
				Copyright 2018 <span>DDIT 203 Class, CURRENT</span> All rights reserved. 
			</p>
		</div>
	</footer>
</div>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.2/js/swiper.min.js"></script>
<script type="text/javascript" src="../js/classie.js"></script>
<script type="text/javascript" src="../js/jquery-ui.js"></script>
<script>
var swiper = new Swiper('.swiper-container', {
	loop: true,
	pagination: {
		el: '.swiper-pagination',
		type: 'progressbar',
	},
	navigation: {
		nextEl: '.swiper-button-next',
		prevEl: '.swiper-button-prev',
	},
<%-- 	autoplay: {
		delay: 1500,
		disableOnInteraction: false,
	}, --%>
});

<%-- DIM POPUP  --%>
$('.projectCreatePopUp').click(function(){
    var $href = $(this).attr('href');
    layer_popup($href);
});
function layer_popup(el){
    var $el = $(el);        <%--레이어의 id를 $el 변수에 저장  --%>
    var isDim = $el.prev().hasClass('dimBg');   <%--dimmed 레이어를 감지하기 위한 boolean 변수  --%>

    isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();

    var $elWidth = ~~($el.outerWidth()),
        $elHeight = ~~($el.outerHeight()),
        docWidth = $(document).width(),
        docHeight = $(document).height();

    <%-- 화면의 중앙에 레이어를 띄운다.  --%>
    if ($elHeight < docHeight || $elWidth < docWidth) {
        $el.css({
            marginTop: -$elHeight /2,
            marginLeft: -$elWidth/2
        })
    } else {
        $el.css({top: 0, left: 0});
    }

    $el.find('a.btn-layerClose').click(function(){
        isDim ? $('.dim-layer').fadeOut() : $el.fadeOut(); <%-- 닫기 버튼을 클릭하면 레이어가 닫힌다. --%>
        return false;
    });

    $('.layer .dimBg').click(function(){
        $('.dim-layer').fadeOut();
        return false;
    });
}

<%-- DIM POPUP - 팀원초대  --%>
$('.projectCreatePopUps').click(function(){
    var $hrefs = $(this).attr('href');
    layer_popups($hrefs);
});
function layer_popups(els){
    var $els = $(els);        <%--레이어의 id를 $el 변수에 저장  --%>
    var isDims = $els.prev().hasClass('dimBgs');   <%--dimmed 레이어를 감지하기 위한 boolean 변수  --%>

    isDims ? $('.dim-layers').fadeIn() : $els.fadeIn();

    var $elWidths = ~~($els.outerWidth()),
        $elHeights = ~~($els.outerHeight()),
        docWidths = $(document).width(),
        docHeights = $(document).height();

    <%-- 화면의 중앙에 레이어를 띄운다.  --%>
    if ($elHeights < docHeights || $elWidths < docWidths) {
        $els.css({
            marginTop: -$elHeights /2,
            marginLeft: -$elWidths/2
        })
    } else {
        $els.css({top: 0, left: 0});
    }

    $els.find('a.btn-layerCloses').click(function(){
        isDims ? $('.dim-layers').fadeOut() : $els.fadeOut(); <%-- 닫기 버튼을 클릭하면 레이어가 닫힌다.  --%>
        return false;
    });

    $('.layer .dimBgs').click(function(){
        $('.dim-layers').fadeOut();
        return false;
    });
}

var menuLeft = document.getElementById('cbp-spmenu-s1'),
	 showLeftPush = document.getElementById('showLeftPush'),
	 body = document.body;

$("#showLeftPush").click(function(){
	classie.toggle( this, 'active' );
	classie.toggle( body, 'cbp-spmenu-push-toright' );
	classie.toggle( menuLeft, 'cbp-spmenu-open' );
});

function dialog(){
	var dialogBox = $('.dialog'),
		 dialogTrigger = $('.dialog__trigger'),
		 dialogAction = $('.dialog__action');
		 
		 <%-- Open the dialog  --%>
		 dialogTrigger.on('click', function(e){
			 dialogBox.toggleClass('dialog--active');
			 e.stopPropagation()
		 });

		 $(".dialog").click(function(){
			 dialogBox.toggleClass('dialog--active');
		 });

		 $(".dialog__triggers").click(function(){
			 dialogBox.removeClass('dialog--active');
		 });

		 <%-- Close the dialog - press escape key  key#27  --%>
		 $(document).keyup(function(e){
			 if(e.keyCode === 27){
				 dialogBox.removeClass('dialog--active');
			 }
		 });
};

<%-- Run function when the document has loaded  --%>
$(function(){
	dialog();
});

function dialogs(){
	var dialogBoxs = $('.dialogs'),
		 dialogTriggers = $('.dialog__triggers'),
		 dialogActions = $('.dialog__actions');
		 
		 <%-- Open the dialog  --%>
		 dialogTriggers.on('click', function(e){
			 dialogBoxs.toggleClass('dialog--actives');
			 e.stopPropagation()
		 });

		 $(".dialogs").click(function(){
			 dialogBoxs.toggleClass('dialog--actives');
		 });

		 $(".dialog__trigger").click(function(){
			 dialogBoxs.removeClass('dialog--actives');
		 });

		 <%-- Close the dialog - press escape key  key#27  --%>
		 $(document).keyup(function(e){
			 if(e.keyCode === 27){
				 dialogBoxs.removeClass('dialog--actives');
			 }
		 });
};

<%-- Run function when the document has loaded --%>
$(function(){
	dialogs();
});

<%-- 알람 탭 메뉴 --%>
$("#tabs").tabs();


</script>
</body>
</html>