<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach items="${issueList}" var="issue">
	<tr>
		<td>${issue.issue_title}</td>
		<td>${issue.issue_level}</td>
		<td>${issue.issue_member}</td>
		<td>${issue.format_issue_sdate}</td>
		<td>${issue.issue_content}</td>
	</tr>
</c:forEach>
