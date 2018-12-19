<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="projectTeams">
    <h2>전체 참여자 ${projectMemberList.size()}명 <i class="icon-plus icons"></i></h2>
    <ul>
        <c:forEach items="${projectMemberList}" var="projectMember" varStatus="i">
            <c:if test="${projectMember.pmember_position eq '1'}">
                <li>
                    <span class="projectPositionName">프로젝트 관리자</span>
                    <div class="chatList">
                        <img src="${projectMember.member_profile}">
                        <span class="projectUserNameList">${projectMember.member_name}</span>
                    </div>
                    <div class="projectTeamHover">
                    	<a href="/evaluation">
	                    	<i class="icon-badge icons"></i>
	                    	<span>능력 및 평가</span>
                    	</a>
                    	<a href="/message">
	                    	<i class="icon-paper-plane icons"></i>
	                    	<span>쪽지 보내기</span>
                    	</a>
                    	<a href="/message#tabs2-4">
	                    	<i class="icon-user-follow icons"></i>
	                    	<span>친구 리스트</span>
                    	</a>
                    </div>
                </li>
            </c:if>
            <c:if test="${projectMember.pmember_position eq '2'}">
                <li>
                    <span class="projectPositionName">참여자</span>
                    <div class="chatList">
                        <img src="${projectMember.member_profile}">
                        <span class="projectUserNameList">${projectMember.member_name}</span>
                    </div>
                    <div class="projectTeamHover">
                    	<a href="/evaluation">
	                    	<i class="icon-badge icons"></i>
	                    	<span>능력 및 평가</span>
                    	</a>
                    	<a href="/message">
	                    	<i class="icon-paper-plane icons"></i>
	                    	<span>쪽지 보내기</span>
                    	</a>
                    	<a href="/message#tabs2-4">
	                    	<i class="icon-user-follow icons"></i>
	                    	<span>친구 리스트</span>
                    	</a>
                    </div>
                </li>
            </c:if>
        </c:forEach>
    </ul>
</div>