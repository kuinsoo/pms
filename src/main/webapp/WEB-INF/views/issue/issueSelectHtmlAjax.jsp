<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach items="${issueList}" var="issue">
	<tr>
		<td><input type="radio" id="issueUpdatePick${issue.todo_id}" name="issuePick" onclick="setIssueUpdate${issue.issue_work}(${issue.todo_id}, ${issue.issue_id});"></td>
		<td id="issue_title${issue.issue_id}">${issue.issue_title}</td>
		<td id="issue_level${issue.issue_id}">${issue.issue_level}</td>
		<td>${issue.issue_member}</td>
		<td>${issue.format_issue_sdate}</td>
		<td id="issue_content${issue.issue_id}">${issue.issue_content}</td>
	</tr>
</c:forEach>
