<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach items="${postVoList}" var="postVo">
<tr>
	<td>
			 <c:choose>
			 	<%--비밀글이면서 관라자인 경우 : 링크 생성 --%>
			 	<c:when test="${postVo.post_public == 'n' && memberVo.member_mail == 'admin@admin.com'}">
			 		<a href='qnaReply/?board_id=${postVo.board_id}&post_hierarchy=${postVo.post_id}'> ${postVo.title} </a>
			 	</c:when>
			 	
			 	<%--비밀글이면서 본인인 경우 : 링크 생성 --%>
			 	<c:when test="${postVo.post_public == 'n' && memberVo.member_mail == postVo.post_writer}">
			 		<a href='qnaReply/?board_id=${postVo.board_id}&post_hierarchy=${postVo.post_id}'> ${postVo.title} </a>
			 	</c:when>
			 	
			 	<%--비밀글이면서 관라자가 아닌 경우 : 링크 생성 --%>
		 		<c:when test="${postVo.post_public == 'n' && memberVo.member_mail != 'admin@admin.com'}">
			 		<span>${postVo.title} </span>
			 	</c:when>
			 	
			 	<%--비밀글이 아닌경우 --%>
			 	<c:when test="${postVo.post_public == 'y'}">
			 		<a href='qnaReply/?board_id=${postVo.board_id}&post_hierarchy=${postVo.post_id}'> ${postVo.title} </a>
			 	</c:when>
			</c:choose>
			 
			<c:if test="${postVo.post_public=='n'}"> [비밀 글] </c:if>
	</td>
	<td>
		${memberVo.member_name}
	</td>
	<td>
		${postVo.post_date}
	</td>
</tr>
</c:forEach>
<script>
	$("#secretLink").click(function(){
		$(location).attr('href','qnaReply/?board_id=${postVo.board_id}&post_hierarchy=${postVo.post_id}');
	});
</script>
				