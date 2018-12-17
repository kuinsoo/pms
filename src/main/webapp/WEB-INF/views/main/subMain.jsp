<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- header & left --%>
<%@ include file="/WEB-INF/views/header.jsp" %>
	<%--CURRENT SECTION(MAIN)--%>
	<section class="currentMain">
		<div class="currentMainContainer">
			<div class="currentMainContainerLeft">
				<div class="projectList">
					<div class="projectListTitles">
						<i class="far fa-newspaper"></i>
						<span>업무 리포트 보기</span>
					</div>
					<div class="charts">
						<div class="chartsContent">
							<canvas id="myChart" width="860" height="400"></canvas>
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
						<i class="far fa-sticky-note"></i><span>WORK CARD</span>
					</div>
				</div>
				<div class="projectTaskContainerDragDrop">
					<div class="projectTaskDragDrop">

						<%@include file="/WEB-INF/views/card/cardChart.jsp"%>
						<%--<div class="kku-boarder kku-mainPage" id="planList">
							<div class="column">
								<div class="portlet">
				                    <div class="portlet-header">TITLE</div>
				                    <div class="portlet-content">
				                    	CONTENT CONTENT CONTENT CONTENT
				                    </div>
				                    <label class="kku-hide kku-no">1</label>
				                    <label class="kku-hide kku-group">1</label>
				                    <label class="kku-hide kku-index">1</label>
				                </div>
				                <div class="portlet">
				                    <div class="portlet-header">TITLE</div>
				                    <div class="portlet-content">
				                    	CONTENT CONTENT CONTENT CONTENT
				                    </div>
				                    <label class="kku-hide kku-no">1</label>
				                    <label class="kku-hide kku-group">1</label>
				                    <label class="kku-hide kku-index">1</label>
				                </div>
				                <div class="portlet">
				                    <div class="portlet-header">TITLE</div>
				                    <div class="portlet-content">
				                    	CONTENT CONTENT CONTENT CONTENT
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
						</div>--%>
					</div>
				</div>
				<div class="projectWriter">
					<div id="tabss">
						<ul>
							<li><a href="#tabss-1">업무</a></li>
							<li><a href="#tabss-2">글</a></li>
							<li><a href="#tabss-3">일정</a></li>
							<li><a href="#tabss-4">할일</a></li>
						</ul>
						<!-- tap1 업무 -->
						<div id="tabss-1">
							<form action="/ajaxCreateWork" method="POST" name="workfrm1">
								<div class="workContainerInput">
									<input type="text" name="work_title" placeholder="업무제목을 입력해주세요" class="workTitle" />
									
									<div class="workDateDiv">
										<!-- 업무 시작일 -->
										<i class="icon-clock icons"></i>
										<input type="datetime-local" name="work_sdate" class="work_sdate">
										
										<!-- 업무 마감 예상일 -->
										<i class="icon-clock icons"></i>
										<input type="datetime-local" name="work_eedate" class="work_eedate">
									</div>
									<textarea class="workTextarea" name="work_content" placeholder="업무내용을 입력해주세요"></textarea>
									
									<div class="workTypeDiv">
										<h3>업무유형</h3>
										<input type="radio" name="work_type" value="1" class="workType1" /><span>설계</span>
										<input type="radio" name="work_type" value="2" class="workType2" /><span>개발</span>
										<input type="radio" name="work_type" value="3" class="workType3" /><span>유지보수</span>
									</div>
									<div class="workImportance">
										<h3>업무 중요도</h3>
										<select name="work_importance">
											<option value="1">Level 1</option>
											<option value="2">Level 2</option>
											<option value="3">Level 3</option>
											<option value="4">Level 4</option>
											<option value="5">Level 5</option>
										</select>
									</div>
									<input type="hidden" name="project_id" value="${projectVo.project_id}" />
									<div class="workVisibility">
										<h3>업무 공개여부</h3>
										<input type="checkbox" name="work_public" value="Y" class="workVisibilityCheck" />
										<span>WORK_PUBLIC</span>
									</div>
									<div class="workSubmit">
										<input type="button" class="tabssTextAreaSubmit" value="올리기" onclick="createWork();" />
									</div>
								</div>
							</form>
						</div>
						<%--tap1 끝 --%>
						<div id="tabss-2">
							<textarea class="tabssTextArea" placeholder="글을 작성하세요"></textarea>
							<input type="submit" class="tabssTextAreaSubmit" value="올리기" />
						</div>
						<div id="tabss-3">
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
						<div id="tabss-4">
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
							<input type="button" class="tabssTextAreaSubmit" value="올리기" />
						</div>
					</div>
				</div>
				
				
				
				
				<%-- ############################## 일정 카드 시작 ############################## --%>
				<div class="mapCardList">
					<div class="mapCardListTitle">
						<h2><i class="icon-map icons"></i>일정제목</h2>
					</div>
					<div class="cardUserInfo">
						<div class="cardUserInfoImg">
							<img src="http://placehold.it/40x40">
						</div>
						<div class="cardUserInfoName">
							<b>홍길동</b><br> <%-- 작성자 --%>
							<span>2018-12-17</span>
						</div>
						<div class="updateDeleteIcon">
							<i class="icon-wrench icons"></i>
							<a href="#opens"><i class="icon-bulb icons"></i></a>
						</div>
					</div>
					<div class="currentCardContentView">
						<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=nPljd7ns8PGll8DWsmSl"></script>
						<div id="map" style="width:100%;height:300px;"></div>
						<script>
						var map = new naver.maps.Map("map", {
						    center: new naver.maps.LatLng(37.3595316, 127.1052133),
						    zoom: 10,
						    mapTypeControl: true
						});
						
						var infoWindow = new naver.maps.InfoWindow({
						    anchorSkew: true
						});
						
						map.setCursor('pointer');
						
						// search by tm128 coordinate
						function searchCoordinateToAddress(latlng) {
						    var tm128 = naver.maps.TransCoord.fromLatLngToTM128(latlng);
						
						    infoWindow.close();
						
						    naver.maps.Service.reverseGeocode({
						        location: tm128,
						        coordType: naver.maps.Service.CoordType.TM128
						    }, function(status, response) {
						        if (status === naver.maps.Service.Status.ERROR) {
						            return alert('Something Wrong!');
						        }
						
						        var items = response.result.items,
						            htmlAddresses = [];
						
						        for (var i=0, ii=items.length, item, addrType; i<ii; i++) {
						            item = items[i];
						            addrType = item.isRoadAddress ? '[도로명 주소]' : '[지번 주소]';
						
						            htmlAddresses.push((i+1) +'. '+ addrType +' '+ item.address);
						        }
						
						        infoWindow.setContent([
						                '<div style="padding:10px;min-width:200px;line-height:150%;">',
						                '<h4 style="margin-top:5px;">검색 좌표</h4><br />',
						                htmlAddresses.join('<br />'),
						                '</div>'
						            ].join('\n'));
						
						        infoWindow.open(map, latlng);
						    });
						}
						
						// result by latlng coordinate
						function searchAddressToCoordinate(address) {
						    naver.maps.Service.geocode({
						        address: address
						    }, function(status, response) {
						        if (status === naver.maps.Service.Status.ERROR) {
						            return alert('Something Wrong!');
						        }
						
						        var item = response.result.items[0],
						            addrType = item.isRoadAddress ? '[도로명 주소]' : '[지번 주소]',
						            point = new naver.maps.Point(item.point.x, item.point.y);
						
						        infoWindow.setContent([
						                '<div style="padding:10px;min-width:200px;line-height:150%;">',
						                '<h4 style="margin-top:5px;">검색 주소 : '+ response.result.userquery +'</h4><br />',
						                addrType +' '+ item.address +'<br />',
						                '</div>'
						            ].join('\n'));
						
						
						        map.setCenter(point);
						        infoWindow.open(map, point);
						    });
						}
						
						function initGeocoder() {
						    map.addListener('click', function(e) {
						        searchCoordinateToAddress(e.coord);
						    });
						
						    $('#address').on('keydown', function(e) {
						        var keyCode = e.which;
						
						        if (keyCode === 13) { // Enter Key
						            searchAddressToCoordinate($('#address').val());
						        }
						    });
						
						    $('#submit').on('click', function(e) {
						        e.preventDefault();
						
						        searchAddressToCoordinate($('#address').val());
						    });
						
						    searchAddressToCoordinate('정자동 178-1');
						}
						
						naver.maps.onJSContentLoaded = initGeocoder;
						</script>
					</div>
				</div>
				<%-- ############################## 일정 카드 끝 ############################## --%>
				
				
				
				
				<%--카드리스트--%>
				<div id="submain_work">
				<c:forEach items="${workList}" var="work" varStatus="i">
				<div class="currentCardList" >
					<h2><i class="icon-speech icons"></i>${work.work_title}</h2>
					<div class="cardUserInfo">
						<div class="cardUserInfoImg">
							<img src="${work.member_profile}">
						</div>
						<div class="cardUserInfoName">
							<b>${work.member_mail}</b><br> <%-- 작성자 --%>
							<span>${work.work_wdate}</span>
						</div>
						<div class="updateDeleteIcon">
							<i class="icon-wrench icons"></i>							
							<a href="#opens"><i class="icon-bulb icons"></i></a>
							<div class="white_contents" id="opens">
								<div>
 									<a href="#close"><i class="icon-close icons"></i></a>
									<div class="issueCreateInputField">
										<div class="issueCreateInputFieldLeft">
											<ul>
												<li>담당자</li>
												<li>할일내용</li>
												<li>시작일자</li>
												<li>마감일자</li>
											</ul>
										</div>
										<div class="issueCreateInputFieldRight">
											<form method="POST" name="todoInsert" id="todoInsert">
												<ul>
													<li><input type="text" name="todo_pmember" placeholder="담당자를 입력하세요."/></li>
													<li><textarea name="todo_content" placeholder="내용을 입력하세요."></textarea></li>
													<li><input type="datetime-local" name="non_todo_sdate" id="non_todo_sdate" value=""/></li>
													<li><input type="hidden" name="todo_sdate" id="todo_sdate" value=""/></li>
													<li><input type="datetime-local" name="non_todo_eedate"></li>
													<li><input type="hidden" name="todo_eedate" id="todo_eedate" value=""/></li>
													<li><input type="hidden" name="project_id" value="${projectVo.project_id}"/></li>
													<li><input type="hidden" name="todo_work" value="${work.work_id}"/></li>
												</ul>
											</form>
										</div>
									</div>
									<input type="button" value="등록" class="issueInfoCreate" onClick="insertTodo();"/>
									<a href="#close" class="issueInfoClose">취소</a>
								</div>
						    </div>
						</div>
					</div>
					<div class="currentCardContentView">
						<div class="currentCardContentViewLeft">
							<textarea readonly>${work.work_content}</textarea>
						</div>
						<div class="currentCardContentViewRight">
							<!-- todoInsertAjax.jsp -->
							<div class="pagination">
								<ul>
									<li><i class="icon-arrow-left icons"></i></li>
									<li><span>1</span></li>
									<li><span>2</span></li>
									<li><span>3</span></li>
									<li><span>4</span></li>
									<li><span>5</span></li>
									<li><i class="icon-arrow-right icons"></i></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="currentCardContentBottomView">
						<div id="container${work.work_id}"></div>
						<%@ include file="/WEB-INF/views/work/testChart.jsp" %>						
					</div>

						<!-- 댓글  -->
						<div class="cardContentComment">
							<ul>
								<li>
									<div class="cardContentCommentUser">
										<div class="cardContentCommentUserImg">
											<img src="${memberVo.member_profile}">
										</div>
										<div class="cardContentCommentUserName">
											<input type="text" class="commentInput" id="cmt_content${i.index}" placeholder="댓글을 입력해주세요" required>
											<i class="icon-bubble icons" onclick="insertCmt('${work.work_id}', 'cmt_content${i.index}');"></i>
										</div>
									</div>
								</li>
							</ul>
							<c:forEach items="${cmtList}" var="cmt">
								<c:if test="${cmt.cmt_work eq  work.work_id}">
									<ul>
										<li>
											<div class="cardContentCommentUser">
												<div class="cardContentCommentUserImg">
													<img src="${cmt.member_profile}">
												</div>
												<div class="cardContentCommentUserName">
													<b>${cmt.member_name}</b><span class="times">${cmt.cmt_date}</span>
													<input type="button" value="수정" class="commentUpdateBtn" />
													<input type="button" value="삭제" class="commentDeleteBtn" />
													<br>
													<span>${cmt.cmt_content}</span>
												</div>
											</div>
										</li>
									</ul>
								</c:if>
							</c:forEach>
						</div>
					</div> <%-- 끝--%>
					</c:forEach>
				</div> <%-- submainwork --%>
			</div> <%-- MainController --%>

			<div class="currentMainContainerRight">
				<div class="currentSubMainTitle">
					<i class="icon-star icons"></i>
					<span>${projectVo.project_title}</span>
					<!--
					<i class="icon-share icons dialog__triggerss"></i>
					<div class="dialogss">
						<ul>
							<li>프로젝트 설정</li>
							<li>알림(푸쉬) 설정</li>
							<li>프로젝트 숨기기</li>
						</ul>
					</div>
					-->
				</div>
				<div class="projectTeamsTop">
					<!-- (변찬우) for node // 외부에서 접근해서 인증 허용 해줘야 함..  -->
					<iframe src="https://192.168.203.24:8443/" width="100%" height="100%"></iframe>
				</div>
				<div class="projectTeams">
					<h2>전체 참여자 ${projectMemberList.size()}명 <i class="icon-plus icons"></i></h2>
					<ul>
						<c:forEach items="${projectMemberList}" var="projectMember" varStatus="i" >
						<c:if test="${projectMember.pmember_position eq '1'}">
						<li>
							<span class="projectPositionName">프로젝트 관리자</span>
							<div class="chatList">
								<img src="${projectMember.member_profile}">
								<span class="projectUserNameList">${projectMember.member_name}</span>
							</div>
						</li>
						</c:if>
						<c:if test="${projectMember.pmember_position eq '2'}">
						<li>
							<span class="projectPositionName">참여자</span>
							<div class="chatList">
								<img src="${projectMember.member_profile}">
								<span class="projectUserNameList">${projectMember.member_name}</span>
							</div>
						</li>
						</c:if>
						</c:forEach>
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

	<%--
	function updateCard(no, group, index){
		location.href = "/updateCard?card_no="+no+"&card_group="+group+"&card_index="+index;
	}; --%>



	function createWork(){
		var param = $('form[name=workfrm1]').serialize();
		$.ajax({
			method: "POST",
			url : "/ajaxCreateWork",
			data : param,
			success: function(data) {
				$('#submain_work').html("");
				$('#submain_work').html(data);
			},
			error:function (data) {
				alert("error")
			}
		});
	}

	function insertCmt(work_id, cmt_content) {
		var cmt_contenta = $('#'+cmt_content).val();
		$.ajax({
			method: "GET",
			url: "/ajaxInsertCmt",
			data: {"work_id": work_id, "cmt_content": cmt_contenta, "project_id": ${projectVo.project_id}},
			success : function (data) {
				$('#submain_work').html("");
				$('#submain_work').html(data);
			},
			error:function (data) {
				alert("error")
			}
		});
	}
	
	//할일등록의 등록버튼에 마우스올리면 커서 변경 ==문의: jerry==
	$(".issueInfoCreate").mouseover(function(){
		$(this).css("cursor", "pointer");
	});
	
	//to-di list 등록 ==문의: jerry==
	function insertTodo(){
		var sdate = $('input[name=non_todo_sdate]').val(); //UTC형식 Date를 sdate에 담는다.
		var eedate = $('input[name=non_todo_eedate]').val(); //UTC형식 Date를 eedate에 담는다.
		var repSdate = sdate.replace("T", " "); //Parsing('T' 제거)
		var repEedate = eedate.replace("T", " "); //Parsing('T' 제거)
		$("#todo_sdate").attr('value', repSdate); //Controller에 보낼 hidden에 값을 세팅
		$("#todo_eedate").attr('value', repEedate); //Controller에 보낼 hidden에 값을 세팅
		
		var param = $('#todoInsert').serialize();
		$.ajax({
			method: "POST",
			url: "/todoInsert",
			dataType: html,
			data: param,
			success: function(data) {
				alert("success");
				$('.currentCardContentViewRight').html("");
				$('.currentCardContentViewRight').html(data);
			},
			error:function(data) {
				alert("error");
			}
		});
	}
	
</script>
<script>
// html dom 이 다 로딩된 후 실행된다.
$(document).ready(function(){
	
    // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
    $(".projectTeams > h2").click(function(){
        var submenu = $(this).next("ul");

        // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
        if( submenu.is(":visible") ){
            submenu.slideUp();
        }else{
            submenu.slideDown();
        }
    });
    
    //todo 등록시 시작일자는 현재시간으로 기본값(default) 설정  ==문의: jerry==
    var date = new Date();
    date.setHours(date.getHours() + 9);
    console.log(date.toISOString());
    document.getElementById('non_todo_sdate').value = date.toISOString().slice(0, 16);
    
});
</script>
</body>
</html>