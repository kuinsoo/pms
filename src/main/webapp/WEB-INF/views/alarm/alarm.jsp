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
	            	<%-- ajaxAlarm jsp --%>
	            </ul>
	        </div>
	        <div id="tabs-3">
	            <i class="icon-bell icons"></i>
	            <p>새 프로젝트 및 새 글이 등록되었을 때,<br>Push 메시지로 알려드려요!</p>
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
	workMemberList();
	noticeMemberList();
});

function workMemberList(){
	
	(function poll(){
		$.ajax({
		    type: "GET",
		    url: "/ajaxAlarm",
		    // data: {"member_mail" : '${memberVo.member_mail}'},
		    success: function (data) {
		       $('#workMemberList').html("");
		       $('#workMemberList').html(data);
		    },
		    error: function (data) {
				alert("error");
			},
		    timeout: 3000,
		    complete: setTimeout(function(){ poll(); }, 6000)
		 })
	})();
	
};

function noticeMemberList(){
	
	(function polls(){
		$.ajax({
		    type: "GET",
		    url: "/ajaxNoticeAlarm",
		    data: {"page" : 1, "pageSize" : 10},
		    success: function (data) {
		       $('#noticeMemberList').html("");
		       $('#noticeMemberList').html(data);
		    },
		    error: function (data) {
				alert("error");
			},
		    timeout: 3000,
		    complete: setTimeout(function(){ polls(); }, 6000)
		 })
	})();
	
};
</script>