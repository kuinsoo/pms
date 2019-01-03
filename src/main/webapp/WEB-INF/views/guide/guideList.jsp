<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:forEach items="${guideMap.guideList}" var="guide">
	<tr>
		<td>${guide.labelrn}</td>
		<td><a href="/guideView?post_id=${guide.post_id}">${guide.post_title}</a></td>
		<td>
			<fmt:formatDate value="${guide.post_date}" pattern="yyyy-MM-dd" />
		</td>
	</tr>
</c:forEach>