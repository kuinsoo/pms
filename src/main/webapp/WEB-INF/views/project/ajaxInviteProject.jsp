<%--
  Created by IntelliJ IDEA.
  User: Mr.KKu
  Date: 2018-12-07
  Time: 오후 8:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<c:forEach items="${inviteProjectList}" var="inviteProject">
		<li>
			<div class="projectCard">
				<div class="projectCardTitle">
					<a href="javascript:popUp(500, 500, '${inviteProject.project_id }');">${inviteProject.project_title}</a>
				</div>
				<div class="projectCardUserName">
					<img src="http://placehold.it/30x30">
					<br>
					${inviteProject.member_name}님 참여중
				</div>
			</div>
		</li>
	</c:forEach>