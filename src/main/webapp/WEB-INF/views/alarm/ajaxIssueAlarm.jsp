<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach items="${issueMap.issueMemberList}" var="issueMember" varStatus="i">
	 <li>
	     <i class="icon-star icons"></i>
	     <span class="colorRed">${issueMember.issue_title}</span>이(가) 발생하였습니다!
	 </li>
</c:forEach>