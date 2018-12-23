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
                <a href="#close" class="mainCloseBtns">
                    <i class="icon-close icons"></i>
                </a>
                <div class="btnField">
                    <h2>프로젝트 명 - <span>${pMemberListVo.project_title}</span></h2>
                    <input type="button" value="수정" class="projectUpdateSettings" onclick="projectUpdate();"/>
                    <input type="button" value="삭제" class="projectDeleteSettings" onclick="projectDelete('${pMemberListVo.project_id}');"/>
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
