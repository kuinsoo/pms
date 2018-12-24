<%--
  Created by IntelliJ IDEA.
  User: Mr.KKu
  Date: 2018-12-22
  Time: 오후 2:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 프로젝트 처리 --%>
<c:forEach items="${pMemberList}" var="pMemberListVo" varStatus="i">
    <li class="bookmarkProject">
        <div class="projectCard" >
            <div class="projectCardTitle" >
                <c:choose >
                    <c:when test="${pMemberListVo.pmember_bookmark eq 'N'}">
                        <i class="icon-star icons" onclick="bookmark('${pMemberListVo.project_id}');"></i>
                    </c:when>
                    <c:when test="${pMemberListVo.pmember_bookmark eq 'Y'}">
                        <i class="icon-star icons"  style="color:yellow;font-weight:bold;" onclick="bookmark('${pMemberListVo.project_id}');"></i>
                    </c:when>
                </c:choose>
                <form id="pageSubMain${pMemberListVo.project_id}" action="/subMain" method="post">
                    <input type="hidden" name="project_id" value="${pMemberListVo.project_id}" />
                </form>
                <a onclick="pageSub('${pMemberListVo.project_id}');" class="ajaxProjectTitle" > ${pMemberListVo.project_title} </a>
                    <%--  <a href="/subMain?project_id=${pMemberListVo.project_id}" class="ajaxProjectTitle"> ${pMemberListVo.project_title}</a>
            <a href='#' onclick="javascript:page_move('/subMain','${pMemberListVo.project_id}')" class="ajaxProjectTitle" >${pMemberListVo.project_title}</a>--%>
    <c:if test="${pMemberListVo.pmember_position eq '1'}">
        <a href="#open${pMemberListVo.project_id}" class="settingsA"><i class="icon-settings icons"></i></a>
        <div class="white_content" id="open${pMemberListVo.project_id}">
            <div>
            	<div class="projectUDTitle">
            		<h2>프로젝트 수정 & 삭제</h2>
            		<a href="#close" class="mainCloseBtns">
	                    <i class="icon-close icons"></i>
	                </a>
            	</div>
            	<div class="projectUDContent">
            		<span>프로젝트명</span>
            		<input type="text" class="projectUDTitleInput" value="이엘값으로 프로젝트명 뽑기" />
            		<span class="projectSpan">프로젝트 개요</span>
            		<textarea class="projectContentInput">이엘값으로 프로젝트 개요명 뽑기</textarea>
            	</div>
            	<div class="projectStartEndDivp">
					<span class="projectStartp">프로젝트 시작일</span>
					<input type="date" name="project_sdate" class="projectStartInputp" />
					<span class="projectEndp">프로젝트 마감일</span>
					<input type="date" name="project_edate" class="projectEndInputp" />
				</div>
				<div class="layerPopUpBtnss">
					<input type="button" value="수정" class="createProjectSubmit" onclick="projectUpdate();">
					<a href="#" class="btn-layerClose layerPopupClose" onclick="projectDelete('${pMemberListVo.project_id}');">삭제</a>
				</div>
            </div>
        </div>
    </c:if>
</div>
<div class="projectUpdatePopUp"></div>
<div class="projectCardUserName">
    <img src="${pMemberListVo.member_profile}">
    <br>
        ${pMemberListVo.member_name} 외 ${pMemberListVo.pmemberCount - 1}명
</div>
</div>
</li>
</c:forEach>


<%-- book end --%>
