<%--
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
    <title>MAIN - CURRENT</title>
    <link rel="shortcut icon" type="image/x-icon" href="/images/favicon.png" />
    <!-- NANUM SQUARE FONT -->
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.css">
    <link rel="stylesheet" href="/css/swiper.min.css">
    <link rel="stylesheet" href="/css/jquery-ui.css">
    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" type="text/css" href="/css/submain.css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>

<body class="cbp-spmenu-push">
<nav class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-left" id="cbp-spmenu-s1">
    <div class="currentMainLeftMenu">
        <div class="leftMenuUserInterface">
            <div class="dimLeftMenuUserInterface"></div>
            <img src="http://placehold.it/100x100">
            <p>${memberVo.member_name}</p>
        </div>
        <ul class="firstMenu">
            <li>
                <i class="icon-grid icons"></i>
                <p><a href="/main">전체</a></p>
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
                <p><a href="/allSchedule">전체 일정</a></p>
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
            <div class="currentLogo" id="currentMain">
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
                                        <form action="/inviteTeam" method="POST" id="inviteForm">
                                        <span>이메일을 통해 팀원을 초대할 수 있습니다</span>
                                        <br>
                                        <input type="email" name="inviteTeam" placeholder="이메일 입력" class="projectTitleInputs" />
                                        <br>
                                        <input type="email" name="inviteTeam" placeholder="example@gmail.com" class="projectTitleInputs" />
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
                            <p>${memberVo.member_name}</p>
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

    <script>
		$('#currentMain').on('click', function () {
			location.href="/main";
		});
    </script>