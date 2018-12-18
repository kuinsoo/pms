<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp" %>	
	
	<!-- CURRENT SECTION(MAIN) -->
	<section class="currentMain">
		<div class="currentMainContainer">
			<div class="myPageContainer">
				<div class="myPageContainerTitle">
					<h2>사용자 기본 정보</h2>
				</div>
				
				<form action="#" method="post" enctype="multipart/form-data">
				<div class="myPageContainerLeft">
					<div class="myPageContainerLeftUser">
						<h2>${memberVo.member_name}님의 프로필</h2>
						<div class="profileImg">
							<div id="imgs">
								<div class="scale"><img src="${memberVo.member_profile}"/></div>
							</div>
						</div>
					</div>
					<div class="myPageContainerRightUser">
						<div class="userContentsInfoRight_1">
							<ul id="test">
								<li>사용자 이메일</li>
								<li>사용자 이름 </li>
								<li>휴대폰 번호</li> 
							</ul>
						</div>
						<div class="userContentsInfoRight_2">
							<ul>
								<li><input type="text" value= "${memberVo.member_mail}" disabled="disabled" id = "member_mail"  name = "member_mail"/></li>
								<li><input type="text" value= "${memberVo.member_name}" name ="member_name" id ="member_name"/></li>
								<li><input type="text"  value= "${memberVo.member_tel}" name ="member_tel"  id ="member_tel"/></li>
							</ul>
						</div>
					</div>
				</div>
			</form>				
				<div class="myPageContainerRight">
					<div class="myPageContainerRightLeftChart">
						<canvas id="myChart" width="349" height="500"></canvas>
					</div>
					<div class="myPageContainerRightRightChart">
						<canvas id="myChart2" width="349" height="500"></canvas>
					</div>
				</div>
				<div class="myPageBottomContainer">
					<div id="tabs2">
						<ul>							
							<li><a href="#tabs2-1">참여중인 프로젝트</a></li>
							<li><a href="#tabs2-1-1">참여했던 프로젝트</a></li>
							<li><a href="#tabs2-2">즐겨찾기한 프로젝트</a></li>
							<li><a href="#tabs2-3">일감 조회</a></li>
							<li><a href="#tabs2-4">파일보관함</a></li>
							<li><a href="#tabs2-5">회원탈퇴</a></li>
						</ul>

						<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 참여중인 목록  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->

						<div id="tabs2-1">
							<div class="projectTable">
								<div class="projectSearchDiv">　　
									<form name ="searchProject" method="POST" onsubmit="return false;">
										<input type="text" id="searchText" name="searchText" value="${searchText}" placeholder="검색어를 입력해주세요"/>
										<input type="hidden" name="page" value='1' />
										<input type="hidden" name="pageSize" value='10' />
										<i class="icon-magnifier icons searchBtn" onclick="javascript:getSearchProject();"></i>  
									</form>
								</div>
								<table>
									<colgroup width="10%" />
									<colgroup width="45%" />
									<colgroup width="15%" />
									<colgroup width="30%" />
									<thead>
										<tr class="projectClick">
											<th><span>번호</span></th>
											<th><span>참여중인 프로젝트 명</span></th>
											<th><span>프로젝트 아이디 </span></th>
											<th><span>프로젝트 팀장</span></th>
										</tr>
									</thead>
									<tbody id ="projectList">
									</tbody>
								</table>
								<div class="text-center">
									 <ul class="pagination"></ul>
								</div>
							</div>
						</div>
						

						<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 참여했던 목록  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->

						<div id="tabs2-1-1">
							<div class="projectTable">
								<div class="projectSearchDiv">　　
									<form name ="searchEndProject" method="POST" onsubmit="return false;">
										<input type="text" id="searchEndText" name="searchEndText" value="${searchEndText}" placeholder="검색어를 입력해주세요"/>
										<input type="hidden" name="page" value='1' />
										<input type="hidden" name="pageSize" value='10' />
										<i class="icon-magnifier icons searchBtn" onclick="javascript:getSearchEndProject();"></i>  
									</form>
								</div>
								<table>
									<colgroup width="10%" />
									<colgroup width="45%" />
									<colgroup width="15%" />
									<colgroup width="30%" />
									<thead>
										<tr>
											<th><span>번호</span></th>
											<th><span>참여했던 프로젝트 명</span></th>
											<th><span>프로젝트 아이디 </span></th>
											<th><span>프로젝트 팀장</span></th>
										</tr>
									</thead>
									<tbody  id ="projectEndList">
									</tbody>
									</table>
								<div class="text-center">
									 <ul class="pagination1"></ul>
								</div>
							</div>
						</div>
						
						<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 즐겨찾기 목록 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
						
						 
						<div id="tabs2-2">
							<div class="projectTable">
								<div class="projectSearchDiv">　　
									<form name ="searchBookProject" method="POST" onsubmit="return false;">
										<input type="text" id="searchBookText" name ="searchBookText" value='${searchBookText}' placeholder="검색어를 입력해주세요"/>
										<input type="hidden" name="page" value='1' />
										<input type="hidden" name="pageSize" value='10' />
										<i class="icon-magnifier icons searchBtn" onclick="javascript:getSearchBookProject();"></i>  
									</form>
								</div>
								<table>
									<colgroup width="10%" />
									<colgroup width="45%" />
									<colgroup width="15%" />
									<colgroup width="30%" />
									<thead>
										<tr class = "projectBookClick" >
											<th><span>번호</span></th>
											<th><span>즐겨찾기한 프로젝트 명</span></th>
											<th><span> 프로젝트 아이디</span></th>
											<th><span>프로젝트 팀장</span></th>
										</tr>
									</thead>
									<tbody id ="projectBookList">
									</tbody>
								</table>
								<div class="text-center">
									 <ul class="pagination2"></ul>
								</div>
							</div>
						</div>
						
						<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 일감 보관 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
						
						
						<div id="tabs2-3">
							<div class="projectTable">
								<div class="projectSearchDiv">　　
								 <form name ="searchTodoProject" id ="searchTodoProject" method="POST" onsubmit="return false;">
										 <input type="text" id="searchTodoText" name ="searchTodoText" value='${searchTodoText}'  placeholder="검색어를 입력해주세요"/>
										<input type="hidden" name="page" value='1' />
										<input type="hidden" name="pageSize" value='10' />
										<i class="icon-magnifier icons" onclick="javascript:getSearchTodoProject();"></i>  
									</form> 
								</div>
								<table>
									<colgroup width="10%" />
									<colgroup width="60%" />
									<colgroup width="30%" />
									<thead>
										<tr class = "projectTodoList">
											<th><span>번호</span></th>
											<th><span>나의 일감 보관</span></th>
											<th><span>완료 여부</span></th>
										</tr>
									</thead>
									<tbody id ="projectTodoList"> 
									</tbody>
								</table>
								<div class="text-center">
									 <ul class="pagination3"></ul>
								</div>
							</div>
						</div>
						<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 파일 보관함 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
						
						<div id="tabs2-4">
							<div class="projectTable">
								<div class="projectSearchDiv">　　
									<%--  <form name ="searchProject" method="POST" onsubmit="return false;">
										 <input type="text" id="searchText" name ="searchText" value='${searchText}'  placeholder="검색어를 입력해주세요"/>
										<input type="hidden" name="page" value='1' />
										<input type="hidden" name="pageSize" value='10' />
										<i class="icon-magnifier icons" onclick="javascript:getSearchProject();"></i>  
									</form>  --%>
								</div>
								<table>
									<colgroup width="10%" />
									<colgroup width="60%" />
									<colgroup width="30%" />
									<thead>
										<tr>
											<th><span>번호</span></th>
											<th><span>파일 명</span></th>
											<th><span>파일 다운로드</span></th>
										</tr>
									</thead>
									<tbody id ="아직미구현">
									</tbody>
								</table>
								<div class="text-center">
									 <ul class="pagination"></ul>
								</div>
							</div>
						</div>
						
						<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
						
						<div id="tabs2-5">
							<div class="tabs2-5center">
							<h2>회원 탈퇴 </h2>
								<p> 회원 확인을 위하여 비밀번호를 입력해주세요. </p>
								<input id ="member_pass" id = "member_pass" placeholder ="비밀번호를 입력해주세요.." type="password" />
								<input type="button" class= "goodbyeBtn" value= "확인"/>
								<span id = "passError"> 비밀번호가 일치하지 않습니다. </span>
							</div>
						</div>
						
						<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
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
<script type="text/javascript" src="js/jquery-ui.js"></script>
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

// 마이페이지 하단 탭 메뉴
$("#tabs2").tabs();

var ctx = document.getElementById("myChart").getContext('2d');
var myChart = new Chart(ctx, {
    type: 'line',
    data: {	
        labels: ["참여중" , "참여했던" , "즐겨찾기", "일감"],
        datasets: [{
        	  label: '${memberVo.member_name} 님의 CURRENT',
            data: [${totalProjectCnt}, ${totalEndProjectCnt}, ${selectProjectCnt}, ${selectTodoCnt}],
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

var ctx2 = document.getElementById("myChart2").getContext('2d');
var myChart2 = new Chart(ctx2, {
    type: 'horizontalBar',
    data: {
    	labels: ["참여중" , "참여했던" , "즐겨찾기", "일감"],
        datasets: [{
            label: '${memberVo.member_name} 님의 CURRENT',
            data: [${totalProjectCnt}, ${totalEndProjectCnt}, ${selectProjectCnt}, ${selectTodoCnt}],
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
</body>
</html>