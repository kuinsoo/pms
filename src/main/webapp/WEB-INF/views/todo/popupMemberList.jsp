<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach items="${popupMemberList}" var="member">
	<tr>
		<td><input type="radio"></td>
		<td>${member.member_name}</td>
		<td>${member.pmember_member}</td>
	</tr>
</c:forEach>
