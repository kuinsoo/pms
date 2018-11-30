<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		//일정data를 JSON형식으로 변환 후 담을 배열 변수
		var result = new Array();
		
		<%--
		일정data를 <c:forEach>태그로 반복을 돌며 json이란 객체(var json = new Object())에
		담고 json객체를 result라는 배열 변수에 다시 담는다.
		(json이란 객체 ==> result란 배열 변수)
		--%>
		function resultFunc(){
			
			result = []; // result 초기화
			var size = document.getElementsByName("check").length;
			
			for(var i = 0; i < size; i++){
				
				if(document.getElementsByName("check")[i].checked == true){
					console.log(document.getElementsByName("check")[i].checked);
					
					if(document.getElementsByName("check")[i].value == "projectSchedule"){
						
						<%-- 프로젝트(project) 일정 --%>
						<c:forEach items="${allScheduleList.projectScheduleList}" var="schedule">
							var json = new Object();
							json.title = '${schedule.project_title}';
							json.start = "${schedule.format_project_sdate}";
							<c:choose>
								<c:when test="${schedule.project_eedate != null}">
									json.end = "${schedule.format_project_eedate}";
								</c:when>
								<c:otherwise>
									json.end = "${schedule.format_project_edate}";
								</c:otherwise>
							</c:choose>
							json.color = "${schedule.project_color}";
							result.push(json);
						</c:forEach>
					}
				
					if(document.getElementsByName("check")[i].value == "workSchedule"){
						
						<%-- 업무(work) 일정 --%>
						<c:forEach items="${allScheduleList.workScheduleList}" var="schedule">
							var json = new Object();
							json.title = '${schedule.work_title}';
							json.start = "${schedule.format_work_sdate}";
							<c:choose>
								<c:when test="${schedule.work_eedate != null}">
									json.end = "${schedule.format_work_eedate}";
								</c:when>
								<c:otherwise>
									json.end = "${schedule.format_work_edate}";
								</c:otherwise>
							</c:choose>
							json.color = "${schedule.work_color}";
							result.push(json);
						</c:forEach>
					}
						
					if(document.getElementsByName("check")[i].value == "todoSchedule"){
						
						<%-- 할일(todo) 일정 --%>
						<c:forEach items="${allScheduleList.todoScheduleList}" var="schedule">
							var json = new Object();
							json.title = '${schedule.todo_content}';
							json.start = "${schedule.format_todo_sdate}";
							<c:choose>
								<c:when test="${schedule.todo_eedate != null}">
									json.end = "${schedule.format_todo_eedate}";
								</c:when>
								<c:otherwise>
									json.end = "${schedule.format_todo_edate}";
								</c:otherwise>
							</c:choose>
							json.color = "${schedule.todo_color}";
							result.push(json);
						</c:forEach>
					}
				}
			} //for문
			return result;
		}
		
		// JSON형식이 담긴 배열을 console에 log남기는 함수
		// console.log(JSON.stringify(result));
		
		// fullcalendar 한글화, 사이즈, 일정 출력
		$('#calendar').fullCalendar({
			locale : 'ko',	// 한글화
			//height : 650,	// 사이즈
			// events : JSON형식이 담긴 배열
			events : resultFunc()
		});

		// checkbox 클릭시 fullcalendar reload되는 함수
		$(document).on('click', "input[name=check]", function(){
			$('#calendar').fullCalendar('removeEvents');
			$('#calendar').fullCalendar('refetchEvents');
			$('#calendar').fullCalendar('addEventSource', resultFunc());
		});
	}); // ready
	
	
	// fullcalendar를 출력할 수 있는 jQuery
	<%--
	$('#calendar').fullCalendar({
		locale: 'ko',
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
	--%>
</script>
<style type="text/css">
	.container{
		margin: 0 auto;
		width: 60em;
	}
</style>
</head>
<!-- body영역 -->
<body>
	<div class="container">
		<label><input type="checkbox" name="check" value="projectSchedule"/>project</label>
		<label><input type="checkbox" checked name="check" value="workSchedule"/>work</label>
		<label><input type="checkbox" checked name="check" value="todoSchedule"/>todo</label>
		<div id='calendar'></div>
	</div>
</body>

</html>