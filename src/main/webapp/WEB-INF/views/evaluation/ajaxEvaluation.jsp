<%--
  Created by IntelliJ IDEA.
  User: "Mr.KKu"
  Date: 2018-12-20
  Time: 오후 7:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="abilityLeft">
    <ul>
        <li><h2>프로젝트</h2></li>
        <li><h2>내용</h2></li>
        <li><h2>처리 업무</h2></li>
    </ul>
</div>
<div class="abilityRight">
    <ul>
        <c:forEach items="${evalView}" var="evalVo" begin="1" end="1">
            <li><input type="text" value="${evalVo.project_title}" readonly /></li>
            <li>
                <textarea readonly>${evalVo.project_overview}</textarea>
            </li>
        </c:forEach>
        <li>
            <div class="accordionView">
                <div id="accordion">
                    <c:forEach items="${evalView}" var="evalVo" varStatus="i">
                        <h3>${evalVo.work_title}</h3>
                        <div>
                            <p>${evalVo.work_content}</p>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </li>
    </ul>
</div>


<script type="text/javascript">
	$(function(){
		$("#accordion").accordion();
	});
</script>