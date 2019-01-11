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
.noticeContainerRight > form > table {
	border-collapse:collapse;width:100%;
}
.noticeContainerRight > form > table > tbody > tr:first-child {
	border-top:2px solid #333;
}
.noticeContainerRight > form > table > tbody > tr{border-bottom:1px solid #333;}
.noticeContainerRight > form > table > tbody > tr > td {padding:20px;font-size:17px;}
.tdColor{background-color:#eaf2ff;}
.textareaTd{width:100%;}
.noticeListGo{width:100%;height:50px;margin-top:20px;}
.noticeListGo > a {
	width:80px;height:40px;background-color:#eaf2ff;text-align:center;
	line-height:40px;border:1px solid #333;font-size:17px;
}
#qnaMody {
	float:left;width:80px;height:40px;background-color:#eaf2ff;text-align:center;
	line-height:40px;border:1px solid #333;font-size:17px;cursor:pointer;
}
#delPost {
	float:left;width:80px;height:40px;background-color:#eaf2ff;text-align:center;
	line-height:40px;border:1px solid #333;font-size:17px;cursor:pointer;
	margin-left:10px;
}
#qnaReply {
	float:left;width:80px;height:40px;background-color:#eaf2ff;text-align:center;
	line-height:40px;border:1px solid #333;font-size:17px;cursor:pointer;
}
.qnaCreateList{float:left;}
.qnaCreateBtns{float:right;}
#cecret{cursor:pointer;}
.qnaCreateInputTitle {
	border:none;font-size:17px;width:100%;outline:none;
}
.textareaTd > textarea{width:100%;height:300px;font-size:17px;border:none;outline:none;}
.secretGoGoYeah {
	width:100%;margin-top:10px;border:none;font-size:18px;border-bottom:1px solid #333;outline:none;
	font-family:'Malgun Gothic';
}
</style>
<!-- CURRENT SECTION(MAIN) -->
<section class="currentMain">
	<div class="currentMainContainer">
		<div class="noticeContainer">
			<div class="noticeContainerLeft">
				<h2>CURRENT SERVICE<br>Q & A</h2>
			</div>
			<div class="noticeContainerRight">
				<form name="formValue">
					<input type="hidden" name="post_writer" value="${memberVo.member_mail}">
					<input type="hidden" name="board_id" value="${postVo.board_id}">
					<input type="hidden" name="post_hierarchy" value="${postVo.post_hierarchy}">
					<table>
						<tr>
							<td class="tdColor">제목</td>
							<td><input type="text" name="post_title" placeholder="제목을 입력하세요" class="qnaCreateInputTitle"></td>
							<td class="tdColor">질의 작성자</td>
							<td>${memberVo.member_name}</td>
						</tr>
						<tr>
							<td class="tdColor">비밀글 여부</td>
							<td colspan="4">
								<span id="cecret" >[ 선택 ] : </span> 
								<span id="select" > 공개 </span> 
								<input type="hidden" id="post_pass" name="post_pass" placeholder="비밀번호를 입력하세요" class="secretGoGoYeah" />
							</td>
						</tr>
						<tr>
							<td colspan="4" class="textareaTd">
								<textarea name="post_content" placeholder="내용을 입력하세요"></textarea>
							</td>
						</tr>
					</table>
					<div class="noticeListGo">
						<a href="/qnaList" class="qnaCreateList">목록</a>
						<a href="#" onclick="savePost();" class="qnaCreateBtns">저장</a>
					</div>
				</form>
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

//비밀글 버튼 처리
$(document).ready(function(){
	var type = "y";
	$("#cecret").click(function(){
		if(type=="y"){
			$("#select").css({"color": "red"});
	    	$("#select").html("<span>비공개</span>");
	    	$("#post_pass").val("select");
			type = "n";
		}else if(type=="n"){
			$("#select").css({"color": "black"});
	    	$("#select").html("<span>공개</span>");
	    	$("#post_pass").val("");
	    	type = "y";
		}
	});	
});

//저장
function savePost(){
	var hanBangFormValue=$('form[name=formValue]').serialize();
	
	$.ajax({
		method: "POST",
		url: "/newPost",
		data: hanBangFormValue,
		success: function (data) {
			$(body).append(data);
			$(location).attr('href','/qnaList');
		},
		error: function (data) {
			console.log("list-error : " + data);
		}
	});
}

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