<%--
  Created by IntelliJ IDEA.
  User: Mr.KKu
  Date: 2018-12-05
  Time: 오후 5:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach items="${memberProjectList}" var="pmember" varStatus="i">
    <c:forEach items="${pmember.projectList}" var="project" varStatus="j">
        <%--<c:if test="${i.index eq j.index}">--%>
        <li class="bookmarkProject">
            <div class="projectCard">
                <div class="projectCardTitle">
                    <c:choose >
                        <c:when test="${project.project_bookmark eq 'N'}">
                            <i class="icon-star icons" onclick="bookmark('${project.project_id}');"></i>
                        </c:when>
                        <c:when test="${project.project_bookmark eq 'Y'}">
                            <i class="icon-star icons"  style="color:yellow;font-weight:bold;" onclick="bookmark('${project.project_id}');"></i>
                        </c:when>
                    </c:choose>
                        ${project.project_title}
                    <i class="icon-settings icons"></i>
                </div>
                <div class="projectCardUserName">
                    <img src="http://placehold.it/30x30">
                    <br>
                        ${pmember.member_name} 외 ${pmember.pmemberCount - 1}
                </div>
            </div>
        </li>
        <%--</c:if>--%>
    </c:forEach>
</c:forEach>