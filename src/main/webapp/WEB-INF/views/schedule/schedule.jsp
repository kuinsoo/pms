<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정 - CURRENT</title>
<link rel='stylesheet' href='../fullcalendar/fullcalendar.css?ver=1' />
<script src='../lib/jquery.min.js?ver=1'></script>
<script src='../lib/moment.min.js?ver=1'></script>
<script src='../fullcalendar/fullcalendar.js?ver=1'></script>
<script src='../fullcalendar/locale-all.js?ver=1'></script>

<script type="text/javascript">
	$(document).ready(function() {
		var result = new Array();
		
		<c:forEach items="${workScheduleList}" var="workSche">
			var json = new Object();
			json.title = '${workSche.work_title}';
			json.start = "${workSche.format_work_sdate}";
			json.end = "${workSche.format_work_edate}";
			json.color = "${workSche.work_color}";
			result.push(json);
		</c:forEach>
		
		console.log(JSON.stringify(result));
		
		$('#calendar').fullCalendar({
			
			locale : 'ko',
			height : 650,
			events : result

		});
		
		$('#calendar').fullCalendar({
			events : function(start, end, timezone, callback) {
				$.ajax({
					url : 'myxmlfeed.php',
					dataType : 'xml',
					data : {
						// our hypothetical feed requires UNIX timestamps
						start : start.unix(),
						end : end.unix()
					},
					success : function(doc) {
						var events = [];
						$(doc).find('event').each(function() {
							events.push({
								title : $(this).attr('title'),
								start : $(this).attr('start')
							// will be parsed
							});
						});
						callback(events);
					}
				});
			}
		});
	});
</script>

</head>
<body>
	<div class="container">
		<div id='calendar'></div>
	</div>
</body>

</html>