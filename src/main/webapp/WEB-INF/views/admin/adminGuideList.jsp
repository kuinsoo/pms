<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:forEach items="${adminMapGuide.adminGuideList}" var="adminGuide">
	<tr>
		<td>${adminGuide.labelrn}</td>
		<td><a href="/adminGuideUpdateView?post_id=${adminGuide.post_id}">${adminGuide.post_title}</a></td>
		<td>
			<fmt:formatDate value="${adminGuide.post_date}" pattern="yyyy-MM-dd" />
		</td>
	</tr>
</c:forEach>