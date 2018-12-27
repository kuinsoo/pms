<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach items="${chatList}" var="chatVo"  varStatus="status">
	<tr>
		<td>${status.count}</td>
		<td>${chatVo.chat_writer}</td>
		<td>${chatVo.chat_content}</td>
		<td>${chatVo.format_chat_date}</td>
	</tr>
</c:forEach>


	