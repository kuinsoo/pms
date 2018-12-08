<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- header & left --%>
<%@ include file="/WEB-INF/views/header.jsp" %>
	
	<!-- CURRENT SECTION(MAIN) -->
	<section class="currentMain">
		<div class="currentMainContainer">
			<div class="currentMainContainerLeft">
				<div class="currentSubMainTitle">
					<i class="icon-star icons"></i>
					<span>${project.project_title}</span>
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
				                <div class="portlet">
				                    <div class="portlet-header">TITLE</div>
				                    <div class="portlet-content">
				                    	CONTENT CONTENT CONTENT CONTENT CONTENT CONTENT CONTENT CONTENT CONTENT CONTENT CONTENT CONTENT
				                    </div>
				                    <label class="kku-hide kku-no">1</label>
				                    <label class="kku-hide kku-group">1</label>
				                    <label class="kku-hide kku-index">1</label>
				                </div>
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
							<li><a href="#tabss-1">업무</a></li>
							<li><a href="#tabss-2">글</a></li>
							<li><a href="#tabss-3">일정</a></li>
							<li><a href="#tabss-4">할일</a></li>
						</ul>
						<!-- tap1 업무 -->
						<div id="tabss-1">
							<form action="/ajaxCreateWork" method="get">
								<div class="calendarContainerInput">
									<div class="calendarInputDiv">
										<i class="icon-clock icons"></i>
										<input type="date" name="work_sdate"> <!-- 업무시작일 -->
									</div>
									<span class="calendarInputDivSpan">~</span>
									<div class="calendarInputDivs">
										<i class="icon-clock icons"></i>
										<input type="date" name="work_eedate"> <!-- 마감예상일 -->
									</div>
								</div>
								<label>업무</label>
								<input type="text" name="work_title" placeholder="업무" class="calendarTitle" />
								<label>업무 내용</label>
								<textarea class="tabssTextArea" name="work_content" placeholder="업무내용"></textarea><br/>
								<label>업무 유형</label><br/>
								<input type="radio" name="work_type" value="type1"/> 
								<input type="radio" name="work_type" value="type2"/> 
								<input type="radio" name="work_type" value="type3"/><br/>
								<label>업무 중요도</label><br/>
								<select name="work_importance">
									<option value="1">Level 1</option>
									<option value="2">Level 2</option>
									<option value="3">Level 3</option>
									<option value="4">Level 4</option>
									<option value="5">Level 5</option>
								</select> <br/>
								<label>업무 공개여부</label><br/>
								<input type="checkbox" name="work_public" value="Y"/>WORK_PUBLIC<br/>
								<input type="submit" class="tabssTextAreaSubmit" value="올리기" />
							</form>
						</div>
						<!-- tap1 업무 끝 -->
						<!--  -->					
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
							<input type="submit" class="tabssTextAreaSubmit" value="올리기" />
						</div>
					</div>
				</div>
				<!-- 카드 리스트  -->
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
					<!-- 댓글  -->
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
				<!-- 카드 (글)끝  -->
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

	/*
	function updateCard(no, group, index){
		location.href = "/updateCard?card_no="+no+"&card_group="+group+"&card_index="+index;
	};
	*/
</script>
</body>
</html>