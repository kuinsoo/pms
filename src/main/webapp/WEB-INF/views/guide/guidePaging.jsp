<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<li><i class="icon-arrow-left icons"></i></li>
<c:forEach begin="1" end="${guideMap.pageCnt}" var="i">
	<li><a href="javascript:guideList(${i});" >${i}</a></li>
</c:forEach>
<li><i class="icon-arrow-right icons"></i></li>