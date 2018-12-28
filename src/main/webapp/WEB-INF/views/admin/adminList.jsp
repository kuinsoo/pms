<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:forEach items="${adminMap.adminList}" var="admin">
	<tr>
		<td>${admin.labelrn}</td>
		<td>${admin.post_title}</td>
		<td>
			<fmt:formatDate value="${admin.post_date}" pattern="yyyy-MM-dd" />
		</td>
	</tr>
</c:forEach>