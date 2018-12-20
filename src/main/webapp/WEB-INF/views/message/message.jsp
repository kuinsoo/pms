<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp" %>
	<!-- CURRENT SECTION(MAIN) -->
	<section class="currentMain">
		<div class="currentMainContainer">
			<div class="facingTitle">
				<h2><i class="icon-paper-plane icons"></i>쪽지</h2>
			</div>
			<div class="facingContainer">
				<div id="tabs2">
					<ul>							
						<li><a href="#tabs2-1">쪽지 보내기</a></li>
						<li><a href="#tabs2-2">받은쪽지</a></li>
						<li><a href="#tabs2-3">보낸쪽지</a></li>
						<li><a href="#tabs2-4">친구리스트</a></li>
					</ul>

					<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 쪽지 보내기  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
					<div id="tabs2-1">
						<div class="facingSend">
							<form action="/insertMessageSend" method="post">
								<div class="facingSendTitle">
									<input type="text" class="recipient" name="textValue" placeholder="받는사람을 입력해주세요" />
									<select name="selectBox" onChange="getSelectValue(this.form);" class="recipientSelect">
										<option> 친구등록 리스트 </option>
										<c:forEach items="${selctMyFriend }" var="mf">
											<option>${mf.friend_member}</option>
										</c:forEach>
									</select>
									<!-- option으로 선택한 갑이 input에 넣어진다 -->
									<script>
									function getSelectValue(frm){
									 	frm.textValue.value = frm.selectBox.options[frm.selectBox.selectedIndex].text;
									}
									</script>
								</div>
								<textarea class="facingContent" name = "textArea"></textarea>
								<div class="facingBtn">
									<input type = "hidden" name = "msg_smember" />
									<input type="submit" class="facingSendBtn" value="보내기" />
									<input type="button" class="facingSendReset" value="취소" />
								</div>
							</form>
						</div>
					</div>
					
					<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 받은쪽지 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
					
					<input type="hidden" id ="msg_type" name ="msg_type"/> 
					<div id="tabs2-2">
						<div class="receivedNoteContainer">
							<form action="#" method="post">
								<table>						
									<colgroup width="10%" />
									<colgroup width="10%" />
									<colgroup width="40%" />
									<colgroup width="15%" />
									<colgroup width="30%" />
									<thead>
										<tr class="msgClick1"> 
											<th>번호</th>
											<th>아이디</th>
											<th>받은 쪽지 내용</th>
											<th>쪽지 보낸 사람</th>
											<th>받은 날짜</th>
										</tr>
									</thead>
									<tbody id="msgReceiveList">
									</tbody>
								</table>
							</form>
							<ul class="pagination receivePaging"></ul>
							
							<!-- 팝업 시작 부분 -->
							<div class="white_content2" id="open2">
								<div>
 									<a href="#close"><i class="icon-close icons"></i></a>
									<div class="sentNoteContainer">
										<div class="recipientFacing">
											<span>보낸사람</span>
											<input type="text" id = "reInput1" value="" readonly />
										</div>
										<div class="sendDate">
											<span>받은 날짜</span>
											<input type="text" value=""  id = "reInput2" readonly />
											<i class="icon-ban icons"></i>
											<span>차단</span>
											<i class="icon-energy icons"></i>
											<span>신고</span>
										</div>							
										<textarea class="sentNoteTextArea" id="reInput3"></textarea>
										<div class="facingDeleteBtnDiv">
											<form method="post" action="/deleteMessageReceived">
												<input type="submit" value="삭제" class="sentNoteDeleteBtn"/>
												<input type="hidden" id ="reInput" name ="msg_id" />
											</form>
											<a href="#close" class="sentNoteCloseBtn">취소</a>
										</div>
									</div>
								</div>
						    </div>
							<!-- 팝업 끝나는 부분 -->
						</div>
					</div>
					
					<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 보낸쪽지 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
					
					
					<div id="tabs2-3">
						<div class="sentNoteContainer">
							<form action="#" method="post">
								<table>
									<colgroup width="10%" />
									<colgroup width="10%" />
									<colgroup width="40%" />
									<colgroup width="15%" />
									<colgroup width="30%" />
									<thead>
										<tr class = "msgClick2">
											<th>번호</th>
											<th>아이디</th>
											<th>보낸 쪽지 내용</th>
											<th>받는 사람</th>
											<th>보낸 날짜</th>
										</tr>
									</thead>
									<tbody id="msgSendList">
									</tbody>
								</table>
							</form>
							<div>
								<ul class="pagination2"></ul>
							</div>
							<!-- 팝업  -->
							<div class="white_content1" id="open1">
								<div>
									<a href="#close"><i class="icon-close icons"></i></a>
									<div class="sentNoteContainer">
										<div class="recipientFacing">
											<span>받는 사람</span>
											<input type="text" id="sendInput3"readonly />
										</div>
										<div class="sendDate">
											<span>보낸 날짜</span>
											<input type="text" id="sendInput4" readonly />
										</div>							
										<textarea class="sentNoteTextArea" id = "sendInput2"></textarea>
										<div class="facingDeleteBtnDiv">
											<form method="post" action="/deleteMessageSend">
												<input type="submit" value="삭제" class="sentNoteDeleteBtn"/>
												<input type="hidden" id ="sendInput1" name ="msgmember_msg" />
											</form>
										</div>
									</div>
								</div>
						    </div>
						</div>
					</div>
					<div id="tabs2-4">
						<div class="friendContainer">
							<div class="friendLeft">
								<form action="#" method="post">
									<input type="text" placeholder="친구 이메일을 입력해주세요" class="friendSearchInput" />
									<input type="button" value="검색" class="friendSearchBtn" />
									
									<table class="friendCreateTable">
										<thead>
											<tr>
												<th>이메일</th>
												<th>등록</th>
											</tr>
										</thead>
										<tbody>
										<%-- <c:forEach items="${selctMyFriend }" var="mf">	
											<tr>
												<td>${mf.friend_member}</td>
												<td><input type="button" value="친구삭제"/></td>
											</tr>
										</c:forEach>	 --%>
											<tr>
												<td>${mf.friend_member}</td>
												<td><input type="button" value="친구삭제"/></td>
											</tr>
										</tbody>
									</table>
									<ul class="friendCreateTablePaging">
										<li><</li>
										<li>1</li>
										<li>2</li>
										<li>></li>
									</ul>
								</form>
							</div>
							<div class="friendRight">
								<input type="text" placeholder="친구 이메일을 입력해주세요" class="friendSearchInput" />
								<input type="button" value="검색" class="friendSearchBtn" />
								<table class="friendCreateTable">
									<thead>
										<tr>
											<th>번호</th>
											<th>이메일</th>
											<th>삭제</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td>test@gmail.com</td>
											<td><input type="button" value="친구삭제" /></td>
										</tr>
									</tbody>
								</table>
								<ul class="friendCreateTablePaging2">
									<li><</li>
									<li>1</li>
									<li>2</li>
									<li>></li>
								</ul>
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
	
<%--  <form id = "frm" action="/updateMessageReceived" method = "get">
	<input type = "hidden" id = "msg_id" name ="msg_id" value="${msg_id}"/>	
 </form>  --%>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/classie.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		getMessageReceived(1);
		getMessageSend(1);
		
		$("#msgReceiveList").on("click", ".msgClick1" ,function(){
			console.log("msgReceiveList");
			var msg_id = $(this).children()[1].innerHTML;
			updateMessageReceivedAjax(msg_id);
			window.location = "#open2";
		});
		
		$("#msgSendList").on("click", ".msgClick2" ,function(){
			console.log("msgSendList");
			var msgmember_msg = $(this).children()[1].innerHTML;
			console.log(msgmember_msg);
			updateMessageSendAjax(msgmember_msg);
			 window.location = "#open1";
		});
	});
		
	//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		function getMessageReceived(page){
			var pageSize = 10;
			$.ajax({
				type: "GET",
				url : "/messageReceivedAjax",
				data : {"page":page, "pageSize":pageSize},
				success: function(data){
					var msg_type = data.msgReceiveList[0].msg_type;
					
					console.log(msg_type);
				
					if(msg_type == 'N'){
						$("#msgReceiveList > tr > td").css("color","blue");
					}else{
						$("#msgReceiveList > tr > td").css("color","red");
					}	
					
					console.log(data.msgReceiveList);
					
					var html = "";
					$.each(data.msgReceiveList,function(idx,mm){
						html += "<tr class = msgClick1>";
						html += "	<td>"+ mm.rnum +"</td>";
						html += "	<td>"+ mm.msg_id +"</td>";
						html += "	<td>"+ mm.msg_content +"</td>";
						html += "	<td>"+ mm.msg_smember+"</td>";
						html += "	<td>"+ mm.msg_time +"</td>";
						html += "</tr>";
					});
					
					//1. 
					console.log(data.msgReceiveList);
					
					$("#msgReceiveList").html("");
					$("#msgReceiveList").html(html);
					var i  = 1;
					var paging ="";
						paging +="<li><a href='javascript:getMessageReceived("+ i +");'aria-label='Previous'><span aria-hidden='true'>&laquo;</span>";
					for(var i= 1; i<= data.pageCnt; i++) {
						paging += "<li><a href='javascript:getMessageReceived("+ i +");'>"+ i+ "</a></li>";
					}
						paging +="<li><a href='javascript:getMessageReceived("+ data.pageCnt +");'aria-label='Next'><span aria-hidden='true'>&raquo;</span>";
					$(".pagination").html(paging);
				},
				fail : function(xhr){
					console.log(xhr);
				}
			});
		}
		
		function updateMessageReceivedAjax(msg_id){
			$.ajax({
				type:"GET",
				url : "/updateMessageReceivedAjax",
				data : "msg_id=" + msg_id, 
				success : function(data){
			
					console.log(data);
				
					console.log(data.msg_type);
					
					
				//2.
		 		/* var msg_type = data.msg_type;
					
 				if(msg_type == 'Y'){
					$("#msgReceiveList > tr > td").css("color","black");
				}else{
					$("#msgReceiveList > tr > td").css("color","red");
				}	  */
			  	var msg_id = data.msg_id; 
			 	var msg_smember = data.msg_smember ;
				var msg_time = data.msg_time; 
				var msg_content = data.msg_content;
				var msg_type = data.msg_type;
				
				$("#reInput1").val(msg_smember);
				$("#reInput2").val(msg_time);
				$("#reInput3").val(msg_content);
				$("#reInput").val(msg_id);
				$("#msg_type").val(msg_type);
				
				console.log(msg_type);
				
				}
			});
		}
	
		//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		
		function getMessageSend(page){
			var pageSize = 10;
			$.ajax({
				type: "GET",
				url : "/messageSendAjax",
				data : {"page":page, "pageSize":pageSize},
				success: function(data){
					
					console.log(data.msgSendList);
					var html = "";
					$.each(data.msgSendList,function(idx,mm){
						html += "<tr class= msgClick2>";
						html += "	<td>"+ mm.rnum +"</td>";
						html += "	<td>"+ mm.msgmember_msg +"</td>";
						html += "	<td>"+ mm.msg_content +"</td>";
						html += "	<td>"+ mm.msg_rmember+"</td>";
						html += "	<td>"+ mm.msg_rdate +"</td>";
						html += "</tr>";
					});
					console.log(data.msgSendList);
					
					$("#msgSendList").html("");
					$("#msgSendList").html(html);
					
					var i  = 1;
					var paging ="";
					paging +="<li><a href='javascript:getMessageSend("+data.pageCnt  +");'aria-label='Previous'><span aria-hidden='true'>&laquo;</span>";
					for(var i= 1; i<=data.pageCnt; i++) {
						paging += "<li><a href='javascript:getMessageSend("+ i +");'>"+ i+ "</a></li>";
					}
						paging +="<li><a href='javascript:getMessageSend("+ data.pageCnt +");'aria-label='Next'><span aria-hidden='true'>&raquo;</span>";
					$(".pagination2").html(paging);
				},
				fail : function(xhr){
					console.log(xhr);
				}
			});
		}
		
		function updateMessageSendAjax(msgmember_msg){
			$.ajax({
				type:"GET",
				url : "/updateMessageSendAjax",
				data : "msg_id=" + msgmember_msg, 
				success : function(data){
			
				console.log(data);
				console.log(data.msg_content);
			  	
				var msgmember_msg = data.msgmember_msg; 
			 	var msg_content = data.msg_content ;
				var msg_rmember = data.msg_rmember; 
				var msg_rdate = data.msg_rdate;
				
				$("#sendInput1").val(msgmember_msg);
				$("#sendInput2").val(msg_content);
				$("#sendInput3").val(msg_rmember);
				$("#sendInput4").val(msg_rdate);
				
				}
			});
		}
		
		//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

</script>

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