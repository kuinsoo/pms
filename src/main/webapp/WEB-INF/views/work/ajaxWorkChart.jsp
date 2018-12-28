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

<script>
        Highcharts.ganttChart('container${work.work_id}', {

            title: {
                text: 'Current Gantt Chart'
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
                    <c:forEach items="${workChart}" var="wChart">
                    '1', '2', '${wChart.toDoVo.todo_pmember}'
                    </c:forEach>,''
                ]
            },

            tooltip: {
                outside: true
            },

            series: [{
                name: 'Project 1',
                data: [{
                    start: Date.UTC(2018, 11, 1),
                    end: Date.UTC(2018, 11, 2),
                    y: 0,
                    assignee: 'JonArild'
                }, {
                    start: Date.UTC(2018, 11, 2),
                    end: Date.UTC(2018, 11, 5),
                    y: 1,
                    assignee: 'Oystein',
                    fontSymbol: 'exclamation'
                }, {
                    start: Date.UTC(2018, 11, 8),
                    end: Date.UTC(2018, 11, 9),
                    y: 2,
                    assignee: 'kimjitae'
                }, {
                    start: Date.UTC(2018, 11, 9),
                    end: Date.UTC(2018, 11, 19),
                    y: 1,
                    assignee: '진시리'
                }, {
                    start: Date.UTC(2018, 11, 10),
                    end: Date.UTC(2018, 11, 23),
                    y: 2,
                    assignee: '구인수',
                    fontSymbol: 'smile-o'
                }],
                dataLabels: [{
                    enabled: true,
                    format: '<div style="width: 20px; height: 20px; overflow: hidden; border-radius: 50%; margin-left: -25px">' +
                        '<img src="images/{workChart.assignee}.jpg" ' +
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

