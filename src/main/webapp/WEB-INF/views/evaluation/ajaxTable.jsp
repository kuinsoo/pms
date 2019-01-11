<%--
  Created by IntelliJ IDEA.
  User: "Mr.KKu"
  Date: 2018-12-20
  Time: 오후 7:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<ul>
    <li>프로젝트 참여 수 : ${evalProjectList.size()}</li>
    <li>총 업무 수 : ${evalChart.workCnt}</li>
    <li>총 일감 수 : ${evalChart.todoCnt}</li>
    <li>처리한 일감 수 : ${evalChart.myTodoCnt}</li>

</ul>