<%--
  Created by IntelliJ IDEA.
  User: "Mr.KKu"
  Date: 2018-12-20
  Time: 오후 7:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<canvas id="myChart" width="349" height="450"></canvas>

<script type="text/javascript">
    var ctx = document.getElementById("myChart").getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'pie',
        data: {
            labels: ["이슈" , "업무" , "참여자"],
            datasets: [{
                label: '${memberVo.member_name} 님의 CURRENT',
                data: [

                    '${evalChart.issueCnt}', '${evalChart.workCnt}' , '${evalChart.memberCnt}'
                ],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)'
                ],
                borderColor: [
                    'rgba(255,99,132,1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero:true
                    }
                }]
            }
        }
    });

</script>
