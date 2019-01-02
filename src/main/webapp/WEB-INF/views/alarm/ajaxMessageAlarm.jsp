<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach items="${messageMap.messageMemberList}" var="messageMember" varStatus="i">
	 <li>
	     <i class="icon-star icons"></i>
	     <span class="colorRed">${messageMember.msg_smember}</span>님이 쪽지를 보냈습니다!
	 </li>
</c:forEach>