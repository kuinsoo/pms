<%--
  Created by IntelliJ IDEA.
  User: Mr.KKu
  Date: 2018-11-27
  Time: 오후 8:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>projectList</title>
</head>
<body>
<p>${test}</p>
<table>

    <c:forEach items="${projectList}" var="projectVo">
        <tr>
            <td> ${projectVo.project_title}</td>
            <td> ${projectVo.project_overview}</td>
            <td> ${projectVo.project_bookmark}</td>
            <td> <fmt:formatDate value="${projectVo.project_sdate}" pattern="yyyy-MM-dd" /></td>
            <td> <fmt:formatDate value="${projectVo.project_edate}" pattern="yyyy-MM-dd" /></td>
            <td> <fmt:formatDate value="${projectVo.project_eedate}" pattern="yyyy-MM-dd" /></td>
        </tr>
    </c:forEach>

</table>
</body>
</html>
