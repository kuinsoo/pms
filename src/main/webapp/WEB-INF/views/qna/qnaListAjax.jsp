<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach items="${postVoList}" var="postVo">
<tr>
	<td>
			<a href="/qnaDetail?post_id=${postVo.post_id}">
				${postVo.title} 
				<c:if test="${postVo.post_public=='n'}"> (비밀 글)</c:if>
			</a>
	</td>
	<td>${postVo.post_date}</td>
</tr>
</c:forEach>


<%-- <c:forEach items="${postVoList}" var="postVo">
<tr>
	<td>
		<c:choose>
			<when test="${(postVo.post_public=='n')||(memberVo.member_mail!='admin@admin.com')}">
				${postVo.title} (비밀 글)
			</when>
			<when test="${(postVo.post_public=='n')||(memberVo.member_mail='admin@admin.com')}">
				<a href="/qnaDetail?post_id=${postVo.post_id}">
					${postVo.title} (비밀 글)
				</a>
			</when>
			<otherwise>
				${postVo.title} 
			</otherwise>
		</c:choose>
	</td>
	<td>${postVo.post_date}</td>
</tr>
</c:forEach> --%>
				