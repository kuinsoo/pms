<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<li><i class="icon-arrow-left icons"></i></li>
<c:forEach begin="1" end="${noticeMap.pageCnt}" var="i">
	<li><a href="javascript:noticeList(${i});" >${i}</a></li>
</c:forEach>
<li><i class="icon-arrow-right icons"></i></li>