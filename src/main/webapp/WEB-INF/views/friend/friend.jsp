<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp" %>
	<!-- CURRENT SECTION(MAIN) -->
	<section class="currentMain">
		<div class="currentMainContainer">
			<div class="facingTitle">
				<h2><i class="icon-user icons"></i>친구</h2>
			</div>
			<div class="facingContainer">
				<div id="tabs2">
					<ul>
						<li><a href="#tabs2-4">친구리스트</a></li>
						<li><a href="#tabs2-5">친구요청</a></li>
					</ul>
					<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
					<div id="tabs2-4">
						<div class="friendContainer">
						 	<div class="friendLeft">
						      <h2>친구찾기</h2>
								<form name ="searchTextFriendList" method="POST" onsubmit="return false;">
										<input type="text" id="searchTextFriendList" name="searchTextFriendList" class="friendSearchInput" placeholder="찾으시는 분의 이메일을 입력해주세요" />
										<input type="hidden" name="page" id= "friendListPage" value='1'/>
										<input type="hidden" name="pageSize" value='10' />
										<input type="button" value="검색" class="friendSearchBtn" onclick="javascript:getAllMemberSearch();"/>
										<button onclick="getAllMember(1);" class="friendListFriday">목록으로</button>
								</form>
									
									<table class="friendCreateTable">
										<thead>
											<tr>
												<th>번호</th>
												<th>회원이메일</th>
												<th>회원이름</th>
												<th>등록</th>
											</tr>
										</thead>
										<tbody id = "myMemberList">
										</tbody>
									</table>
									<ul class="paginationMember">
									</ul>
							</div>
							
							<div class="friendRight">
							<h2>나의친구목록</h2>
								<form name ="searchTextFriend" method="POST" onsubmit="return false;">
										<input type="text" id="searchTextFriend" name="searchTextFriend" class="friendSearchInput" placeholder="찾으시는 친구의 이메일을 입력해주세요" />
										<input type="hidden" name="page" id="myFriendsListPage" value='1'/>
										<input type="hidden" name="pageSize" value='10' />
										<input type="button" value="검색" class="friendSearchBtn" onclick="javascript:getSearchFriendProject();"/>
										<button onclick="getMyFriends(1);" class="friendListFriday">목록으로</button>
										
								</form>
								<table class="friendCreateTable">
									<thead>
										<tr>
											<th>번호</th>
											<th>친구 번호</th>
											<th>이메일</th>
											<th>친구 이름</th>
											<th>삭제</th>
										</tr>
									</thead>
									<tbody id ="myFriendList">
										<tr>
											<!-- <td><input type="button" value="친구삭제" /> -->
										</tr>
									</tbody>
								</table>
								<ul class="paginationFriends">
								</ul>
							</div>
						</div>
					</div>
					<!-- ################################################################################################################################# -->
					<!-- 요청 부분  -->
					<div id="tabs2-5">
						<div class="friendContainer">
						 	<div class="friendLeft">
						      <h2>내가 보낸 친구요청</h2>
								<form name ="searchTextMySendFriendList" method="POST" onsubmit="return false;">
										<input type="text" id="searchTextMySendFriendList" name="searchTextMySendFriendList" class="friendSearchInput" placeholder= "찾으시는 친구의 이메일을 입력하세요"/>
										<input type="hidden" name="page" id ="MySendFriendListPage"  value='1'/>
										<input type="hidden" name="pageSize" value='10' />
										<input type="button" value="검색" class="friendSearchBtn" onclick="javascript:getMySendFriendListSearch();"/>
										<button onclick="getMySendFriendList(1);" class="friendListFriday">목록으로</button>
								</form>
									<table class="friendCreateTable">
										<thead>
											<tr>
												<th>번호</th>
												<th>회원 코드</th>
												<th>회원이메일</th>
												<th>회원이름</th>
												<th>요청취소</th>
											</tr>
										</thead>
										<tbody id = "sendFriendList">
										</tbody>
									</table>
									<ul class="paginationMySendFriends">
									</ul>
							</div>
						
							<!-- ################################################################################################################### -->
						
							<div class="friendRight">
							<h2>내가 받은 친구 요청</h2>
								<form name ="searchTextYouGiveFriendList" method="POST" onsubmit="return false;">
										<input type="text" id="searchTextYouGiveFriendList" name="searchTextYouGiveFriendList" class="friendSearchInput" placeholder="찾으시는 친구의 이메일을 입력해주세요" />
										<input type="hidden" name="page" id="giveSearchPage" value='1'/>
										<input type="hidden" name="pageSize" value='10' />
										<input type="button" value="검색" class="friendSearchBtn" onclick="javascript:getYouGiveFriendListSearch();"/>
										<button onclick="getYouGiveFriendList(1);" class="friendListFriday">목록으로</button>
								</form>
								<table class="friendCreateTable">
									<thead>
										<tr>
											<th>번호</th>
											<th>회원 코드</th>
											<th>회원이메일</th>
											<th>회원이름</th>
											<th>수락</th>
											<th>거절</th>
										</tr>
									</thead>
									<tbody id ="giveFriendList">
										<tr>
										</tr>
									</tbody>
								</table>
								<ul class="paginationYouGiveFriends">
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

<style>
#read{background-color:#fcfcfc;color:#ccc;}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		
		/* getMessageReceived(1);
		getMessageSend(1); */
		getMyFriends(1);
		getAllMember(1);
		getMySendFriendList(1);
		getYouGiveFriendList(1);
		/* 		
		$("#msgReceiveList").on("click", ".msgClick1" ,function(){
			var msg_id = $(this).children()[1].innerHTML;
			updateMessageReceivedAjax(msg_id);
			window.location = "#open2";
			
		});
		
		$("#msgSendList").on("click", ".msgClick2" ,function(){
			console.log("msgSendList");
			var msgmember_msg = $(this).children()[1].innerHTML;
			
			updateMessageSendAjax(msgmember_msg);
			 window.location = "#open1";
		}); */
	});
	
	function getFriendsListGo(){
		getMessageReceived(1);
	};	
		
	//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
/* 	function getMessageReceived(page){
			var pageSize = 10;
			$.ajax({
				type: "GET",
				url : "/messageReceivedAjax",
				data : {"page":page, "pageSize":pageSize},
				success: function(data){
					
					var html = "";
					$.each(data.msgReceiveList,function(idx,mm){
						if(mm.msg_type =="N")
							html += "<tr class = 'msgClick1' id = 'read'>";
						else if(mm.msg_type =="Y")
							html += "<tr class = 'msgClick1'>";
						
						html += "	<td>"+ mm.rnum +"</td>";
						html += "	<td>"+ mm.msg_id +"</td>";
						html += "	<td>"+ mm.msg_content +"</td>";
						html += "	<td>"+ mm.msg_smember+"</td>";
						html += "	<td>"+ mm.msg_time +"</td>";
						if(mm.msg_type =='Y'){
							html += "<td>"+ '읽지않음' +"</td>";						
						}else{
							html += "<td>"+ '읽음' +"</td>";	
						}
						html += "</tr>";
					});
					
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
					
					$("#msgSendList").html("");
					$("#msgSendList").html(html);
					
					var i  = 1;
					var paging ="";
					paging +="<li><a href='javascript:getMessageSend("+ i  +");'aria-label='Previous'><span aria-hidden='true'>&laquo;</span>";
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
		} */
		//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		// 친구 리스트 뽑아오는 Ajax
		
							
		function getMyFriends(page){
			var pageSize = 10;
			$.ajax({
				type: "GET",
				url : "/myfriendListAjax",
				data : {"page" : page, "pageSize":pageSize},
				success: function(data){
					
					var html = "";
					$.each(data.myFriendList,function(idx,mm){
						html += "<tr class =friends>";
						html += "	<td>"+ mm.rnum +"</td>";
						html += "	<td>"+ mm.friend_code +"</td>";
						html += "	<td>"+ mm.friend_member +"</td>";
						html += "	<td>"+ mm.member_name +"</td>";
						html += "	<td>"+ "<input type='button' onclick ='deleteMyFriends("+mm.friend_code+");' value='친구삭제'/>"+"</td>";
						html += "</tr>";
					});

					$("#myFriendList").html("");
					$("#myFriendList").html(html);
					var i  = 1;
					var paging ="";
						paging +="<li><a href='javascript:getMyFriends("+ i +");'aria-label='Previous'><span aria-hidden='true'>&laquo;</span>";
					for(var i= 1; i<= data.pageCnt; i++) {
						paging += "<li><a href='javascript:getMyFriends("+ i +");'>"+ i+ "</a></li>";
					}
						paging +="<li><a href='javascript:getMyFriends("+ data.pageCnt +");'aria-label='Next'><span aria-hidden='true'>&raquo;</span>";
					$(".paginationFriends").html(paging);
				},
				fail : function(xhr){
					console.log(xhr);
				}
			});
		}

			
			function getSearchFriendProject(page){
				$("#myFriendsListPage").attr("value",page);
				var param = $('form[name=searchTextFriend]').serialize();
					$.ajax({
						type: "POST",
						url : "/searchTextFriendAjax",
						data: param,
						success: function(data){
							
							var html = "";
							$.each(data.myFriendList,function(idx,mm){
								html += "<tr class =friends>";
								html += "	<td>"+ mm.rnum +"</td>";
								html += "	<td>"+ mm.friend_code +"</td>";
								html += "	<td>"+ mm.friend_member +"</td>";
								html += "	<td>"+ mm.member_name +"</td>";
								html += "	<td>"+ "<input type='button' value='친구삭제'/>"+"</td>";
								html += "</tr>";
							});
							
							$("#myFriendList").html("");
							$("#myFriendList").html(html);
							
							var i  = 1;
							var paging ="";
								paging +="<li><a href='javascript:getSearchFriendProject("+ i +");'aria-label='Previous'><span aria-hidden='true'>&laquo;</span>";
							for(var i= 1; i<= data.pageCnt; i++) {
								paging += "<li><a href='javascript:getSearchFriendProject("+ i +");'>"+ i+ "</a></li>";
							}
								paging +="<li><a href='javascript:getSearchFriendProject("+ data.pageCnt +");'aria-label='Next'><span aria-hidden='true'>&raquo;</span>";
							$(".paginationFriends").html(paging);
						},
						fail : function(xhr){
							console.log(xhr);
						}
					});
			}
		
		// 삭제버튼 눌렀을때 처리 
		function deleteMyFriends(friend_code){
			var pageSize = 10;
			$.ajax({
				type: "GET",
				url : "/myFriendsDelete",
				data : "friend_code="+friend_code,
				success: function(data){
					getMyFriends(1);
				}
			});
		}
		
		//#########################################################################################
		// 전체 사용자 뽑아오는 리스트
		function getAllMember(page){
			var pageSize = 10;
			$.ajax({
				type: "GET",
				url : "/AllMemberListAjax",
				data : {"page" : page, "pageSize":pageSize},
				success: function(data){
				
				console.log(data);
					var html = "";
					$.each(data.myMemberList,function(idx,mm){
						html += "<tr>";
						html += "	<td>"+ mm.rnum +"</td>";
						html += "	<td>"+ mm.member_mail +"</td>";
						html += "	<td>"+ mm.member_name +"</td>";
						html += "	<td>"+ "<input type='button' id ='myMemberListBtn' onclick ='getyouGiveNoAjax(\""+mm.member_mail+"\",\""+ mm.friend_accept +"\")'; value='친구 등록'/>"+"</td>";						
						html += "</tr>";
					});
					
					$("#myMemberList").html("");
					$("#myMemberList").html(html);
					
					var i  = 1;
					var paging ="";
						paging +="<li><a href='javascript:getAllMember("+ i +");'aria-label='Previous'><span aria-hidden='true'>&laquo;</span>";
					for(var i= 1; i<= data.pageCnt; i++) {
						paging += "<li><a href='javascript:getAllMember("+ i +");'>"+ i+ "</a></li>";
					}
						paging +="<li><a href='javascript:getAllMember("+ data.pageCnt +");'aria-label='Next'><span aria-hidden='true'>&raquo;</span>";
					$(".paginationMember").html(paging);
				},
				fail : function(xhr){
					console.log(xhr);
				}
			});
		}
		
		// 친구 추가 버튼을 클릭할때  
		function getyouGiveNoAjax(member_mail,friend_accept){
			
			console.log(member_mail);
			console.log(friend_accept);
			var pageSize = 10;
			$.ajax({
				type: "GET",
				url : "/youGiveNoAjax",
				data : "member_mail="+member_mail+"&friend_accept="+friend_accept,
				success: function(data){
					getAllMember(1);
					getMySendFriendList(1);
				}
			});
		}
		
		
			//<input type="hidden" name="page" value='1'/>

			//$('form[name=searchTextFriendList]') 하위 input name=page의 값을 함수 파라미터로 설정 
			//var page = $('form[name=searchTextFriendList]').
			//var pageSize = 10;
			
		// 전체 사용자 검색 부분 
		function getAllMemberSearch(page){
			
			$("#friendListPage").attr("value",page);
			var param = $('form[name=searchTextFriendList]').serialize();
			$.ajax({
				type: "POST",
				url : "/AllMemberListSearchAjax",
				data : param,
				success: function(data){
					
					var html = "";
					$.each(data.myMemberList,function(idx,mm){
						html += "<tr>";
						html += "	<td>"+ mm.rnum +"</td>";
						html += "	<td>"+ mm.member_mail +"</td>";
						html += "	<td>"+ mm.member_name +"</td>";
						html += "	<td>"+ "<input type='button' id ='myMemberListBtn' onclick ='getyouGiveNoAjax(\""+mm.member_mail+"\","+ mm.friend_accept +")'; value='친구 등록'/>"+"</td>";
						html += "</tr>";
					});
					
					$("#myMemberList").html("");
					$("#myMemberList").html(html);
					var i  = 1;
					var paging ="";
						paging +="<li><a href='javascript:getAllMemberSearch("+ i +");'aria-label='Previous'><span aria-hidden='true'>&laquo;</span>";
					for(var i= 1; i<= data.searchCnt; i++) {
						paging += "<li><a href='javascript:getAllMemberSearch("+ i +");'>"+ i + "</a></li>";
					}
						paging +="<li><a href='javascript:getAllMemberSearch("+ data.searchCnt +");'aria-label='Next'><span aria-hidden='true'>&raquo;</span>";
					$(".paginationMember").html(paging);
				},
				fail : function(xhr){
					console.log(xhr);
				}
			});
		}
		
	
		//###############################################################################################################################
		// 내가보낸 친구 요청 부분 
		function getMySendFriendList(page){
			var pageSize = 10;
			$.ajax({
				type: "GET",
				url : "/myFriendSendListAjax",
				data : {"page" : page, "pageSize":pageSize},
				success: function(data){
					
					var html = "";
					$.each(data.sendFriendList,function(idx,mm){
						html += "<tr>";
						html += "	<td>"+ mm.rnum +"</td>";
						html += "	<td>"+ mm.friend_code +"</td>";
						html += "	<td>"+ mm.friend_member +"</td>";
						html += "	<td>"+ mm.member_name +"</td>";
						html += "	<td>"+ "<input type='button' onclick ='deletemySendFriend("+mm.friend_code+");' value='요청 취소 '/>"+"</td>";
						html += "</tr>";
					});
					
					$("#sendFriendList").html("");
					$("#sendFriendList").html(html);
					
					var i  = 1;
					var paging ="";
						paging +="<li><a href='javascript:getMySendFriendList("+ i +");'aria-label='Previous'><span aria-hidden='true'>&laquo;</span>";
					for(var i= 1; i<= data.pageCnt; i++) {
						paging += "<li><a href='javascript:getMySendFriendList("+ i +");'>"+ i+ "</a></li>";
					}
						paging +="<li><a href='javascript:getMySendFriendList("+ data.pageCnt +");'aria-label='Next'><span aria-hidden='true'>&raquo;</span>";
					$(".paginationMySendFriends").html(paging);
				},
				fail : function(xhr){
					console.log(xhr);
				}
			});
		}
		
		// 요청 취소 버튼 클릭시 처리 
		function deletemySendFriend(friend_code){
			var pageSize = 10;
			$.ajax({
				type: "GET",
				url : "/deletemySendFriendAjax",
				data : "friend_code="+friend_code,
				success: function(data){
					getMySendFriendList(1);
					getAllMember(1);
				}
			});
		}
		
		// 내가 보낸 친구요청 검색 부분
		function getMySendFriendListSearch(page){
			
			$("#MySendFriendListPage").attr("value",page);
			var param = $('form[name=searchTextMySendFriendList]').serialize();
			$.ajax({
				type: "POST",
				url : "/myFriendSendListSearchAjax",
				data : param,
				success: function(data){
					
					var html = "";
					$.each(data.sendFriendList,function(idx,mm){
						html += "<tr>";
						html += "	<td>"+ mm.rnum +"</td>";
						html += "	<td>"+ mm.friend_code +"</td>";
						html += "	<td>"+ mm.friend_member +"</td>";
						html += "	<td>"+ mm.member_name +"</td>";
						html += "	<td>"+ "<input type='button' value='요청 취소 '/>"+"</td>";
						html += "</tr>";
					});
					
					$("#sendFriendList").html("");
					$("#sendFriendList").html(html);
					
					var i  = 1;
					var paging ="";
						paging +="<li><a href='javascript:getMySendFriendListSearch("+ i +");'aria-label='Previous'><span aria-hidden='true'>&laquo;</span>";
					for(var i= 1; i<= data.tatalCnt; i++) {
						paging += "<li><a href='javascript:getMySendFriendListSearch("+ i +");'>"+ i+ "</a></li>";
					}
						paging +="<li><a href='javascript:getMySendFriendListSearch("+ data.tatalCnt +");'aria-label='Next'><span aria-hidden='true'>&raquo;</span>";
					$(".paginationMySendFriends").html(paging);
				},
				fail : function(xhr){
					console.log(xhr);
				}
			});
		}
		//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		// 내가 받은 친구 요청 
		function getYouGiveFriendList(page){
			var pageSize = 10;
			$.ajax({
				type: "GET",
				url : "/youGiveFriendListAjax",
				data : {"page" : page, "pageSize":pageSize},
				success: function(data){
					
					var html = "";
					$.each(data.giveFriendList,function(idx,mm){
						html += "<tr>";
						html += "	<td>"+ mm.rnum +"</td>";
						html += "	<td>"+ mm.friend_code +"</td>";
						html += "	<td>"+ mm.friend_myemail +"</td>";
						html += "	<td>"+ mm.member_name +"</td>";
						html += "	<td>"+ "<input type='button'onclick ='getyouGiveYesAjax(\""+mm.friend_myemail+"\","+ mm.friend_code +");' value='수락'/>"+"</td>";
						html += "	<td>"+ "<input type='button'onclick ='getyouGiveXXXAjax("+mm.friend_code+");' value='거절'/>"+"</td>";
						html += "</tr>";
					});
					
					$("#giveFriendList").html("");
					$("#giveFriendList").html(html);
					
					var i  = 1;
					var paging ="";
						paging +="<li><a href='javascript:getYouGiveFriendList("+ i +");'aria-label='Previous'><span aria-hidden='true'>&laquo;</span>";
					for(var i= 1; i<= data.pageCnt; i++) {
						paging += "<li><a href='javascript:getYouGiveFriendList("+ i +");'>"+ i+ "</a></li>";
					}
						paging +="<li><a href='javascript:getYouGiveFriendList("+ data.pageCnt +");'aria-label='Next'><span aria-hidden='true'>&raquo;</span>";
					$(".paginationYouGiveFriends").html(paging);
				},
				fail : function(xhr){
					console.log(xhr);
				}
			});
		}
		
		// 수락버튼 클릭시 
		function getyouGiveYesAjax(friend_myemail,friend_code){
			var pageSize = 10;
			
			$.ajax({
				type: "GET",
				url : "/youGiveYesAjax",
				data : "friend_myemail="+friend_myemail+"&friend_code="+friend_code,
				success: function(data){
					getYouGiveFriendList(1);
					getMyFriends(1);
				}
			});
		}		
		
		
		// 거절버튼 클릭시 
		function getyouGiveXXXAjax(friend_code){
			var pageSize = 10;
			$.ajax({
				type: "GET",
				url : "/youGiveXXXAjax",
				data : "friend_code="+friend_code,
				success: function(data){
					getYouGiveFriendList(1);
				}
			});
		}		
		
		// 검색 부분 
		function getYouGiveFriendListSearch(page){
			$("#giveSearchPage").attr("value",page);
			var param = $('form[name=searchTextYouGiveFriendList]').serialize(); 
			$.ajax({
				type: "POST",
				url : "/youGiveFriendListSearchAjax",
				data : param,
				success: function(data){
					
					var html = "";
					$.each(data.giveFriendList,function(idx,mm){
						html += "<tr>";
						html += "	<td>"+ mm.rnum +"</td>";
						html += "	<td>"+ mm.friend_code +"</td>";
						html += "	<td>"+ mm.friend_myemail +"</td>";
						html += "	<td>"+ mm.member_name +"</td>";
						html += "	<td>"+ "<input type='button' value='수락'/>"+"</td>";
						html += "	<td>"+ "<input type='button' value='거절'/>"+"</td>";
						html += "</tr>";
					});
					
					$("#giveFriendList").html("");
					$("#giveFriendList").html(html);
					
					var i  = 1;
					var paging ="";
						paging +="<li><a href='javascript:getYouGiveFriendListSearch("+ i +");'aria-label='Previous'><span aria-hidden='true'>&laquo;</span>";
					for(var i= 1; i<= data.giveCnt; i++) {
						paging += "<li><a href='javascript:getYouGiveFriendListSearch("+ i +");'>"+ i+ "</a></li>";
					}
						paging +="<li><a href='javascript:getYouGiveFriendListSearch("+ data.giveCnt +");'aria-label='Next'><span aria-hidden='true'>&raquo;</span>";
					$(".paginationYouGiveFriends").html(paging);
				},
				fail : function(xhr){
					console.log(xhr);
				}
			});
		}
		
		//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

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