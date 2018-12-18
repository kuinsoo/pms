<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- left & header--%>
<%@ include file="/WEB-INF/views/header.jsp" %>

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
				<ul class="projectCreateULS">
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
													<input type="text"  class="projectTitleInput" name="project_title" placeholder="프로젝트명 입력(최대 50자)" />
													<br><br>
													<span>프로젝트 개요</span>
													<br>
													<textarea class="projectContentInput" name="project_overview" placeholder="프로젝트 개요 입력"></textarea>

													<div class="projectStartEndDiv">
														<span class="projectStart">프로젝트 시작일</span>
														<input type="date" name="project_sdate" class="projectStartInput" />
														<span class="projectEnd">프로젝트 마감일</span>
														<input type="date" name="project_edate" class="projectEndInput" />
													</div>

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
				</ul>

				<ul class="bookmarkProject">
                    <%-- 프로젝트 처리 --%>
					<c:forEach items="${pMemberList}" var="pMemberListVo" varStatus="i">
					<li class="bookmarkProject">
						<div class="projectCard" >
							<div class="projectCardTitle" >
								<c:choose >
									<c:when test="${pMemberListVo.pmember_bookmark eq 'N'}">
								<i class="icon-star icons" onclick="bookmark('${pMemberListVo.project_id}');"></i>
									</c:when>
									<c:when test="${pMemberListVo.pmember_bookmark eq 'Y'}">
								<i class="icon-star icons"  style="color:yellow;font-weight:bold;" onclick="bookmark('${pMemberListVo.project_id}');"></i>
									</c:when>
								</c:choose>
                                <a href="/subMain?project_id=${pMemberListVo.project_id}&project_title=${pMemberListVo.project_title}" class="ajaxProjectTitle"> ${pMemberListVo.project_title}</a>
								<c:if test="${pMemberListVo.pmember_position eq '1'}">
								<a href="#open" class="settingsA"><i class="icon-settings icons"></i></a>
								<div class="white_content" id="open">
									<div>
										<a href="#close" class="mainCloseBtns">
											<i class="icon-close icons"></i>
										</a>
										<div class="btnField">
											<h2>프로젝트 명 - <span>${pMemberListVo.project_title}</span></h2>
											<input type="button" value="수정" class="projectUpdateSettings" />
											<input type="button" value="삭제" class="projectDeleteSettings" />
										</div>
									</div>
							    </div>
                                </c:if>
							</div>
							<div class="projectUpdatePopUp"></div>
							<div class="projectCardUserName">
								<img src="${pMemberListVo.member_profile}">
								<br>
								${pMemberListVo.member_name} 외 ${pMemberListVo.pmemberCount - 1}명
							</div>
						</div>
					</li>
					</c:forEach> <%-- book end --%>
				</ul>
			</div>
			<div class="currentMainProjectCreates">
				<h1>초대받은 프로젝트</h1>
				<ul class="inviteProject">
					<c:forEach items="${inviteProjectList}" var="inviteProject">
					<li>
						<div class="projectCard">
							<div class="projectCardTitle">
								<a href="javascript:popUp(500, 500, '${inviteProject.project_id }');">${inviteProject.project_title}</a>
							</div>
							<div class="projectCardUserName">
								<img src="${memberVo.member_profile}">
								<br>
								${inviteProject.member_name}님 참여중
							</div>
						</div>
					</li>
					</c:forEach>
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
			type: "GET",
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

var openWin;
function popUp(w, h, project_id){
	x = (screen.availWidth - w) / 2;
	y = (screen.availHeight - h) / 2;
	openWin = window.open('/inviteProject?project_id='+project_id, '초대받은 프로젝트','width='+w+', height='+h+', left='+x+', top='+y, 'location=no, directories=no, resizable=no, status=no, toolbar=no, menubar=no');
}

function invitePrject(accept, project_id){
	$.ajax({
		type: "GET",
		url:"/inviteProjectAjax",
		data : {'accept':accept, 'project_id':project_id},
		success: function(data) {
			$('.inviteProject').html("");
			$('.inviteProject').html(data);
			bookmark(project_id);
		}
	});
}
</script>
</body>
</html>