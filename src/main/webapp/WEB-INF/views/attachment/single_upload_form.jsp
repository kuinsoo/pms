<%--
  Created by IntelliJ IDEA.
  User: Mr.KKu
  Date: 2018-12-19
  Time: 오전 10:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>${message}</title>
</head>
<body>
<form method="post" enctype="multipart/form-data" action="/single_upload">
    Upload File : <input type="file" name="file" /> <br/>
    Name: <input type="text" name="name" /> <br/>
    <br /><br /><input type="submit" value="Upload" />
</form>
</div>



</body>
</html>