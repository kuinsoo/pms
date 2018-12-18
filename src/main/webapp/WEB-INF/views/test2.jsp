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
	<form action="/testFileUpload" method="POST" enctype="multipart/form-data" >
		<input type="file" multiple="multiple" name="files" value="파일첨부1" />
		<input type="file" multiple="multiple" name="files" value="파일첨부2" />
		<input type="file" multiple="multiple" name="files" value="파일첨부3" />
		<input type="submit" value="전송" />
	</form>
</body>
</html>