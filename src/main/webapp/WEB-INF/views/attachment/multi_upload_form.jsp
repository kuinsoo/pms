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
<h1> Multiple File Upload </h1>
<form method="post" enctype="multipart/form-data" action="/multi_upload?work_id=1">
	Upload File 1: <input type="file" name="file" /> <br/>
	Upload File 2: <input type="file" name="file" /> <br/>
	Upload File 3: <input type="file" name="file" /> <br/>
	Upload File 4: <input type="file" name="file" /> <br/>
	<br /><br /><input type="submit" value="Upload" />
</form>

<a href="/download?att_id=21"> 파일다운로드</a>
</body>
</html>
