<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="utf-8">
<title></title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"
	charset="utf-8"></script>
<script type="text/javascript">
	$(document).ready(function(){
		<c:forEach items="${percentList}" var="percent" varStatus="status">
			console.log('${percent}');
			$("#myBar${status.index}").width("${percent}%");
		</c:forEach>
	});
</script>
<style media="screen">
.container{
	width: 800px;
	height: auto;
	margin: 0 auto;
}

#myProgress {
	width: 100%;
	background-color: grey;
}

.myBar {
	width: 10px;
	height: 30px;
	background-color: green;
}
</style>
</head>
<body>
	<div class="container">
		<c:forEach items="${history_myProjectList}" var="history" varStatus="status" >
			<span>${history.project_title}(${history.project_id})</span>
			<div id="myProgress">
				<div class="myBar" id="myBar${status.index}"></div>
			</div>
			<span class="sdate">sdate : ${history.format_project_sdate}</span>
			<c:choose>
				<c:when test="${history.project_edate != null}">
					<span class="edate">edate : ${history.format_project_edate}</span>
				</c:when>
				<c:otherwise>
					<span class="edate">eedate : ${history.format_project_eedate}</span>
				</c:otherwise>
			</c:choose><br>
		</c:forEach>
	</div>
</body>
</html>
