<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach items="${meetingList}" var="meetingVo"  varStatus="status">
	<tr>
		<th rowspan="3">${status.count}</th>
		<td>${meetingVo.meeting_title}</td>
		<td>${meetingVo.meeting_overview}</td>
		<td>${meetingVo.member_name}</td>
		<td>${meetingVo.format_meeting_sdate}</td>
	</tr>
	<tr>
		<th colspan="3" >회의록  </th>
		<th>대화록  </th>
	</tr>
	<tr>
		<td colspan="3" style="background-color: #e7e7e7; font-size:7px;">
			${meetingVo.meeting_content}
			<c:if test="${meetingVo.meeting_content==null}">작성된 회의록이 없습니다..</c:if>
		</td>
		<td style="background-color: #eeeeee; font-size:7px;">논의된 대화 내용이 없습니다..</td>	
	</tr>
</c:forEach>

<script>
$('.click_doc').on('click', function(){
	$.ajax({
		url:'/meetDocAjax',
		type:'post',
		data:'meetDoc':'meetDoc',
		success:function(data){
			$('#docList').html("");
			$('#docList').html(data);
		}
	});
});

$('.click_chat').on('click', function(){
	$.ajax({
		url:'/chatListAjax',
		type:'post',
		data:'chat_id':'chat_id',
		success:function(data){
			$('#chatList').html("");
			$('#chatList').html(data);
		}
	});
});
</script>
	