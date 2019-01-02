<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
<c:forEach items="${myProjectList.percentList}" var="percent" varStatus="status">
	console.log("Ajax_" + ${percent} + "%");
	if(${percent} > 0 && ${percent} <= 100){
		$("#myBar${myProjectList.history_myProjectList[status.index].rnum}").width("${percent}%");
	}else if(${percent} < 0){
		$("#myBar${myProjectList.history_myProjectList[status.index].rnum}").width('0%');
	}else if(${percent} > 100){
		$("#myBar${myProjectList.history_myProjectList[status.index].rnum}").width('100%');
	}
</c:forEach>
</script>
<c:forEach items="${myProjectList.history_myProjectList}" var="history">
	<span>${history.project_title}(${history.project_id})</span>
	<div id="myProgress">
		<div class="issueStick" id="issueStick">
			<!-- issueAllCountHtmlAjax.jsp -->
		</div>
		<div class="myBar" id="myBar${history.rnum}"></div>
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
