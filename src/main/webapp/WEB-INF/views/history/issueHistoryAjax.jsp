<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
<c:forEach items="${percentList}" var="percent" varStatus="status">
	console.log('${percent}');
	if(${percent} > 0 && ${percent} <= 100){
		$("#myBar${status.index}").width("${percent}%");
	}else{
		$("#myBar${status.index}").width('100%');
	}
</c:forEach>
</script>
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
