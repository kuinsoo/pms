<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach items="${postVoList}" var="postVo">
<tr>
	<td><a href="/qnaDetail?post_id=${postVo.post_id}">${postVo.post_content}</a></td>
	<td>${postVo.post_date}</td>
</tr>
</c:forEach>