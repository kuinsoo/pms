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
                    <span>요청 12건</span>
                </li>
                <li>
                    <i class="icon-pie-chart icons"></i>
                    <span>진행 19건</span>
                </li>
                <li>
                    <i class="icon-pie-chart icons"></i>
                    <span>피드백 3건</span>
                </li>
                <li>
                    <i class="icon-pie-chart icons"></i>
                    <span>완료 5건</span>
                </li>
                <li>
                    <i class="icon-pie-chart icons"></i>
                    <span>보류 2건</span>
                </li>
            </ul>
        </div>
    </div>
</div>