<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp" %>
	<!-- CURRENT SECTION(MAIN) -->
	<section class="currentMain">
		<div class="currentMainContainer">
			<div class="facingTitle">
				<h2>쪽지</h2>
			</div>
			<div class="facingContainer">
				<div id="tabs2">
					<ul>							
						<li><a href="#tabs2-1">쪽지 보내기</a></li>
						<li><a href="#tabs2-2">받은쪽지</a></li>
						<li><a href="#tabs2-3">보낸쪽지</a></li>
						<li><a href="#tabs2-4">휴지통</a></li>
					</ul>

					<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 쪽지 보내기  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
					<div id="tabs2-1">
						<div class="facingSend">
							
						</div>
					</div>
					
					<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 받은쪽지 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
					
					 
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
					
					<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 보낸쪽지 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
					
					
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
					<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 휴지통 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
					
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

//마이페이지 하단 탭 메뉴
$("#tabs2").tabs();
</script>
</body>
</html>