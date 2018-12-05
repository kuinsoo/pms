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
				<p>��ü</p>
			</li>
			<li>
				<i class="icon-star icons"></i>
				<p>���ã��</p>
			</li>
		</ul>
		<ul class="menuList">
			<li>
				<i class="icon-check icons"></i>
				<p>��ü ����</p>
			</li>
			<li><a href="/allSchedule">
					<i class="icon-calendar icons"></i>
					��ü ����</a>
			</li>
			<li>
				<i class="icon-bubbles icons"></i>
				<p>ȸ��</p>
			</li>
			<li>
				<i class="icon-bulb icons"></i>
				<p>�̽� �����丮</p>
			</li>
			<li>
				<i class="icon-list"></i>
				<p>��ǥ</p>
			</li>
		</ul>
		<ul class="boardMenu">
			<li>
				<i class="icon-note icons"></i>
				<p>��������</p>
			</li>
			<li>
				<i class="icon-diamond icons"></i>
				<p>���̵�</p>
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
					<option>��</option>
					<option>������</option>
				</select>
				<input type="text" placeholder="��ü���� �˻�" class="headerSearchInputText" />
				<i class="icon-magnifier icons"></i>
			</div>

			<div class="headerRightContent">
				<!-- ���� �ʴ� -->
				<a href="#projectCreatePopUps" class="projectCreatePopUps">
					<div class="teamInvite">
						<i class="icon-plus icons"></i>
						<p>�����ʴ�</p>
					</div>
				</a>
				<div class="dim-layers">
					<div class="dimBgs"></div>
					<div id="projectCreatePopUps" class="pop-layers">
						<div class="pop-containers">
							<div class="pop-contss">
								<div class="pop-conts-headers">
									<p>���� �ʴ�</p>
									<a href="#" class="btn-layerCloses">
										<i class="icon-close icons"></i>
									</a>
								</div>
								<div class="pop-conts-sections">
									<div class="pop-conts-section-titles">
										<span>�̸����� ���� ������ �ʴ��� �� �ֽ��ϴ�</span>
										<br>
										<input type="email" placeholder="�̸��� �Է�" class="projectTitleInputs" />
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
											<input type="submit" value="�ʴ��ϱ�" class="createProjectSubmits">
											<a href="#" class="btn-layerCloses layerPopupCloses">���</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- �˸� ��� -->
				<div class="alarm dialog__triggers">
					<i class="icon-bell icons"></i>
					<div class="dialogs">
						<div id="tabs">
							<ul>
								<li><a href="#tabs-1">��Ȯ�� �˸�</a></li>
								<li><a href="#tabs-2">��ü �˸�</a></li>
							</ul>
							<div id="tabs-1">
								<i class="icon-bell icons"></i>
								<p>�� ������Ʈ �� �� ���� ��ϵǾ��� ��,<br>Push �޽����� �˷������!</p>
							</div>
							<div id="tabs-2">
								<ul>
									<li>
										<i class="icon-star icons"></i>
										<span>�� ������Ʈ�� ��� �Ǿ����ϴ�!</span>
									</li>
									<li>
										<i class="icon-star icons"></i>
										<span>�ϰ��� �߰� �Ǿ����ϴ�!</span>
									</li>
									<li>
										<i class="icon-star icons"></i>
										<span>������ ��� �Ǿ����ϴ�!</span>
									</li>
									<li>
										<i class="icon-star icons"></i>
										<span>������ �߰� �Ǿ����ϴ�!</span>
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
								<a href="#">����������</a>
							</li>
							<li>
								<i class="icon-power icons"></i>
								<a href="#">�α׾ƿ�</a>
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
				<h1>�������� ������Ʈ</h1>
				<%-- ajax ó�� --%>
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
								${pmember.member_name} �� ${pmember.pmemberCount - 1}
							</div>
						</div>
					</li>
						</c:forEach>
					</c:forEach>
				</ul>
			</div>
			<div class="currentMainProjectCreates">
				<h1>�ʴ���� ������Ʈ</h1>

				<ul>
					<li>
						<a href="#projectCreatePopUp" class="projectCreatePopUp">
							<div class="projectCard">
								<div class="projectCardContent">
									<i class="icon-folder-alt icons"></i>
									<br>
									<p>������Ʈ �����</p>
								</div>
							</div>
						</a>
						<div class="dim-layer">
							<div class="dimBg"></div>
							<div id="projectCreatePopUp" class="pop-layer">
								<div class="pop-container">
									<div class="pop-conts">
										<div class="pop-conts-header">
											<p>������Ʈ �����</p>
											<a href="#" class="btn-layerClose">
												<i class="icon-close icons"></i>
											</a>
										</div>
										<div class="pop-conts-section">
											<div class="pop-conts-section-title">
												<%-- ������Ʈ ���� ���� --%>
												<form action="/createProject" method="post">
													<span>������Ʈ��</span>
													<br>
													<input type="text" name="project_title" placeholder="������Ʈ�� �Է�(�ִ� 50��)" class="projectTitleInput" />
													<br><br>
													<span>������Ʈ ����</span>
													<br>
													<textarea class="projectContentInput" name="project_overview" placeholder="������Ʈ ���� �Է�"></textarea>
													<span>������Ʈ ������</span>
													<br>
													<input type="date" name="project_sdate" />
													<span>������Ʈ ������</span>
													<br>
													<input type="date" name="project_edate" />

													<div class="layerPopUpBtnss">
														<input type="submit" value="�����" class="createProjectSubmit">
														<a href="#" class="btn-layerClose layerPopupClose">���</a>
													</div>
												</form>
												<%-- ������Ʈ ���� �� --%>
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
								���� ������Ʈ ��
								<i class="icon-settings icons"></i>
							</div>
							<div class="projectCardUserName">
								<img src="http://placehold.it/30x30">
								<br>
								user�� ������
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
				���������� �߱� �߾ӷ� 76 ���κ��� 2�� 203ȣ<br>
				�����: (��)������簳�߿�, ����������Ʈ PMS(Project Management System)<br>
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
		var $el = $(el);        //���̾��� id�� $el ������ ����
		var isDim = $el.prev().hasClass('dimBg');   //dimmed ���̾ �����ϱ� ���� boolean ����

		isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();

		var $elWidth = ~~($el.outerWidth()),
			$elHeight = ~~($el.outerHeight()),
			docWidth = $(document).width(),
			docHeight = $(document).height();

		// ȭ���� �߾ӿ� ���̾ ����.
		if ($elHeight < docHeight || $elWidth < docWidth) {
			$el.css({
				marginTop: -$elHeight /2,
				marginLeft: -$elWidth/2
			})
		} else {
			$el.css({top: 0, left: 0});
		}

		$el.find('a.btn-layerClose').click(function(){
			isDim ? $('.dim-layer').fadeOut() : $el.fadeOut(); // �ݱ� ��ư�� Ŭ���ϸ� ���̾ ������.
			return false;
		});

		$('.layer .dimBg').click(function(){
			$('.dim-layer').fadeOut();
			return false;
		});
	}

	// DIM POPUP - �����ʴ�
	$('.projectCreatePopUps').click(function(){
		var $hrefs = $(this).attr('href');
		layer_popups($hrefs);
	});
	function layer_popups(els){
		var $els = $(els);        //���̾��� id�� $el ������ ����
		var isDims = $els.prev().hasClass('dimBgs');   //dimmed ���̾ �����ϱ� ���� boolean ����

		isDims ? $('.dim-layers').fadeIn() : $els.fadeIn();

		var $elWidths = ~~($els.outerWidth()),
			$elHeights = ~~($els.outerHeight()),
			docWidths = $(document).width(),
			docHeights = $(document).height();

		// ȭ���� �߾ӿ� ���̾ ����.
		if ($elHeights < docHeights || $elWidths < docWidths) {
			$els.css({
				marginTop: -$elHeights /2,
				marginLeft: -$elWidths/2
			})
		} else {
			$els.css({top: 0, left: 0});
		}

		$els.find('a.btn-layerCloses').click(function(){
			isDims ? $('.dim-layers').fadeOut() : $els.fadeOut(); // �ݱ� ��ư�� Ŭ���ϸ� ���̾ ������.
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

	// �˶� �� �޴�
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