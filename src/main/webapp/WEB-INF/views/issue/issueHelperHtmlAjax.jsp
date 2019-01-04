<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach items="${helperList}" var="helper">
	<c:if test="${helper.issue_helper != null && helper.issue_helper != ''}">
		<tr>
			<td>${helper.issue_helper}</td>
			<td>${helper.format_issue_edate}</td>
			<td>${helper.issue_solution}</td>
		</tr>
	</c:if>
</c:forEach>
