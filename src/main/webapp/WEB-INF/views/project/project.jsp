<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SUB MAIN - CURRENT</title>
<link rel="shortcut icon" type="image/x-icon" href="images/favicon.png" />
<!-- NANUM SQUARE FONT -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.css">
<link rel="stylesheet" type="text/css" href="css/swiper.min.css">
<link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
<style type="text/css">
/* COMMON */
*{margin:0px;padding:0px;font-family:'NanumSquare', sans-serif;box-sizing:border-box;}
a{text-decoration:none;color:#000;}
html, body{height:100%;overflow-x:hidden;}
ul{list-style-type:none;}
#wrap{width:100%;height:100%;}

/* HEADER */
header{width:100%;min-width:1200px;height:60px;background-color:rgba(255,255,255,0.8);border-bottom:1px solid #ccc;position:fixed;z-index:3;}
.headerContainer{width:1400px;height:60px;margin:0 auto;}
.headerContainer > .currentMenu{width:45px;height:45px;float:left;margin-top:7px;}

/* LEFT MENU BUTTON */
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

/* DIM LAYER POPUP */
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

.dialog__triggerss, .dialog__actionss {
	display:block;-webkit-transition:all 150ms ease-out;transition:all 150ms ease-out;-webkit-transform:translateY(0px);
	transform:translateY(0px);
}
.dialogss {
	width:300px;background-color:#fff;border:1px solid #dee3eb;border-radius:10px;
	position:absolute;top:0px;right:0px;visibility:hidden;opacity:0;-webkit-transition:all 180ms ease-in;
	transition:all 180ms ease-in;margin-top:20px;box-shadow:0px 0px 5px #000;padding:20px;
}
.dialogss.dialog--activess{top:40px;visibility:visible;opacity:1;-webkit-transition:all 250ms ease-out;transition:all 250ms ease-out;}
.dialogss > ul > li:first-child{font-weight:bold;padding:10px 0px 10px 0px;font-size:18px;border-bottom:1px solid #dee3eb;margin-bottom:20px;}
.dialogss > ul > li{font-size:18px;line-height:25px;cursor:pointer;}


/* LEFT MENU */
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

/* SECTION */
.currentMain{width:100%;min-height:100%;height:auto;background-color:#f2f4f7;padding-top:60px;float:left;}
.currentMain > .currentMainContainer{width:1400px;margin:0 auto;position:relative;}
.currentMain > .currentMainContainer > .currentMainContainerLeft{width:1000px;float:left;margin-top:10px;margin-bottom:10px;}
.currentMain > .currentMainContainer > .currentMainContainerRight{margin-left:10px;width:380px;float:left;margin-top:10px;}
.currentSubMainTitle{width:1000px;height:70px;background-color:#fff;border:1px solid #dee3eb;font-size:25px;line-height:70px;position:relative;float:left;}
.currentSubMainTitle > i.icon-star{vertical-align:middle;margin-left:30px;}
.currentSubMainTitle > span{vertical-align:middle;margin-left:15px;}
.currentSubMainTitle > i.icon-share{vertical-align:middle;margin-left:30px;position:absolute;top:22px;right:30px;cursor:pointer;}
.projectTeams{position:fixed;width:387px;height:782px;overflow-y:scroll;background-color:#fff;border:1px solid #dee3eb;}
.projectTeams > h2{font-weight:normal;line-height:70px;margin-left:20px;}
.projectTeams > ul > li{padding:10px 0px 10px 0px;}
.projectTeams > ul > li:first-child{border-bottom:1px solid #dee3eb;padding-bottom:10px;}
.projectTeams > ul > li > .projectPositionName{margin-left:20px;font-size:18px;}
.projectTeams > ul > li > .chatList{width:100%;height:50px;padding-left:20px;margin-top:10px;}
.projectTeams > ul > li > .chatList > img{border-radius:100%;vertical-align:middle;}
.projectTeams > ul > li > .chatList > .projectUserNameList{vertical-align:middle;padding-left:15px;font-size:18px;}
.projectList{width:1000px;background-color:#fff;border:1px solid #dee3eb;float:left;margin-top:10px;}
.projectList > .projectListTitles{margin:20px 0px 0px 20px;font-size:20px;}
.projectList > .projectListTitles > i{vertical-align:middle;}
.projectList > .projectListTitles > span{vertical-align:middle;}
.projectList > .charts{padding:20px;width:100%;}
.projectList > .charts > .chartsContent{float:left;}
.projectList > .charts > .chartsNumber{float:left;font-size:20px;margin-bottom:20px;margin-left:90px;}
.projectList > .charts > .chartsNumber > ul{margin-top:25px;}
.projectList > .charts > .chartsNumber > ul > li{padding:20px;margin-left:10px;float:left;cursor:pointer;}
.projectList > .charts > .chartsNumber > ul > li > i{vertical-align:middle;}
.projectList > .charts > .chartsNumber > ul > li > span{vertical-align:middle;}
.projectList > .charts > .chartsNumber > ul > li:first-child{color:rgba(255, 99, 132, 1);}
.projectList > .charts > .chartsNumber > ul > li:nth-child(2){color:rgba(54, 162, 235, 1);}
.projectList > .charts > .chartsNumber > ul > li:nth-child(3){color:rgba(255, 206, 86, 1);}
.projectList > .charts > .chartsNumber > ul > li:nth-child(4){color:rgba(75, 192, 192, 1);}
.projectList > .charts > .chartsNumber > ul > li:last-child{color:rgba(153, 102, 255, 1);margin-bottom:30px;}

.projectTaskContainer{width:1000px;background-color:#fff;border:1px solid #dee3eb;float:left;margin-top:10px;height:70px;}
.projectTaskContainer > .projectTaskContainerTitle{margin:20px 0px 0px 20px;font-weight:normal;font-size:20px;}
.projectTaskContainer > .projectTaskContainerTitle > i{vertical-align:middle;display:block;float:left;}
.projectTaskContainer > .projectTaskContainerTitle > span{display:block;margin-left:10px;vertical-align:middle;float:left;}

.projectTaskContainerDragDrop{width:1000px;background-color:transparent;float:left;margin-top:10px;}
.projectTaskDragDrop{clear:left;}
#titleList{width:998px;height:45px;line-height:45px;font-size:20px;}
#titleList > li{float:left;}
.titleBox{width:199.5px;float:left;text-align:center;}
#planList{width:998px;height:100px;background-color:transparent;}
#planList > .column{width:190px;height:300px;float:left;border:1px solid #dee3eb;background-color:#fff;}
#planList > .column:first-child{margin-left:1px;}
#planList > .column:nth-child(2){margin-left:10px;}
#planList > .column:nth-child(3){margin-left:10px;}
#planList > .column:nth-child(4){margin-left:10px;}
#planList > .column:last-child{margin-left:10px;}
.portlet-placeholder{border:1px dotted black;height:150px;}
.portlet-header{width:100%;height:50px;font-size:20px;text-indent:10px;line-height:50px;}
.portlet-content{width:100%;height:100px;font-size:18px;padding:10px;background-color:#f2f2f2;overflow-y:scroll;}

.projectWriter{width:1000px;background-color:#fff;border:1px solid #dee3eb;float:left;margin-top:10px;}
.tabssTextArea{width:100%;height:100%;outline:none;text-indent:10px;font-size:20px;border:none;}
.tabssTextAreaSubmit {
	float:right;width:100px;height:40px;font-size:18px;background-color:#fff;border:1px solid #dee3eb;outline:none;cursor:pointer;
	margin:10px 0px 10px 0px;border-radius:5px;transition:0.5s;font-weight:normal;line-height:40px;
}
.tabssTextAreaSubmit:hover{background-color:#007fff;color:#fff;line-height:40px;border:1px solid #003eff;}
.calendarTitle{width:100%;outline:none;font-size:20px;text-indent:10px;padding:5px 0px 5px 0px;margin-top:5px;}
.calendarMemo{width:100%;outline:none;font-size:20px;text-indent:10px;padding:5px 0px 5px 0px;margin-top:5px;}
.calendarContainerInput{width:530px;padding:0px 0px 5px 0px;}
.calendarInputDiv{margin-top:5px;float:left;}
.calendarInputDiv > i{vertical-align:middle;font-size:20px;}
.calendarInputDiv > input[type=date]{vertical-align:middle;font-size:20px;}
.calendarInputDivSpan{float:left;font-size:30px;padding-top:5px;margin-left:20px;}
.calendarInputDivs{margin-top:5px;float:left;}
.calendarInputDivs > i{vertical-align:middle;font-size:20px;margin-left:20px;}
.calendarInputDivs > input[type=date]{vertical-align:middle;font-size:20px;}
.todoInput{width:100%;outline:none;font-size:20px;text-indent:10px;padding:5px 0px 5px 0px;margin-top:5px;}
.todoInputContent{width:100%;outline:none;font-size:20px;text-indent:10px;padding:5px 0px 5px 0px;margin-top:5px;}
.todoPlus{margin:10px 0px 0px 0px;height:25px;}
.todoPlus > i{font-size:20px;vertical-align:middle;float:left;cursor:pointer;}
.todoPlus > span{display:block;font-size:20px;vertical-align:middle;margin-left:5px;float:left;cursor:pointer;}

.currentCardList{width:1000px;background-color:#fff;border:1px solid #dee3eb;float:left;margin-top:10px;}
.cardUserInfo{padding:10px;width:100%;height:70px;margin-top:20px;}
.cardUserInfoImg{float:left;height:50px;padding-top:5px;padding-left:20px;}
.cardUserInfoImg > img{border-radius:100%;}
.cardUserInfoName{height:50px;float:left;padding-left:15px;padding-top:3px;}
.cardUserInfoName > b{font-size:20px;}
.cardUserInfoName > span{font-size:18px;color:#333;}
.updateDeleteIcon{float:right;width:50px;height:50px;margin-right:20px;text-align:center;padding-top:10px;}
.updateDeleteIcon > i{font-size:25px;cursor:pointer;}
.cardContent{width:100%;height:250px;padding:20px 30px 20px 30px;}
.cardContent > textarea{border:none;width:100%;height:100%;outline:none;font-size:18px;}
.cardContentBottom{width:100%;height:60px;padding:20px;border-top:1px solid #dee3eb;font-size:20px;}
.cardContentBottom > i{cursor:pointer;}
.cardContentBottom > span{cursor:pointer;vertical-align:middle;}
.cardContentBottom > i.icon-bubble{margin-left:20px;vertical-align:middle;}
.cardContentBottom > i.icon-bulb{margin-left:25px;vertical-align:middle;}
.cardContentComment{width:100%;min-height:150px;background-color:#f6f7f8;border-top:1px solid #dee3eb;}
.cardContentComment > ul > li:last-child{padding-bottom:20px;}
.cardContentCommentUser{width:100%;height:70px;padding:20px;}
.cardContentCommentUser > .cardContentCommentUserImg{float:left;margin-left:20px;}
.cardContentCommentUser > .cardContentCommentUserImg > img {border-radius:100%;}
.cardContentCommentUser > .cardContentCommentUserName{float:left;padding-top:1px;margin-left:15px;font-size:20px;}
.cardContentCommentUser > .cardContentCommentUserName > .times{margin-left:15px;color:#333;font-size:18px;}
.commentInput {
	width:850px;outline:none;font-size:20px;text-indent:10px;padding:5px 0px 5px 0px;margin-top:2px;
	border:1px solid #dee3eb;
}


/* FOOTER */
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
	<!-- CURRENT HEADER -->
	<header>
		<div class="headerContainer">
		
			<!-- LEFT MENU -->
			<div class="currentMenu">
				<a class="menu-trigger" href="#" id="showLeftPush" onclick="return false;">
					<span></span>
					<span></span>
					<span></span>
				</a>
			</div>
		
			<!-- CURRENT LOGO -->
			<div class="currentLogo">
				<img src="http://placehold.it/200x45">
			</div>
			
			<!-- CURRENT ALL SEARCH -->
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
				<!-- 팀원 초대 -->
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
								<div class="pop-conts-sections">
									<div class="pop-conts-section-titles">
										<span>이메일을 통해 팀원을 초대할 수 있습니다</span>
										<br>
										<input type="email" placeholder="이메일 입력" class="projectTitleInputs" />
										<br>
										<input type="email" placeholder="example@gmail.com" class="projectTitleInputs" />
										<br>
										<input type="email" placeholder="example@gmail.com" class="projectTitleInputs" />
										<br>
										<input type="email" placeholder="example@gmail.com" class="projectTitleInputs" />
										<br>
										<input type="email" placeholder="example@gmail.com" class="projectTitleInputs" />
										<br>
										<div class="layerPopUpBtnsss">
											<input type="submit" value="초대하기" class="createProjectSubmits">
											<a href="#" class="btn-layerCloses layerPopupCloses">취소</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<!-- 알림 기능 -->
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
				
				<!-- CURRENT USER -->
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
	
	<!-- CURRENT SECTION(MAIN) -->
	<section class="currentMain">
		<div class="currentMainContainer">
			<div class="currentMainContainerLeft">
				<div class="currentSubMainTitle">
					<i class="icon-star icons"></i>
					<span>샘플 프로젝트</span>
					<i class="icon-share icons dialog__triggerss"></i>
					<div class="dialogss">
						<ul>
							<li>프로젝트 설정</li>
							<li>알림(푸쉬) 설정</li>
							<li>프로젝트 숨기기</li>
						</ul>
					</div>
				</div>
				<div class="projectList">
					<div class="projectListTitles">
						<i class="icon-check icons"></i>
						<span>업무 리포트 보기</span>
					</div>
					<div class="charts">
						<div class="chartsContent">
							<canvas id="myChart" width="960" height="400"></canvas>
						</div>
						<div class="chartsNumber">
							<ul>
								<li>
									<i class="icon-pie-chart icons"></i>
									<span>요청 12건</span>
								</li>
								<li>
									<i class="icon-pie-chart icons"></i>
									<span>진행 19건</span>
								</li>
								<li>
									<i class="icon-pie-chart icons"></i>
									<span>피드백 3건</span>
								</li>
								<li>
									<i class="icon-pie-chart icons"></i>
									<span>완료 5건</span>
								</li>
								<li>
									<i class="icon-pie-chart icons"></i>
									<span>보류 2건</span>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="projectTaskContainer">
					<div class="projectTaskContainerTitle">
						<i class="icon-share-alt icons"></i><span>업무</span>
					</div>
				</div>
				<div class="projectTaskContainerDragDrop">
					<div class="projectTaskDragDrop">
						<ul id="titleList">
							<li class="titleBox">요청</li>
							<li class="titleBox">진행</li>
							<li class="titleBox">이슈발생</li>
							<li class="titleBox">처리대기</li>
							<li class="titleBox">완료</li>
						</ul>
						
						<div class="kku-boarder kku-mainPage" id="planList">
							<div class="column">
								<div class="portlet">
				                    <div class="portlet-header">TITLE</div>
				                    <div class="portlet-content">
				                    	CONTENT CONTENT CONTENT CONTENT CONTENT CONTENT CONTENT CONTENT CONTENT CONTENT CONTENT CONTENT
				                    </div>
				                    <label class="kku-hide kku-no">1</label>
				                    <label class="kku-hide kku-group">1</label>
				                    <label class="kku-hide kku-index">1</label>
				                </div>
							</div>
							<div class="column">
								<div class="portlet">
									<label class="kku-hide kku-group">2</label>
								</div>
							</div>
							<div class="column">
								<div class="portlet">
									<label class="kku-hide kku-group">3</label>
								</div>
							</div>
							<div class="column">
								<div class="portlet">
									<label class="kku-hide kku-group">4</label>
								</div>
							</div>
							<div class="column">
								<div class="portlet">
									<label class="kku-hide kku-group">5</label>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="projectWriter">
					<div id="tabss">
						<ul>
							<li><a href="#tabss-1">글</a></li>
							<li><a href="#tabss-2">일정</a></li>
							<li><a href="#tabss-3">할일</a></li>
						</ul>
						<div id="tabss-1">
							<textarea class="tabssTextArea" placeholder="글을 작성하세요"></textarea>
							<input type="submit" class="tabssTextAreaSubmit" value="올리기" />
						</div>
						<div id="tabss-2">
							<input type="text" placeholder="일정 제목을 입력하세요" class="calendarTitle" />
							<div class="calendarContainerInput">
								<div class="calendarInputDiv">
									<i class="icon-clock icons"></i>
									<input type="date">
								</div>
								<span class="calendarInputDivSpan">~</span>
								<div class="calendarInputDivs">
									<i class="icon-clock icons"></i>
									<input type="date">
								</div>
							</div>
							<input type="text" placeholder="장소를 입력하세요" class="calendarTitle" />
							<input type="text" placeholder="메모를 입력하세요" class="calendarMemo" />
							<input type="submit" class="tabssTextAreaSubmit" value="올리기" />
						</div>
						<div id="tabss-3">
							<input type="text" placeholder="할일제목을 입력하세요(선택)" class="todoInput" />
							<ul>
								<li><input type="text" placeholder="할일 입력" class="todoInputContent" /></li>
								<li><input type="text" placeholder="할일 입력" class="todoInputContent" /></li>
								<li><input type="text" placeholder="할일 입력" class="todoInputContent" /></li>
							</ul>
							<div class="todoPlus">
								<i class="icon-plus icons"></i>
								<span>할일 추가</span>
							</div>
							<input type="submit" class="tabssTextAreaSubmit" value="올리기" />
						</div>
					</div>
				</div>
				<div class="currentCardList">
					<div class="cardUserInfo">
						<div class="cardUserInfoImg">
							<img src="http://placehold.it/40x40">
						</div>
						<div class="cardUserInfoName">
							<b>userName</b><br>
							<span>2018-12-05 10:27</span>
						</div>
						<div class="updateDeleteIcon">
							<i class="icon-wrench icons"></i>
						</div>
					</div>
					<div class="cardContent">
						<textarea readonly>test content test content test content test content test content test content test content test content test content test content</textarea>
					</div>
					<div class="cardContentBottom">
						<i class="icon-bubble icons"></i>
						<span>댓글 작성</span>
						
						<i class="icon-bulb icons"></i>
						<span>이슈 등록</span>
					</div>
					<div class="cardContentComment">
						<ul>
							<li>
								<div class="cardContentCommentUser">
									<div class="cardContentCommentUserImg">
										<img src="http://placehold.it/40x40">
									</div>
									<div class="cardContentCommentUserName">
										<b>userName</b><span class="times">2018-12-05 14:19</span>
										<br>
										<span>content~~~~~~~~~~~~~~~~~~~~~~~~~</span>
									</div>
								</div>
							</li>
							<li>
								<div class="cardContentCommentUser">
									<div class="cardContentCommentUserImg">
										<img src="http://placehold.it/40x40">
									</div>
									<div class="cardContentCommentUserName">
										<b>userName</b><span class="times">2018-12-05 14:19</span>
										<br>
										<span>content~~~~~~~~~~~~~~~~~~~~~~~~~</span>
									</div>
								</div>
							</li>
							<li>
								<div class="cardContentCommentUser">
									<div class="cardContentCommentUserImg">
										<img src="http://placehold.it/40x40">
									</div>
									<div class="cardContentCommentUserName">
										<b>userName</b><span class="times">2018-12-05 14:19</span>
										<br>
										<span>content~~~~~~~~~~~~~~~~~~~~~~~~~</span>
									</div>
								</div>
							</li>
							<li>
								<div class="cardContentCommentUser">
									<div class="cardContentCommentUserImg">
										<img src="http://placehold.it/40x40">
									</div>
									<div class="cardContentCommentUserName">
										<b>userName</b><span class="times">2018-12-05 14:19</span>
										<br>
										<span>content~~~~~~~~~~~~~~~~~~~~~~~~~</span>
									</div>
								</div>
							</li>
							<li>
								<div class="cardContentCommentUser">
									<div class="cardContentCommentUserImg">
										<img src="http://placehold.it/40x40">
									</div>
									<div class="cardContentCommentUserName">
										<b>userName</b><span class="times">2018-12-05 14:19</span>
										<br>
										<span>content~~~~~~~~~~~~~~~~~~~~~~~~~</span>
									</div>
								</div>
							</li>
							<li>
								<div class="cardContentCommentUser">
									<div class="cardContentCommentUserImg">
										<img src="http://placehold.it/40x40">
									</div>
									<div class="cardContentCommentUserName">
										<b>userName</b><span class="times">2018-12-05 14:19</span>
										<br>
										<span>content~~~~~~~~~~~~~~~~~~~~~~~~~</span>
									</div>
								</div>
							</li>
							<li>
								<div class="cardContentCommentUser">
									<div class="cardContentCommentUserImg">
										<img src="http://placehold.it/40x40">
									</div>
									<div class="cardContentCommentUserName">
										<b>userName</b><span class="times">2018-12-05 14:19</span>
										<br>
										<span>content~~~~~~~~~~~~~~~~~~~~~~~~~</span>
									</div>
								</div>
							</li>
							<li>
								<div class="cardContentCommentUser">
									<div class="cardContentCommentUserImg">
										<img src="http://placehold.it/40x40">
									</div>
									<div class="cardContentCommentUserName">
										<b>userName</b><span class="times">2018-12-05 14:19</span>
										<br>
										<span>content~~~~~~~~~~~~~~~~~~~~~~~~~</span>
									</div>
								</div>
							</li>
							<li>
								<div class="cardContentCommentUser">
									<div class="cardContentCommentUserImg">
										<img src="http://placehold.it/40x40">
									</div>
									<div class="cardContentCommentUserName">
										<b>userName</b><span class="times">2018-12-05 14:19</span>
										<br>
										<span>content~~~~~~~~~~~~~~~~~~~~~~~~~</span>
									</div>
								</div>
							</li>
						</ul>
						<ul>
							<li>
								<div class="cardContentCommentUser">
									<div class="cardContentCommentUserImg">
										<img src="http://placehold.it/40x40">
									</div>
									<div class="cardContentCommentUserName">
										<input type="text" placeholder="댓글을 입력해주세요" class="commentInput">
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
			
			<div class="currentMainContainerRight">
				<div class="projectTeams">
					<h2>전체 참여자 7명</h2>
					<ul>
						<li>
							<span class="projectPositionName">프로젝트 관리자</span>
							<div class="chatList">
								<img src="http://placehold.it/50x50">
								<span class="projectUserNameList">관리자</span>
							</div>
						</li>
						<li>
							<span class="projectPositionName">외부참여자</span>
							<div class="chatList">
								<img src="http://placehold.it/50x50">
								<span class="projectUserNameList">userName</span>
							</div>
						</li>
						<li>
							<span class="projectPositionName">외부참여자</span>
							<div class="chatList">
								<img src="http://placehold.it/50x50">
								<span class="projectUserNameList">userName</span>
							</div>
						</li>
						<li>
							<span class="projectPositionName">외부참여자</span>
							<div class="chatList">
								<img src="http://placehold.it/50x50">
								<span class="projectUserNameList">userName</span>
							</div>
						</li>
						<li>
							<span class="projectPositionName">외부참여자</span>
							<div class="chatList">
								<img src="http://placehold.it/50x50">
								<span class="projectUserNameList">userName</span>
							</div>
						</li>
						<li>
							<span class="projectPositionName">외부참여자</span>
							<div class="chatList">
								<img src="http://placehold.it/50x50">
								<span class="projectUserNameList">userName</span>
							</div>
						</li>
						<li>
							<span class="projectPositionName">외부참여자</span>
							<div class="chatList">
								<img src="http://placehold.it/50x50">
								<span class="projectUserNameList">userName</span>
							</div>
						</li>
					</ul>
				</div>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.js"></script> 
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="js/classie.js"></script>
<script>
// DIM POPUP - 팀원초대
$('.projectCreatePopUps').click(function(){
    var $hrefs = $(this).attr('href');
    layer_popups($hrefs);
});
function layer_popups(els){
    var $els = $(els);        //레이어의 id를 $el 변수에 저장
    var isDims = $els.prev().hasClass('dimBgs');   //dimmed 레이어를 감지하기 위한 boolean 변수

    isDims ? $('.dim-layers').fadeIn() : $els.fadeIn();

    var $elWidths = ~~($els.outerWidth()),
        $elHeights = ~~($els.outerHeight()),
        docWidths = $(document).width(),
        docHeights = $(document).height();

    // 화면의 중앙에 레이어를 띄운다.
    if ($elHeights < docHeights || $elWidths < docWidths) {
        $els.css({
            marginTop: -$elHeights /2,
            marginLeft: -$elWidths/2
        })
    } else {
        $els.css({top: 0, left: 0});
    }

    $els.find('a.btn-layerCloses').click(function(){
        isDims ? $('.dim-layers').fadeOut() : $els.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
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
		 
		 // Open the dialog
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
		 $(".dialog__triggerss").click(function(){
			 dialogBox.removeClass('dialog--active');
		 });

		 // Close the dialog - press escape key // key#27
		 $(document).keyup(function(e){
			 if(e.keyCode === 27){
				 dialogBox.removeClass('dialog--active');
			 }
		 });
};

// Run function when the document has loaded
$(function(){
	dialog();
});

function dialogs(){
	var dialogBoxs = $('.dialogs'),
		 dialogTriggers = $('.dialog__triggers'),
		 dialogActions = $('.dialog__actions');
		 
		 // Open the dialog
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
		 $(".dialog__triggerss").click(function(){
			 dialogBoxs.removeClass('dialog--actives');
		 });

		 // Close the dialog - press escape key // key#27
		 $(document).keyup(function(e){
			 if(e.keyCode === 27){
				 dialogBoxs.removeClass('dialog--actives');
			 }
		 });
};

// Run function when the document has loaded
$(function(){
	dialogs();
});

function dialogss(){
	var dialogBoxss = $('.dialogss'),
		 dialogTriggerss = $('.dialog__triggerss'),
		 dialogActionss = $('.dialog__actionss');
		 
		 // Open the dialog
		 dialogTriggerss.on('click', function(e){
			 dialogBoxss.toggleClass('dialog--activess');
			 e.stopPropagation()
		 });

		 $(".dialogss").click(function(){
			 dialogBoxss.toggleClass('dialog--activess');
		 });

		 $(".dialog__trigger").click(function(){
			 dialogBoxss.removeClass('dialog--activess');
		 });
		 
		 $(".dialog__triggers").click(function(){
			 dialogBoxss.removeClass('dialog--activess');
		 });

		 // Close the dialog - press escape key key#27
		 $(document).keyup(function(e){
			 if(e.keyCode === 27){
				 dialogBoxss.removeClass('dialog--activess');
			 }
		 });
};

// Run function when the document has loaded
$(function(){
	dialogss();
});

// 알람 탭 메뉴
$("#tabs").tabs();

// 서브 메인 작성 카드 리스트
$("#tabss").tabs();

var ctx = document.getElementById("myChart").getContext('2d');
var myChart = new Chart(ctx, {
    type: 'pie',
    data: {
        labels: ["요청", "진행", "피드백", "완료", "보류"],
        datasets: [{
            label: '',
            data: [12, 19, 3, 5, 2],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)'
            ],
            borderColor: [
                'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero:true
                }
            }]
        }
    }
});
</script>
<script>
	$(document).ready(function () {
		$('.kku-hide').hide();
	});
	$( function() {
		var tabs = $("#planList").tabs();
		tabs.find(".column" ).sortable({
			connectWith: ".column",
			handle: ".portlet-header",
			cancel: ".portlet-toggle",
			placeholder: "portlet-placeholder ui-corner-all",
			stop      : function(event, ui){
				var prev = isNaN(parseFloat(ui.item.prev().children(".kku-index").text()))  ?  9999999 : parseInt(ui.item.prev().children(".kku-index").text());
				var next = isNaN(parseFloat(ui.item.next().children(".kku-index").text())) ? 0 : parseInt(ui.item.next().children(".kku-index").text());
				var index = prev - ((prev - next) / 2);
				var no = parseInt(ui.item.children(".kku-no").text());
				var group = ui.item.prev().children(".kku-group").text();
				if (group === "" ) {
					group = ui.item.next().children(".kku-group").text();
                }
				// alert(next)
                // alert(index)
				// alert(index)

				//alert(ui.item.prev().index());
				//alert(ui.item.prev().text()) //전값
				//alert(ui.item.text()) //현재값
				//alert(ui.item.next().text()) //다음값
				tabs.tabs("refresh");
				updateCard(no, group, index);
			}
		});

		$( ".portlet" )
			.addClass( "ui-widget ui-widget-content ui-helper-clearfix ui-corner-all" )
			.find( ".portlet-header" )
			.addClass( "ui-widget-header ui-corner-all" )
			.prepend( "<span class='ui-icon ui-icon-minusthick portlet-toggle'></span>");

		$( ".portlet-toggle" ).on( "click", function() {
			var icon = $( this );
			icon.toggleClass( "ui-icon-minusthick ui-icon-plusthick" );
			icon.closest( ".portlet" ).find( ".portlet-content" ).toggle();
		});
	} );

	/*
	function updateCard(no, group, index){
		location.href = "/updateCard?card_no="+no+"&card_group="+group+"&card_index="+index;
	};
	*/
</script>
</body>
</html>