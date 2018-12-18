<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 알림 기능 -->
<div class="alarm dialog__triggers">
    <i class="icon-bell icons"></i>
    <div class="dialogs">
        <div id="tabs">
            <ul>
                <li><a href="#tabs-1">미확인 알림</a></li>
                <li><a href="#tabs-2">전체 알림</a></li>
            </ul>
            <div id="tabs-1">
                <i class="icon-bell icons"></i>
                <p>새 프로젝트 및 새 글이 등록되었을 때,<br>Push 메시지로 알려드려요!</p>
            </div>
            <div id="tabs-2">
                <ul>
            		<c:forEach items="${workList}" var="work" varStatus="i">
                     <li>
                         <i class="icon-star icons"></i>
                         <span class="colorRed">${work.work_title}</span>가 등록 되었습니다!</span>
                     </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
</div>