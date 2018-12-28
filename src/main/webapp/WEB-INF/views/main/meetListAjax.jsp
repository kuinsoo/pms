<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:forEach items="${meetingList}" var="meetingVo"  varStatus="status">

	<tr class="meetMore${status.count}">
		<td>${status.count}</td>
		<td>${meetingVo.meeting_title}</td>
		<td>${meetingVo.meeting_overview}</td>
		<td>${meetingVo.member_name}</td>
		<td>${meetingVo.format_meeting_sdate}</td>
	</tr>
	<tr class="meetHidden${status.count}" style="display: none;">
		<td colspan="5">
			<table style="width:100%">
				<tr>
					<th rowspan="2" class="meetHiddenClose${status.count}">접<br/>기</th>
					<th colspan="3" >회의록  </th>
					<th>대화록  </th>
				</tr>
				<tr>
					<td colspan="3" style="padding:20px;font-size:7px;">
						${meetingVo.meeting_content}
						<c:if test="${meetingVo.meeting_content==null}">작성된 회의록이 없습니다..</c:if>
					</td>
					<td class="chatList${status.count}" style="padding:20px;font-size:7px;">논의된 대화 내용이 없습니다..</td>	
				</tr>
			</table>
		</td>
	</tr>

<script>
$.ajax({
	url:'/chatListAjax',
	type:'POST',
	data:{'meeting_id':'${meetingVo.meeting_id}'},
	success:function(data){
		$('.chatList${status.count}').html("");
		$('.chatList${status.count}').html(data)
	}
});

 $(".meetMore${status.count}").on("click",function(){
	 if ( $( ".meetHidden${status.count}" ).is( ":hidden" ) ) {
	    $( ".meetHidden${status.count}"  ).slideDown("slow");
	    $( ".meetHidden${status.count}"  ).css('background-color', '#e7e7e7');
	  } else {
	    $( ".meetHidden${status.count}"  ).slideUp();
	  }
 });

</script>
</c:forEach>
	