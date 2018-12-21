<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<ul>
	<li>
		<c:choose>
			<%-- to-do list에 값이 없을 땐 꺽새 미출력 --%>
			<c:when test="${todoCnt == 0}"></c:when>
			<c:when test="${page > 1}">
				<a href="javascript:getToDoList${work_id}(${pageVo.page - 1}, ${project_id}, ${work_id});"
					aria-label="Previous"><span aria-hidden="true">&lt;</span></a>
			</c:when>
			<c:otherwise>
				<a href="javascript:getToDoList${work_id}(1, ${project_id}, ${work_id});"
					aria-label="Previous" id="disabled"><span aria-hidden="true">&lt;</span></a>
			</c:otherwise>
		</c:choose>
	</li>
	
	<c:choose>
		<c:when test="${todoCnt >= 1}">
			<c:forEach begin="1" end="${todoCnt}" var="i">
						<li><a id="todoPagination" href="javascript:getToDoList${work_id}(${i}, ${project_id}, ${work_id});">${i}</a></li>
			</c:forEach>
		</c:when>
		<c:otherwise>
				등록된 TODO가 없습니다.
		</c:otherwise>
	</c:choose>
		
	<li>
		<c:choose>
			<%-- to-do list에 값이 없을 땐 꺽새 미출력 --%>
			<c:when test="${todoCnt == 0}"></c:when>
			<c:when test="${page eq todoCnt}">
				<a href="javascript:getToDoList${work_id}(${todoCnt}, ${project_id}, ${work_id});"
					aria-label="Next" id="disabled"><span aria-hidden="true">&gt;</span></a>
			</c:when>
			<c:otherwise>
				<a href="javascript:getToDoList${work_id}(${pageVo.page+1}, ${project_id}, ${work_id});"
					aria-label="Next"><span aria-hidden="true">&gt;</span></a>
			</c:otherwise>
		</c:choose>
	</li>
</ul>