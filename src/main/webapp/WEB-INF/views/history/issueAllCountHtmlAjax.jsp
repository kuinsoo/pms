<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach items="${myProjectList.pjtAllIssueHistory}" var="issueCnt">
	<c:choose>
		<c:when test="${history.project_id == issueCnt.project_id}">
			
		</c:when>
	</c:choose>
</c:forEach>

