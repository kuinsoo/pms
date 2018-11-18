<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>test2 입니다.</h3>
	<table>
		<tr>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
		</tr>
		<c:forEach items="${listAllMember}" var="member">
		<tr>
			<th>${member.mem_id}</th>
			<th>${member.mem_pass}</th>
			<th>${member.mem_name}</th>
		</tr>
		</c:forEach>
	</table>
</body>
</html>