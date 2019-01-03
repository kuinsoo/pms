<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/header.jsp" %>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="../css/issue.css" />
<script type="text/javascript">
var curPage = 1;

$(document).ready(function(){	//페이지가 로드되면 데이터를 가져오고 page를 증가시킨다. == $(document).ready(function(){});
	getList(curPage);
	//page++;
});

var ingFlag = false;

/* 스크롤 최하단시 리스트 조회 및 page 증가 ==문의: jerry== */
$(window).scroll(function() {
	//console.log("window-scroll" );
	//console.log(Math.abs($(window).scrollTop() - ($(document).height() - $(window).height())));
	
	if(ingFlag == false){
		if(Math.abs($(window).scrollTop() - ($(document).height() - $(window).height())) < 1){
		//if($(window).scrollTop() == $(document).height() - $(window).height()){
			console.log("scrollTop : " + $(window).scrollTop() + " / height : " + ($(document).height() - $(window).height()));
			getList(curPage);
			ingFlag = true;
		}
	}
	//else{
	//	return false;
	//}
});

/* 프로젝트별 총기간 및 소요기간 퍼센트 ==문의: jerry== */
function getList(page) {
	var sid = '${memberVo.member_mail}';
	var cnt = ${projectCnt};
	var pageSize = 5;
	
	$.ajax({
		url: '/issueHistoryAjax',
		type: 'POST',
		data: {page : page, pageSize : pageSize, member_mail : sid},
		success: function(data){
			//if(data.indexOf("<span>") > 0 ){
			if(page <= cnt){
				$("#ajaxx").append(data);
				
				curPage++;
				ingFlag = false;
				
			}else{
				ingFlag = true;
			}
		},
		error: function(data){
			console.log("issueHistory.jsp : getList() - error");
		}
	});
}

/* 새로고침시 스크롤바 위치를 0으로 세팅 ==문의: jerry== */
$(window).on('beforeunload', function() {
	return $(window).scrollTop(0);
});

</script>
<style media="screen">
.scroll{
	width:100%;
	height:1000px;
	padding-top:40px;
	margin-bottom:70px;
}

.container{
	width: 800px;
	height: auto;
	margin: 0 auto;
}

#myProgress {
	width: 100%;
	background-color: grey;
}

.myBar {
	width: 10px;
	height: 15px;
	background-color: #64FE2E;
}

.issuePin {
	width: 100%;
	height: 15px;
	background-color: #FFFFFF;
}

.pin{
	position: relative;
	width: 9px;
	height: 17px;
	float: left;
}

</style>
<section class="currentMain">
	<div class="scroll">
		<div class="container" id="ajaxx">
			<!-- issueHistoryAjax.jsp -->
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
<script type="text/javascript" src="../js/classie.js"></script>
<script type="text/javascript" src="../js/jquery-ui.js"></script>
<script>
//DIM POPUP
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
</script>
</body>
</html>