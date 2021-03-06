<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- CURRENT SECTION(MAIN) -->
<section class="currentMain">
	<div class="currentMainContainer">
		<div class="myPageContainerTitle" style="background-color:transparent;border:none;">
			<div class="myPageContainerTitleHTwo" style="width:1330px;height:60px;background-color:#fff;border:1px solid #dee3eb;float:left;">
				<h2>업무수행능력</h2>
			</div>
			<div class="backBtnDivZz" style="float:left;width:60px;height:60px;background-color:#fff;border:1px solid #dee3eb;line-height:60px;font-size:20px;margin-left:10px;cursor:pointer;">
				<i class="icon-arrow-left icons" id="locationBack_eva"></i>
			</div>
		</div>
		
		<div class="myPageContainer">
			<div class="myPageContainerLeft">
				<div class="myPageContainerLeftUseraa">
					<h2>${memberVo.member_name}님의 프로필</h2>
					<div class="profileImg">
						<div id="imgs">
							<div class="scale"><img src="${memberVo.member_profile}"/></div>
						</div>
					</div>
					<div class="userContentsInfoLeft_1">
						<ul id="test">
							<li class="marginPaddingUi">사용자 이메일</li>
							<li><input type="text" value= "${memberVo.member_mail}" readonly /></li>
							<li class="marginPaddingUi">사용자 이름 </li>
							<li><input type="text" value= "${memberVo.member_name}" readonly /></li>
							<li class="marginPaddingUi">휴대폰 번호</li>
							<li><input type="text"  value= "${memberVo.member_tel}" readonly /></li>
						</ul>
					</div>
				</div>
				<div class="evaluationContainerRightUser">
					<div class="evaluationInfoRight_1">
						<ul>
							<li>프로젝트 참여 수 : ${evalProjectList.size()}</li>
							<li>총 업무 수 : ${evalChart.workCnt}</li>
							<li>총 일감 수 : ${evalChart.todoCnt}</li>
							<li>처리한 일감 수 : ${evalChart.myTodoCnt}</li>

						</ul>
					</div>
				</div>
			</div>

			<div class="myPageContainerRight">
				<%-- 차트 --%>
				<div class="myPageContainerRightLeftChart evaluationChart1">
					<div id="evalChartA">
						<%-- chart1 --%>
					</div>
					<span>프로젝트</span>
					<select id="evalProjectList" class="myChartSelect1" onchange="changeSelectEval('${memberVo.member_mail}');" >
						<c:forEach items="${evalProjectList}" var="evalProject">
							<option value="${evalProject.project_id}">${evalProject.project_title}</option>
						</c:forEach>
					</select>
				</div>
				<div class="myPageContainerRightRightChart evaluationChart2">
					<div id="evalChartB">
						<%-- chart2 --%>
					</div>
					<input type="text" class="myChartSelect2" value="이슈 처리 능력" readonly />
				</div>
			</div>
		</div>
		<div class="myPageBottomContainer abilityContainer">
			<div id="evalDetail">
				<%@ include file="ajaxEvaluation.jsp"%>
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

<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.2/js/swiper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.js"></script>
<script type="text/javascript" src="js/classie.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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



	$(function(){
		$("#accordion").accordion();
	});

	/* ajaxEvaluation.jsp */
	function changeSelectEval(userMail) {
		var project_id = $('#evalProjectList').val();

		$.ajax({
			type: "post",
			url: "/ajaxEvaluationChartA",
			//data: JSON.stringify(data),
			data: "project_id=" + project_id + "&userMail="+userMail,
			success: function (dt) {
				$('#evalChartA').html("");
				$('#evalChartA').html(dt);
			}
		});

		$.ajax({
			type: "post",
			url: "/ajaxEvaluationChartB",
			//data: JSON.stringify(data),
			data: "project_id=" + project_id+ "&userMail="+userMail,
			success: function (dt) {
				$('#evalChartB').html("");
				$('#evalChartB').html(dt);
			}
		});
		$.ajax({
			type: "GET",
			url : "/ajaxEvaluation",
			data: "project_id=" + project_id+ "&userMail="+userMail,
			success : function (data) {
				$('#evalDetail').html("");
				$('#evalDetail').html(data);
			},
			error : function (data) {
				alert("error Eval")

			}
		});

		$.ajax({
			type: "GET",
			url : "/ajaxTable",
			data: "project_id=" + project_id+ "&userMail="+userMail,
			success : function (data) {
				$('.evaluationInfoRight_1').html("");
				$('.evaluationInfoRight_1').html(data);
			},
			error : function (data) {
				alert("error Eval")

			}
		});
	};

	$(document).ready(function () {
		changeSelectEval('${memberVo.member_mail}');
	});


	$('#locationBack_eva').on("click", function () {
		location.href = "/main"
    });
</script>
</body>
</html>