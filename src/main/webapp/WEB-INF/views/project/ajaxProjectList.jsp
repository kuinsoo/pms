<%--
  Created by IntelliJ IDEA.
  User: Mr.KKu
  Date: 2018-12-05
  Time: 오후 5:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
                <a href="/subMain?project_id=${pMemberListVo.project_id}&project_title=${pMemberListVo.project_title}" > ${pMemberListVo.project_title}</a>
                <c:if test="${pMemberListVo.pmember_position eq '1'}">
                    <i class="icon-settings icons"></i>
                </c:if>
            </div>
            <div class="projectCardUserName">
                <img src="${memberVo.member_profile}">
                <br>
                    ${pMemberListVo.member_name} 외 ${pMemberListVo.pmemberCount - 1}명
            </div>
        </div>
    </li>
</c:forEach>