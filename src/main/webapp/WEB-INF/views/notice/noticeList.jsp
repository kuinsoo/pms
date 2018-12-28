<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:forEach items="${noticeMap.noticeList}" var="notice">
	<tr>
		<td>${notice.labelrn}</td>
		<td><a href="/noticeView?post_id=${notice.post_id}">${notice.post_title}</a></td>
		<td>
			<fmt:formatDate value="${notice.post_date}" pattern="yyyy-MM-dd" />
		</td>
	</tr>
</c:forEach>