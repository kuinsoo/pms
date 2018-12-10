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
		//fullcalendar 한글화, 사이즈, 일정 출력
		
		$('#calendar').fullCalendar({
			locale : 'ko',	// 한글화
			//height : 650,	// 사이즈
			events : resultFunc()
		});
		
		//(일정data를 JSON형식으로 변환 후 담을) 배열 변수
		var result = new Array();
		
		<%--
		일정data를 <c:forEach>태그로 반복을 돌며 json이란 객체(var json = new Object())에
		담고 json객체를 result라는 배열 변수에 다시 담는다.
		(json 객체 ==> result 배열 변수)
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
					
					if(document.getElementsByName("check")[i].value == "issueSchedule"){
						
						<%-- 이슈(issue) 일정 --%>
						<c:forEach items="${allScheduleList.issueScheduleList}" var="schedule">
							var json = new Object();
							json.title = '${schedule.issue_title}';
							json.start = "${schedule.format_issue_sdate}";
							<c:if test="${schedule.issue_edate != null}">
								json.end = "${schedule.format_issue_edate}";
							</c:if>
							json.color = "${schedule.issue_color}";
							result.push(json);
						</c:forEach>
					}
				}
				
			} //for문
			return result;
		} //
		
		// JSON형식이 담긴 배열을 console에 log남기는 함수
		// console.log(JSON.stringify(result));
		
		// checkbox 클릭시 fullcalendar reload되는 함수
		$(document).on('click', "input[name=check]", function(){
			$('#calendar').fullCalendar('removeEvents');
			$('#calendar').fullCalendar('refetchEvents');
			$('#calendar').fullCalendar('addEventSource', resultFunc());
		});
		
		// main select box(sel_schedule) 선택시 sub select box(sel_list) 생성
		$(document).on("change", "select[name='sel_schedule']", function(){
			
			// main select box(sel_schedule)에서 선택한 값
			var mainSelectBox = $(this).val();
			
			// sub select box(sel_list)를 삭제
			var subSelectBox = $("select[name='sel_list']");
			subSelectBox.children().remove(); // 기존 리스트 삭제
			
			// 선택한 main select box(sel_schedule)의 값을 가져와
			// 일치하는 값을 sub select box(sel_list)에 삽입
			$("option:selected", this).each(function(){
				
				// 선택한 값이 mySchedule이면 option은 하나
				if(mainSelectBox == "mySchedule"){
					subSelectBox.append("<option value=''>:::선택해주세요:::</option>");
					
					$('#hiddenSid').submit();
					
				// 선택한 값이 myProject면 forEach구문
				}else if(mainSelectBox == "myProject"){
					<%-- <c:forEach items="${myProjectList}" var="projectList"> --%>
						<%-- <option value="${projectList.project_id}">${projectList.project_title}(${projectList.project_id})</option> --%>
					<%-- </c:forEach> --%>
					subSelectBox.append("<option value=''>:::선택해주세요:::</option>");
					subSelectBox.append("<c:forEach items='${myProjectList}' var='projectList'>");
					subSelectBox.append("	<option value='${projectList.project_id}'>${projectList.project_title}(${projectList.project_id})</option>");
					subSelectBox.append("</c:forEach>");
				}
			});
			
		});
		
		// sub select box(sel_list) 선택시 선택한 값 Controller에 전송
		$(document).on("change", "select[name='sel_list']", function(){
			console.log("value : " + $(this).val());
			var value = $(this).val();
			
			$("#selectForm").submit();
		});
	}); // ready
	
</script>
<style type="text/css">
	.container{
		margin: 0 auto;
		width: 60em;
	}
	#selectForm{
		float: right;
	}
	#colorBoxDiv{
		
	}
	.colorBox{
		font-size: 9pt;
	}
	.colorBox td:nth-child(2n-1){
		width: 1em;
	}
	.colorBox td:nth-child(2n){
		width: 4em;
	}
</style>
</head>
<!-- body영역 -->
<body>
	<div class="container">
		<!-- check box(left) -->
		<label><input type="checkbox" class="checkSchedule" name="check" value="projectSchedule"/>project</label>
		<label><input type="checkbox" class="checkSchedule" checked name="check" value="workSchedule"/>work</label>
		<label><input type="checkbox" class="checkSchedule" checked name="check" value="todoSchedule"/>todo</label>
		<label><input type="checkbox" class="checkSchedule" checked name="check" value="issueSchedule"/>issue</label>

		<div id="colorBoxDiv">
			<table class="colorBox">
				<tr>
					<td style="background: #AB2AF6"></td>
					<td>Project</td>
					<td style="background: #4286f4"></td>
					<td>Work</td>
					<td style="background: #F78181"></td>
					<td>To-Do</td>
					<td style="background: #71D708"></td>
					<td>Issue</td>
				</tr>
			</table>
		</div>

		<!-- select box(right) -->
		<form id="hiddenSid" name="sid" method="POST" action="/allSchedule">
			<input type="hidden" value="${memberVo.member_mail}">
		</form>
		<form id="selectForm" name="selectForm" method="POST" action="/allSchedule">
			<select class="sel_schedule" name="sel_schedule">
				<option value="">:::선택해주세요:::</option>
				<option value="mySchedule">나의 일정</option>
				<option value="myProject">프로젝트 일정</option>
			</select>
			<select class="sel_list" name="sel_list">
				<option value=''>:::선택해주세요:::</option>
			</select>
		</form>
		
		<!-- FullCalendar -->
		<div id='calendar'></div>
	</div>
</body>
</html>