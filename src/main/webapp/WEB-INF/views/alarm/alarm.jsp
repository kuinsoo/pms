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
	            <li><a href="#tabs-5">친구 알림</a></li>
	        </ul>
	        <div id="tabs-1">
	            <ul id="issueMemberList">
	            	<%-- ajaxIssueAlarm jsp --%>
	            </ul>
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
	        <div id="tabs-5">
	            <ul id="friendMemberList">
	            	<%-- ajaxFriendAlarm jsp --%>
	            </ul>
	        </div>
	    </div>
	</div>
</div>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
$(document).ready(function(){
	issueMemberList();
	messageMemberList();
	workMemberList();
	noticeMemberList();
	friendMemberList();
});

//이슈 알림 - 2019-01-04 임규승
function issueMemberList(){
	
	var listCntIssue = ${issueMemberTotalCnt};
	
	 $.ajax({
		  type: "GET",
		  url: "/ajaxIssueAlarm",
		  data: {"page" : 1, "pageSize" : 10},
		  success: function (data){
			  $("#issueMemberList").html();
			  $("#issueMemberList").html(data);
		  }
	   });
	
	(function issuePoll(){
		$.ajax({
		    type: "GET",
		    url: "/alarmIssue",
		    // data: {"page" : 1, "pageSize" : 10},
		    success: function (issueMemberTotalCnt) {
		       
		       if(listCntIssue < issueMemberTotalCnt){
		    	   
		    	   $.ajax({
		    		  type: "GET",
		    		  url: "/ajaxIssueAlarm",
		    		  data: {"page" : 1, "pageSize" : 10},
		    		  success: function (data){
		    			  $("#issueMemberList").html();
		    			  $("#issueMemberList").html(data);
		    		  }
		    	   });
		    	   
		    	   alert("이슈가 발생하였습니다!");
		       }
		       listCntIssue = issueMemberTotalCnt;
		    },
		    error: function (data) {
			    // location.href = "/";
				// alert("error");
			},
		    timeout: 3000,
		    complete: setTimeout(function(){ issuePoll(); }, 6000)
		 })
	})();
	
};

// 쪽지 알림 - 2019-01-02 임규승
function messageMemberList(){
	
	var listCntMessage = ${totalMsgReceived};
	
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

//친구 알림 - 2019-01-07 임규승
function friendMemberList(){
	
	var listCntFriend = ${totalyouGiveFriendList};
	
	 $.ajax({
		  type: "GET",
		  url: "/ajaxFriendAlarm",
		  data: {"page" : 1, "pageSize" : 10},
		  success: function (data){
			  $("#friendMemberList").html();
			  $("#friendMemberList").html(data);
		  }
	   });
	
	(function friendAlarmPoll(){
		$.ajax({
		    type: "GET",
		    url: "/alarmFriend",
		    // data: {"page" : 1, "pageSize" : 10},
		    success: function (totalyouGiveFriendList) {
		       
		       if(listCntFriend < totalyouGiveFriendList){
		    	   
		    	   $.ajax({
		    		  type: "GET",
		    		  url: "/ajaxFriendAlarm",
		    		  data: {"page" : 1, "pageSize" : 10},
		    		  success: function (data){
		    			  $("#friendMemberList").html();
		    			  $("#friendMemberList").html(data);
		    		  }
		    	   });
		    	   
		    	   alert("친구 요청이 왔습니다!");
		       }
		       listCntFriend = totalyouGiveFriendList;
		    },
		    error: function (data) {
			    // location.href = "/";
				// alert("error");
			},
		    timeout: 3000,
		    complete: setTimeout(function(){ friendAlarmPoll(); }, 6000)
		 })
	})();
	
};
</script>