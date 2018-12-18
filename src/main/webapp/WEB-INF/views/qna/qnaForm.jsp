<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- left & header--%>
<%@ include file="/WEB-INF/views/header.jsp" %>
<style type="text/css">
.noticeContainer{width:1200px;margin:0 auto;margin-top:40px;overflow:hidden;}
.noticeContainerLeft {
	width:300px;height:300px;padding:20px;float:left;
	display:flex;justify-content:center;align-items:center;background-color:#fff;
	border:1px solid #dee3eb;
}
.noticeContainerRight {
	width:875px;padding:20px;float:left;margin-left:20px;
	background-color:#fff;border:1px solid #dee3eb;
}
.noticeContainerRight > table{width:100%;border-collapse:collapse;}
.noticeContainerRight > table > thead > tr{border-top:3px solid #333;border-bottom:1px solid #333;}
.noticeContainerRight > table > thead > tr > th{padding:20px 0px 20px 0px;font-size:17px;}
.noticeContainerRight > table > tbody > tr{border-bottom:1px solid #333;}
.noticeContainerRight > table > tbody > tr > td{padding:20px 0px 20px 0px;font-size:17px;}
.noticeContainerRight > table > tbody > tr > td:nth-child(odd){text-indent:10px;}
.noticeContainerRight > table > tbody > tr > td:nth-child(odd) > a{color:#000;}
.noticeContainerRight > table > tbody > tr > td:nth-child(odd):hover > a {
	text-decoration:underline;font-weight:bold;
}
.noticeContainerRight > table > tbody > tr > td:nth-child(even){text-align:center;color:#666;}
.pagination{width:100%;display:flex;justify-content:center;align-items:center;margin-top:30px;}
.pagination > ul > li{display:inline-block;}
.pagination > ul > li > i {
	text-align:center;line-height:30px;cursor:pointer;font-size:15px;vertical-align:middle;
	padding:0px 20px 0px 20px;
}
.pagination > ul > li > a{color:#000;}
.pagination > ul > li > a > span{font-size:17px;padding:0px 10px 0px 10px;vertical-align:middle;}
.noticeSearchDiv{width:425px;height:50px;margin:0 auto;margin-top:10px;}
.noticeSearchDiv > .noticeSearchInput {
	width:390px;border:none;border-bottom:1px solid #333;float:left;height:30px;
	outline:none;font-size:17px;
}
.noticeSearchDiv > i {
	float:left;font-size:20px;font-weight:bold;display:block;width:30px;height:27px;margin-top:3px;
	border-bottom:1px solid #000;cursor:pointer;
}
</style>
<!-- CURRENT SECTION(MAIN) -->
<section class="currentMain">
	<div class="currentMainContainer">
		<div class="noticeContainer">
			<div class="noticeContainerLeft">
				<h2>CURRENT SERVICE<br>Q & A <br> 작성하기 </h2>
			</div>
			<div class="noticeContainerRight">
				
				작성하기 <br/>
				서식 들어갈 자리 
				
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