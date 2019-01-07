<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach items="${friendMap.friendMemberList}" var="friendMember" varStatus="i">
	 <li>
	     <i class="icon-star icons"></i>
	     <span class="colorRed">${friendMember.friend_myemail}</span>님이 친구요청을 하였습니다!
	 </li>
</c:forEach>