<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach items="${workMap.workMemberList}" var="workMember" varStatus="i">
	 <li>
	     <i class="icon-star icons"></i>
	     <span class="colorRed">${workMember.work_title}</span>가 등록 되었습니다!
	 </li>
</c:forEach>