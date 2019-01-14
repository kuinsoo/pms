<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:forEach items="${postVoList}" var="postVo">
<tr>
	<td>
			 <c:choose>
			 	<%--비밀글이면서 관리자인 경우 : 링크 생성 --%>
			 	<c:when test="${postVo.post_public == 'n' && memberVo.member_mail == 'admin@admin.com'}">
			 		<a href='/qnaDetail?post_id=${postVo.post_id}'> ${postVo.title}</a>
			 	</c:when>
			 	
			 	<%--비밀글이면서 본인인 경우 : 링크 생성 --%>
			 	<c:when test="${postVo.post_public == 'n' && memberVo.member_mail == postVo.post_writer}">
			 		<a href='/qnaDetail?post_id=${postVo.post_id}'> ${postVo.title}</a>
			 	</c:when>
			 	
			 	<%--비밀글이면서 관라자가 아닌 경우 : 링크 생성 --%>
		 		<c:when test="${postVo.post_public == 'n' && memberVo.member_mail != 'admin@admin.com'}">
			 		<a href='#' class='alert'> ${postVo.title} </a>
			 	</c:when>
			 	
			 	<%--비밀글이 아닌경우 --%>
			 	<c:when test="${postVo.post_public == 'y'}">
			 		<a href='/qnaDetail?post_id=${postVo.post_id}'> ${postVo.title} </a>
			 	</c:when>

			</c:choose>
			 
			<c:if test="${postVo.post_public=='n'}"> [비밀 글] </c:if>
	</td>
	<td>
		${postVo.post_writer}
	</td>
	<td>			
		<fmt:formatDate value="${postVo.post_date}" pattern="yyyy-MM-dd" />
	</td>
</tr>
</c:forEach>

<script>
$(".alert").on("click", function(){
	alert("비밀글은 본인만 확인할 수 있습니다 ");
});
</script>
				