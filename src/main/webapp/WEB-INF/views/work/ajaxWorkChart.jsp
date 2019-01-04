<%--
  Created by IntelliJ IDEA.
  User: "Mr.KKu"
  Date: 2018-12-28
  Time: 오전 5:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="container${projectVo.project_id}"></div>

<script>
        Highcharts.ganttChart('container${projectVo.project_id}', {

            title: {
                text: 'Current Work Gantt Chart'
            },

            subtitle: {
                text: 'With Work symbols in data labels'
            },

            xAxis: {
                minPadding: 0.05,
                maxPadding: 0.05
            },

            yAxis: {
                categories: [
                    <c:forEach items="${workCharts}" var="workChart" varStatus="i" >
                             '${workChart.todo_id}',
                    </c:forEach>
                ]
            },

            tooltip: {
                outside: true
            },

            series: [{
                name:  '${projectVo.project_title}',
                data:[
                    <c:forEach items="${workCharts}" var="workChart" varStatus="i">
                            {
                                start: Date.UTC(parseInt('${workChart.format_todo_sdate}'.substr(0,4)), parseInt('${workChart.format_todo_sdate}'.substr(5,2)), parseInt('${workChart.format_todo_sdate}'.substr(8,2))),
                                end: Date.UTC(parseInt('${workChart.format_todo_eedate}'.substr(0,4)), parseInt('${workChart.format_todo_eedate}'.substr(5,2)), parseInt('${workChart.format_todo_eedate}'.substr(8,2))),
                                y: ${i.index},
                                assignee: '${workChart.todo_pmember}'
                            },
                    </c:forEach>
                ],
                dataLabels: [{
                    enabled: true,
                    format: '<div style="width: 20px; height: 20px; overflow: hidden; border-radius: 50%; margin-left: -25px">' +
                        '<img src="images/{point.assignee}.jpg" ' +
                        'style="width: 30px; margin-left: -5px; margin-top: -2px"></div>',
                    useHTML: true,
                    align: 'left'
                }, {
                    enabled: true,
                    format: '<i class="fa fa-{point.fontSymbol}" style="font-size: 1.5em"></i>',
                    useHTML: true,
                    align: 'right'
                }]
            }]
        });

</script>

