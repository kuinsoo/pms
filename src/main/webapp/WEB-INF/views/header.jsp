<%@ page import="kr.or.ddit.member.model.MemberVo" %><%--
  Created by IntelliJ IDEA.
  User: Mr.KKu
  Date: 2018-12-06
  Time: 오전 9:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CURRENT</title>
    <link rel="shortcut icon" type="image/x-icon" href="/images/favicon.png" />
    <!-- NANUM SQUARE FONT -->
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/swiper.min.css">
    <link rel="stylesheet" href="/css/jquery-ui.css">
    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="/css/myPage.css">
    <link rel="stylesheet" type="text/css" href="/css/submain.css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="https://code.highcharts.com/gantt/highcharts-gantt.js"></script>

</head>

<body class="cbp-spmenu-push">
<nav class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-left" id="cbp-spmenu-s1">
    <div class="currentMainLeftMenu">
        <div class="leftMenuUserInterface" id="myPageLocation">
            <div class="dimLeftMenuUserInterface"></div>
            <img src="${memberVo.member_profile}">
            <p>${memberVo.member_name}</p>
        </div>
        <ul class="firstMenu">
            <li>
                <i class="icon-grid icons"></i>
                <p><a href="/main">전체</a></p>
            </li>
            <li>
                <i class="icon-star icons"></i>
                <p><a href="/favorites">즐겨찾기</a></p>
            </li>
        </ul>
        <ul class="menuList">
            <li>
                <i class="icon-settings icons"></i>
                <p><a href="/myPage">마이 페이지</a></p>
            </li>
            <li>
                <i class="icon-calendar icons"></i>
                <p><a href="/allSchedule">전체 일정</a></p>
            </li>
            <c:if test="${projectVo.project_id >= 0 }" >
            <li>
                <i class="icon-bulb icons"></i>
                <p><a href="/issueHistory">이슈 히스토리</a></p>
            </li>
            <li>
                <i class="icon-list"></i>
                <p><a href="/vote">투표</a></p>
            </li>
            </c:if>
        </ul>
        <ul class="boardMenu">
            <li>
                <i class="icon-note icons"></i>
                <p><a href="/notice">공지사항</a></p>
            </li>
            <li>
                <i class="icon-diamond icons"></i>
                <p><a href="/guide">가이드</a></p>
            </li>
            <li>
                <i class="icon-question icons"></i>
                <p><a href="/qnaList">Q & A</a></p>
            </li>
        </ul>
        <ul class="sayGoodBye">
        	<li>
        		<i class="icon-power icons"></i>
                <p onclick="logout();">로그아웃</p>
        	</li>
        </ul>
    </div>
</nav>

<div id="wrap">
    <div id = "Progress_Loading"><!-- 로딩바 -->
        <img src="/images/Progress_Loading.gif"/>
    </div>
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
            <div class="currentLogo" id="currentMain">
                <img src="https://placehold.it/200x45">
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
            	<c:if test="${projectVo.project_id >= 0 }">
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
                                        <form action="/inviteTeam?project_id=${projectVo.project_id}" method="POST" id="inviteForm">
                                        <span>이메일을 통해 팀원을 초대할 수 있습니다</span>
                                        <br>
                                        <input type="email" name="inviteTeam" value="" placeholder="이메일 입력" class="projectTitleInputs" />
                                        <br>
                                        <input type="email" name="inviteTeam" value="" placeholder="example@gmail.com" class="projectTitleInputs" />
                                        <br>
                                        <input type="email" name="inviteTeam" placeholder="example@gmail.com" class="projectTitleInputs" />
                                        <br>
                                        <input type="email" name="inviteTeam" placeholder="example@gmail.com" class="projectTitleInputs" />
                                        <br>
                                        <input type="email" name="inviteTeam" placeholder="example@gmail.com" class="projectTitleInputs" />
                                        <br>
                                        <div class="layerPopUpBtnsss">
                                            <input type="submit" value="초대하기" class="createProjectSubmits">
                                            <a href="#" class="btn-layerCloses layerPopupCloses">취소</a>
                                        </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
			</c:if>
                
				<div class="updateHeader" style="float:right;">
						<a href="/friendView"  class="facing">
							<i class="icon-user icons" id="friendSendIcon"></i>
							<div class="friendCounterDiv">
								<span class = "friendCounterSpan"></span>
							</div>
						</a>
						<a href="/message" class="facing">
							<i class="icon-paper-plane icons" id="messageSendIcon"></i>
							<div class="messageCounterDiv">
								<span class = "messageCounterSpan"></span>
							</div>
						</a>
					
	                <%@ include file="/WEB-INF/views/alarm/alarm.jsp" %>
	                
	                <!-- CURRENT USER -->
	                <div class="currentUser dialog__trigger">
	                    <img src="${memberVo.member_profile}" />
	                    <i class="icon-arrow-down icons"></i>
	                    <div class="dialog">
	                        <div class="dialogUserImg">
	                            <img src="${memberVo.member_profile}">
	                            <p>${memberVo.member_name}</p>
	                        </div>
	                        <ul>
	                            <li>
	                                <i class="icon-settings icons"></i>
	                                <a href="/myPage">마이페이지</a>
	                            </li>
	                            <li>
	                                <i class="icon-badge icons"></i>
	                                <a href="/evaluation">능력 및 평가</a>
	                            </li>
	                            <li>
	                                <i class="icon-power icons"></i>
	                                <label onclick="logout();">로그아웃</label>
	                            </li>
	                        </ul>
	                    </div>
	                </div>
                </div>
            </div>
        </div>
    </header>
	<script>
	// 폴링방법 
	$(document).ready(function(){
		$('#Progress_Loading').hide(); //첫 시작시 로딩바를 숨겨준다.

		message();
		friend();
	});
	
	function message(){
		(function pollsmessage(){
			$.ajax({
				type: "GET",
				url : "/messageAlram",
				data : "member_mail="+ '${memberVo.member_mail}',
				success: function(data){
				console.log(data.totalmessageY);
				// 쪽지온거확인
				 	if(data.totalmessageY > 0){
				 		$(".messageCounterDiv").show();
						$(".messageCounterSpan").html(data.totalmessageY);
						$("#messageSendIcon").css("color","#f00");
				 	}else{
				 		$("#messageSendIcon").css("color","#000");
						$(".messageCounterDiv").hide();
				 	}
				}, 
			timeout: 3000,
	    	complete: setTimeout(function(){ pollsmessage(); }, 6000)
			})
		})();	 
	}
	 function friend(){
		(function pollsfriend(){
			$.ajax({
				type: "GET",
				url : "/friendAlram",
				data : "member_mail="+ '${memberVo.member_mail}',
				success: function(data){
				console.log(data.totalFriendSize);
				// 쪽지온거확인
				 	if(data.totalFriendSize > 0){
				 		$(".friendCounterDiv").show();
						$(".friendCounterSpan").html(data.totalFriendSize);
						$("#friendSendIcon").css("color","#f00");
				 	}else{
				 		$("#friendSendIcon").css("color","#000");
						$(".friendCounterDiv").hide();
				 	}
				}, 
			timeout: 3000,
	    	complete: setTimeout(function(){ pollsfriend(); }, 6000)
			})
		})();	 
	}
	</script>
    <script>
		$('#currentMain').on('click', function () {
			location.href="/main";
		});
		
		function logout(){
			if(window.confirm("로그아웃 하시겠습니까?")) {
				location.href="/logout";
			}
		}
    </script>

    <script type="text/javascript">
		$('#myPageLocation').on('click', function () {
			location.href="/myPage";
		});
    </script>

   <!--  <script type="text/javascript">
	
       /* .ajaxStart(function(){
            $('#Progress_Loading').show(); //ajax실행시 로딩바를 보여준다.
        })
        .ajaxStop(function(){
            $('#Progress_Loading').hide(); //ajax종료시 로딩바를 숨겨준다.
        });*/ 
    </script>-->

