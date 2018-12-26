<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- CURRENT SECTION(MAIN) -->
<section class="currentMain">
	<div class="currentMainContainer">
		<div class="myPageContainer">
			<div class="myPageContainerTitle">
				<h2>업무수행능력</h2>
			</div>

			<form action="#" method="post" enctype="multipart/form-data">
				<div class="myPageContainerLeft">
					<div class="myPageContainerLeftUser">
						<h2>${memberVo.member_name}님의 프로필</h2>
						<div class="profileImg">
							<div id="imgs">
								<div class="scale"><img src="${memberVo.member_profile}"/></div>
							</div>
							<div class="myPageContainerRightUser">
								<div class="userContentsInfoRight_1">
									<ul id="test">
										<li>사용자 이메일</li>
										<li><input type="text" value= "${memberVo.member_mail}" readonly /></li>
										<li>사용자 이름 </li>
										<li><input type="text" value= "${memberVo.member_name}" readonly /></li>
										<li>휴대폰 번호</li>
										<li><input type="text"  value= "${memberVo.member_tel}" readonly /></li>
									</ul>
								</div>
								<%--<div class="userContentsInfoRight_2">--%>
									<%--<ul>--%>
										<%--<li> 극혐나진실</li>--%>
									<%--</ul>--%>
								<%--</div>--%>
							</div>
						</div>
					</div>

				</div>
			</form>
			<div class="myPageContainerRight">
				<div class="myPageContainerRightLeftChart evaluationChart1">
					<canvas id="myChart" width="349" height="450"></canvas>
					<select id="evalProjectList" class="myChartSelect1" >
						<c:forEach items="${evalProjectList}" var="evalProject">
							<option value="${evalProject.project_id}">${evalProject.project_title}</option>
						</c:forEach>
					</select>
				</div>
				<div class="myPageContainerRightRightChart evaluationChart2">
					<canvas id="myChart2" width="349" height="450"></canvas>
					<input type="text" class="myChartSelect2" value="이슈 처리 능력" readonly />
				</div>
			</div>
			<div class="myPageBottomContainer abilityContainer">
				<div  id="evalDetail" >
					<%-- evalDetail ajaxEvaluation.jsp --%>
				</div>
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
	/*document ready*/
	$(document).ready(function () {
		// ajaxEvaluation();
	});

	/* ajaxEvaluation.jsp */
	$('#evalProjectList').on('change', function () {
		var project_id = $('#evalProjectList').val();
		$.ajax({
			type: "GET",
			url : "/ajaxEvaluation",
			data : {"project_id": project_id},
			success : function (data) {
				$('#evalDetail').html("");
				$('#evalDetail').html(data);
			},
			error : function (data) {
				alert("error Eval")

			}
		});
	});


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

	var ctx = document.getElementById("myChart").getContext('2d');
	var myChart = new Chart(ctx, {
		type: 'pie',
		data: {
			labels: ["이슈" , "업무" , "참여자"],
			datasets: [{
				label: '${memberVo.member_name} 님의 CURRENT',
				data: [
					<c:forEach items="${evalChart}" var="eChart">
						<c:if test="${eChart.project_id eq '8'}">
							'${eChart.issueCnt}', '${eChart.workCnt}' , '${eChart.memberCnt}'
						</c:if>
					</c:forEach>
				],
				backgroundColor: [
					'rgba(255, 99, 132, 0.2)',
					'rgba(54, 162, 235, 0.2)',
					'rgba(255, 206, 86, 0.2)'
				],
				borderColor: [
					'rgba(255,99,132,1)',
					'rgba(54, 162, 235, 1)',
					'rgba(255, 206, 86, 1)'
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

	var ctx2 = document.getElementById("myChart2").getContext('2d');
	var myChart2 = new Chart(ctx2, {
		type: 'line',
		data: {
			labels:
			[
				'','업무', '이슈',''
			],
			datasets: [{

				label: '${memberVo.member_name} 님의 CURRENT',
				data: [0,
					<c:forEach items="${evalChart}" var="eChart">
						<c:if test="${eChart.project_id eq '8' }">
							'${eChart.workCnt}', '${eChart.issueCnt}'
						</c:if>
					</c:forEach>, 0
				],
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

	$(function(){
		$("#accordion").accordion();
	});
</script>
</body>
</html>