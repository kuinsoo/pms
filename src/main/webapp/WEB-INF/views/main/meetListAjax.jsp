<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:forEach items="${meetingList}" var="meetingVo"  varStatus="status">

	<tr class="meetMore${status.count} pFriInfo">
		<td class="count">${status.count}</td>
		<td class="meeting_title">${meetingVo.meeting_title}</td>
		<td class="meeting_overview">${meetingVo.meeting_overview}</td>
		<td class="member_name">${meetingVo.member_name}</td>
		<td class="format_meeting_sdate">${meetingVo.format_meeting_sdate}</td>
	</tr>
	<tr class="meetHidden${status.count} myPInfo" style="display:none">
		<td colspan="5">
			<table class="btnP" style="width:100%">
				<tr>
					<th colspan="3" >회의록  <button class="saveDocFile">다운로드</button>  </th>
					<th colspan="2" >대화록  <button class="saveChatFile">다운로드</button>  </th>
				</tr>
				<tr>
					<td class="saveDoc" colspan="3" style="padding:20px;font-size:7px;">
						${meetingVo.meeting_content}
						<c:if test="${meetingVo.meeting_content==null}">작성된 회의록이 없습니다..</c:if>
					</td>
					<td class="saveChat" id="chatList${status.count}" colspan="2" style="padding:20px;font-size:7px;">
						논의된 대화 내용이 없습니다..
					</td>	
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
		$('#chatList${status.count}').html("");
		$('#chatList${status.count}').html(data)
	}
});
//console.log("el : ${meetingVo.meeting_id}");

 $(".meetMore${status.count}").on("click",function(){
	 if ( $( ".meetHidden${status.count}" ).is( ":hidden" ) ) {
	    $( ".meetHidden${status.count}"  ).slideDown("slow");
	    $( ".meetHidden${status.count}"  ).css('background-color', '#e7e7e7');
	  } else {
	    $( ".meetHidden${status.count}"  ).slideUp();
	  }
 });
 //console.log("el : ${meetingVo.meeting_id}");
</script>
</c:forEach>
	