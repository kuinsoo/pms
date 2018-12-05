<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>MAIN - CURRENT</title>
	<link rel="shortcut icon" type="image/x-icon" href="../images/favicon.png" />
<!-- NANUM SQUARE FONT -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.css">
<link rel="stylesheet" href="../css/swiper.min.css">
<link rel="stylesheet" href="../css/jquery-ui.css">
<link rel="stylesheet" href="../css/main.css">
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
			<li><a href="/allSchedule">
					<i class="icon-calendar icons"></i>
					전체 일정</a>
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
			<div class="currentMainSlide">
				<!-- Swiper -->
				<div class="swiper-container">
					<div class="swiper-wrapper">
						<div class="swiper-slide">
							<img src="../images/slide1.png">
						</div>
						<div class="swiper-slide">
							<img src="http://placehold.it/1400x500">
						</div>
						<div class="swiper-slide">
							<img src="http://placehold.it/1400x500">
						</div>
					</div>

					<!-- Add Pagination -->
					<div class="swiper-pagination"></div>

					<!-- Add Arrows -->
					<div class="swiper-button-next"></div>
					<div class="swiper-button-prev"></div>
				</div>
			</div>
			<div class="currentMainProjectCreate">
				<h1>진행중인 프로젝트</h1>
				<%-- ajax 처리 --%>
				<ul class="bookmarkProject">
					<c:forEach items="${memberProjectList}" var="pmember" varStatus="i">
						<c:forEach items="${pmember.projectList}" var="project" varStatus="j">
					<li class="bookmarkProject">
						<div class="projectCard" >
							<div class="projectCardTitle goSubMain" >
								<c:choose >
									<c:when test="${project.project_bookmark eq 'N'}">
								<i class="icon-star icons" onclick="bookmark('${project.project_id}');"></i>
									</c:when>
									<c:when test="${project.project_bookmark eq 'Y'}">
								<i class="icon-star icons"  style="color:yellow;font-weight:bold;" onclick="bookmark('${project.project_id}');"></i>
									</c:when>
								</c:choose>
								${project.project_title}
								<i class="icon-settings icons"></i>
							</div>
							<div class="projectCardUserName">
								<img src="http://placehold.it/30x30">
								<br>
								${pmember.member_name} 외 ${pmember.pmemberCount - 1}
							</div>
						</div>
					</li>
						</c:forEach>
					</c:forEach>
				</ul>
			</div>
			<div class="currentMainProjectCreates">
				<h1>초대받은 프로젝트</h1>

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
												<%-- 프로젝트 생성 시작 --%>
												<form action="/createProject" method="post">
													<span>프로젝트명</span>
													<br>
													<input type="text" name="project_title" placeholder="프로젝트명 입력(최대 50자)" class="projectTitleInput" />
													<br><br>
													<span>프로젝트 개요</span>
													<br>
													<textarea class="projectContentInput" name="project_overview" placeholder="프로젝트 개요 입력"></textarea>
													<span>프로젝트 시작일</span>
													<br>
													<input type="date" name="project_sdate" />
													<span>프로젝트 마감일</span>
													<br>
													<input type="date" name="project_edate" />

													<div class="layerPopUpBtnss">
														<input type="submit" value="만들기" class="createProjectSubmit">
														<a href="#" class="btn-layerClose layerPopupClose">취소</a>
													</div>
												</form>
												<%-- 프로젝트 생성 끝 --%>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</li>
					<li>
						<div class="projectCard">
							<div class="projectCardTitle">
								<i class="icon-star icons"></i>
								샘플 프로젝트 명
								<i class="icon-settings icons"></i>
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
		/* 	autoplay: {
                delay: 1500,
                disableOnInteraction: false,
            }, */
	});

	// DIM POPUP
	$('.projectCreatePopUp').click(function(){
		var $href = $(this).attr('href');
		layer_popup($href);
	});
	function layer_popup(el){
		var $el = $(el);        //레이어의 id를 $el 변수에 저장
		var isDim = $el.prev().hasClass('dimBg');   //dimmed 레이어를 감지하기 위한 boolean 변수

		isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();

		var $elWidth = ~~($el.outerWidth()),
			$elHeight = ~~($el.outerHeight()),
			docWidth = $(document).width(),
			docHeight = $(document).height();

		// 화면의 중앙에 레이어를 띄운다.
		if ($elHeight < docHeight || $elWidth < docWidth) {
			$el.css({
				marginTop: -$elHeight /2,
				marginLeft: -$elWidth/2
			})
		} else {
			$el.css({top: 0, left: 0});
		}

		$el.find('a.btn-layerClose').click(function(){
			isDim ? $('.dim-layer').fadeOut() : $el.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
			return false;
		});

		$('.layer .dimBg').click(function(){
			$('.dim-layer').fadeOut();
			return false;
		});
	}

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

	// 알람 탭 메뉴
	$("#tabs").tabs();
	
	// book mark 
	function bookmark(project_id) {
		$.ajax({
			type: "POST",
			url: "/projectBookmarkAjax",
			data : {"project_id" : project_id},
			success: function (data) {
				$('.bookmarkProject').html("");
				$('.bookmarkProject').html(data);
			}
		});
	}

	$('.goSubMain').on("click", function () {
		location.href = "main/subMain";
	});
</script>
</body>
</html>