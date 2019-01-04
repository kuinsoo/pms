<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="projectList">
    <div class="projectListTitles">
        <i class="far fa-newspaper"></i>
        <span>업무 리포트 보기</span>
    </div>
    <div class="charts">
        <div class="chartsContent">
            <canvas id="myChart" width="860" height="400"></canvas>
        </div>
        <div class="chartsNumber">
            <ul>
                <li>
                    <i class="icon-pie-chart icons"></i>
                    <span>업무 ${workMainChart.workCnt}건</span>
                </li>
                <li>
                    <i class="icon-pie-chart icons"></i>
                    <span>할일 ${workMainChart.todoCnt}건</span>
                </li>
                <li>
                    <i class="icon-pie-chart icons"></i>
                    <span>이슈 ${workMainChart.issueCnt}건</span>
                </li>
            </ul>
        </div>
    </div>
</div>