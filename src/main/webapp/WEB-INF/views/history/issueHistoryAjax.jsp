<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="../css/issue.css" />
<script>
<%-- 프로젝트 총 기간 퍼센트 --%>
<c:forEach items="${myProjectList.percentList}" var="percent" varStatus="status">
	console.log("Ajax_" + ${percent} + "%");
	if(${percent} > 0 && ${percent} <= 100){
		$("#myBar${myProjectList.history_myProjectList[status.index].rnum}").width("${percent}%");
		$('#percent${myProjectList.history_myProjectList[status.index].rnum}').html(${percent}+'%');
	}else if(${percent} < 0){
		$("#myBar${myProjectList.history_myProjectList[status.index].rnum}").width('0%');
		$('#percent${myProjectList.history_myProjectList[status.index].rnum}').html('0%');
	}else if(${percent} > 100){
		$("#myBar${myProjectList.history_myProjectList[status.index].rnum}").width('100%');
		$('#percent${myProjectList.history_myProjectList[status.index].rnum}').html('100%');
	}
</c:forEach>

<%-- 이슈발생일자 위치 --%>
<c:forEach items="${myProjectList.issueSdateList}" var="issueSdate" varStatus="status">
	$("#pin${myProjectList.pjtAllIssueHistory[status.index].rnum}").css("left", '${issueSdate}%');
</c:forEach>
</script>
<style>
.historyPercent{
	float: right;
}
</style>
<c:forEach items="${myProjectList.history_myProjectList}" var="history">
	<span>${history.project_title}</span>
	<div id="myProgress">
		<div class="issuePin" id="issuePin">
			<!-- issueAllCountHtmlAjax.jsp -->
			<c:forEach items="${myProjectList.pjtAllIssueHistory}" var="issueCnt">
				<c:choose>
					<c:when test="${history.project_id eq issueCnt.project_id}">
						<div class="pin" id="pin${issueCnt.rnum}">
							<i class="fas fa-map-pin" id="issuePin${issueCnt.rnum}" style="position: relative; cursor: pointer;"></i>
							<div class="fa-map-pin-hover">
								이슈 제목 : ${issueCnt.issue_title}<br>
								이슈 발생일 : ${issueCnt.format_issue_sdate}<br>
							</div>
						</div>
					</c:when>
				</c:choose>
			</c:forEach>
		</div>
		<div class="myBar" id="myBar${history.rnum}"></div>
	</div>
	<c:choose>
		<c:when test="${history.project_edate != null && history.project_edate != ''}">
			<span>프로젝트 시작일 : ${history.format_project_sdate} / 종료일 : ${history.format_project_edate}</span><br>
		</c:when>
		<c:otherwise>
			<span>프로젝트 시작일 : ${history.format_project_sdate} / 종료일 : ${history.format_project_eedate}</span><br>
		</c:otherwise>
	</c:choose><br>
	<span class="historyPercent" id="percent${history.rnum}"></span><br>
</c:forEach>
