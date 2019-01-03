<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 알림 기능 -->
<div class="alarm dialog__triggers">
	<i class="icon-bell icons"></i>
	<div class="dialogs">
	    <div id="tabs">
	        <ul>
	            <li><a href="#tabs-1">이슈 알림</a></li>
	            <li><a href="#tabs-2">업무 알림</a></li>
	            <li><a href="#tabs-3">쪽지 알림</a></li>
	            <li><a href="#tabs-4">공지 알림</a></li>
	        </ul>
	        <div id="tabs-1">
	            <i class="icon-bell icons"></i>
	            <p>새 프로젝트 및 새 글이 등록되었을 때,<br>Push 메시지로 알려드려요!</p>
	        </div>
	        <div id="tabs-2">
	            <ul id="workMemberList">
	            	<%-- ajaxWorkAlarm jsp --%>
	            </ul>
	        </div>
	        <div id="tabs-3">
	            <ul id="messageMemberList">
	            	<%-- ajaxMessageAlarm jsp --%>
	            </ul>	            
	        </div>
	        <div id="tabs-4">
	            <ul id="noticeMemberList">
	            	<%-- ajaxNoticeAlarm jsp --%>
	            </ul>
	        </div>
	    </div>
	</div>
</div>

<script>
$(document).ready(function(){
	messageMemberList();
	workMemberList();
	noticeMemberList();
});

// 쪽지 알림 - 2019-01-02 임규승
function messageMemberList(){
	
	var listCntMessage = "${totalMsgReceived}";
	
	 $.ajax({
		  type: "GET",
		  url: "/ajaxMessageAlarm",
		  data: {"page" : 1, "pageSize" : 10},
		  success: function (data){
			  $("#messageMemberList").html();
			  $("#messageMemberList").html(data);
		  }
	   });
	
	(function messagePoll(){
		$.ajax({
		    type: "GET",
		    url: "/alarmMessage",
		    // data: {"page" : 1, "pageSize" : 10},
		    success: function (totalMsgReceived) {
		       
		       if(listCntMessage < totalMsgReceived){
		    	   
		    	   $.ajax({
		    		  type: "GET",
		    		  url: "/ajaxMessageAlarm",
		    		  data: {"page" : 1, "pageSize" : 10},
		    		  success: function (data){
		    			  $("#messageMemberList").html();
		    			  $("#messageMemberList").html(data);
		    		  }
		    	   });
		    	   
		    	   alert("쪽지가 도착했습니다!");
		       }
		       listCntMessage = totalMsgReceived;
		    },
		    error: function (data) {
			    // location.href = "/";
				// alert("error");
			},
		    timeout: 3000,
		    complete: setTimeout(function(){ messagePoll(); }, 6000)
		 })
	})();
	
};

// 업무 알림 - 2019-01-02 임규승
function workMemberList(){
	
	var listCntWork = ${workMemberTotalCnt};
	
	 $.ajax({
		  type: "GET",
		  url: "/ajaxWorkAlarm",
		  data: {"page" : 1, "pageSize" : 10},
		  success: function (data){
			  $("#workMemberList").html();
			  $("#workMemberList").html(data);
		  }
	   });
	
	(function workPoll(){
		$.ajax({
		    type: "GET",
		    url: "/alarmWork",
		    // data: {"page" : 1, "pageSize" : 10},
		    success: function (workMemberTotalCnt) {
		       
		       if(listCntWork < workMemberTotalCnt){
		    	   
		    	   $.ajax({
		    		  type: "GET",
		    		  url: "/ajaxWorkAlarm",
		    		  data: {"page" : 1, "pageSize" : 10},
		    		  success: function (data){
		    			  $("#workMemberList").html();
		    			  $("#workMemberList").html(data);
		    		  }
		    	   });
		    	   
		    	   alert("새로운 업무가 등록되었습니다!");
		       }
		       listCntWork = workMemberTotalCnt;
		    },
		    error: function (data) {
			    // location.href = "/";
				alert("error");
			},
		    timeout: 3000,
		    complete: setTimeout(function(){ workPoll(); }, 6000)
		 })
	})();
	
};

// 공지 알림 - 2019-01-02 임규승
function noticeMemberList(){	

	var listCnt = ${pageCnt};

	 $.ajax({
		  type: "GET",
		  url: "/ajaxNoticeAlarm",
		  data: {"page" : 1, "pageSize" : 10},
		  success: function (data){
			  $("#noticeMemberList").html();
			  $("#noticeMemberList").html(data);
		  }
	   });
	
	(function polls(){
		$.ajax({
		    type: "GET",
		    url: "/alarmNotice",
		    // data: {"page" : 1, "pageSize" : 10},
		    success: function (pageCnt) {
		       
		       if(listCnt < pageCnt){

					$.ajax({
						type: "GET",
						url: "/ajaxNoticeAlarm",
						data: {"page" : 1, "pageSize" : 10},
						success: function (data){
							$("#noticeMemberList").html();
							$("#noticeMemberList").html(data);
						}
					});

					alert("새로운 공지사항이 등록되었습니다!");
				}
		       listCnt = pageCnt;
		    },
		    error: function (data) {
			    location.href = "/";
				// alert("error");
			},
		    timeout: 3000,
		    complete: setTimeout(function(){ polls(); }, 6000)
		 })
	})();
	
};
</script>