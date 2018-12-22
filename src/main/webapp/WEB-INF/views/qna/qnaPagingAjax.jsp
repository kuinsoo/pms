<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<ul>
	<li>
		<c:choose>
			<c:when test="${pageNum > 1}">
				<a href="javascript:getQnaListAjax(${postPageVo.pageNum-1}, '${postPageVo.board_id}');"
					aria-label="Previous"><span aria-hidden="true">&lt;</span></a>
			</c:when>
			<c:otherwise>
				<a href="javascript:getQnaListAjax(1, '${postPageVo.board_id}');"
					aria-label="Previous" id="disabled"><span aria-hidden="true">&lt;</span></a>
			</c:otherwise>
		</c:choose>
	</li>
		
	<c:forEach begin="1" end="${postListCnt}" var="i">	
		<li><a id="todoPagination" href="javascript:getQnaListAjax(${i}, '${postPageVo.board_id}');">${i}</a></li>
	</c:forEach>
		
	<li>
		<c:choose>
			<c:when test="${pageNum eq todoCnt}">
				<a href="javascript:getQnaListAjax(${postListCnt}, '${postPageVo.board_id}');"
					aria-label="Next" id="disabled"><span aria-hidden="true">&gt;</span></a>
			</c:when>
			<c:otherwise>
				<a href="javascript:getQnaListAjax}(${postPageVo.pageNum+1}, '${postPageVo.board_id}');"
					aria-label="Next"><span aria-hidden="true">&gt;</span></a>
			</c:otherwise>
		</c:choose>
	</li>
</ul>

