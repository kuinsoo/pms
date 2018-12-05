<%--
  Created by IntelliJ IDEA.
  User: Mr.KKu
  Date: 2018-11-27
  Time: 오후 6:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>main</title>
</head>
<body>
    <form action="/createProject" method="post">
        프로젝트명            : <input type="text"   name="project_title">  <br />
        프로젝트개요          : <input type="text"   name="project_overview">  <br />
        프로젝트시작일자	      : <input type="date"  name="project_sdate">   <br/>
        프로젝트종료일자	      : <input type="date"  name="project_edate">  <br/>
        <input  type="submit" value="등록" />
    </form>
</div>
</body>
</html>
