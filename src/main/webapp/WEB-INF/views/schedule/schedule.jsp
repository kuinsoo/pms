<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/views/header.jsp" %>
<link rel='stylesheet' href='../fullcalendar/fullcalendar.css?ver=1' />
<style type="text/css">
.containerDiv {
	width:1400px;padding:20px;margin:0 auto;margin-top:20px;height:auto;border:1px solid #dee3eb;
	background-color:#fff;overflow:hidden;
}
.container{float:left;width:1000px;background-color:#fff;border:1px solid #dee3eb;padding:20px;}
.caldendarRightMenu {
	float:left;width:335px;height:293px;border:1px solid #dee3eb;background-color:#fff;margin-left:20px;
}
.caldendarRightMenu > ul > li{padding:10px;}
.caldendarRightMenu > ul > li > input[type="checkbox"]{width:30px;height:30px;vertical-align:middle;}
.caldendarRightMenu > ul > li > span{font-size:20px;margin-left:10px;}
.caldendarRightMenu > ul > li:first-child{background-color:#ab2af6;color:#fff;}
.caldendarRightMenu > ul > li:nth-child(2){background-color:#4286f4;color:#fff;}
.caldendarRightMenu > ul > li:nth-child(3){background-color:#F78181;color:#fff;}
.caldendarRightMenu > ul > li:nth-child(4){background-color:#71D708;color:#fff;}
.caldendarRightMenu > ul > li > span{color:#fff;font-weight:bold;}
.sel_schedule{width:100%;height:30px;font-size:20px;outline:none;}
.sel_list{width:100%;height:30px;font-size:20px;outline:none;margin-top:10px;}
</style>
<section class="currentMain">
	<div class="currentMainContainer">
		<div class="containerDiv">
			<div class="container">			
				<!-- select box(right) -->
				<form id="hiddenSid" name="sid" method="POST" action="/allSchedule">
					<input type="hidden" value="${memberVo.member_mail}">
				</form>
				<!-- FullCalendar -->
				<div id='calendar'></div>
			</div>
			<div class="caldendarRightMenu">
				<ul>
					<li>
						<input type="checkbox" class="checkSchedule" name="check" value="projectSchedule"/>
						<span>project</span>
					</li>
					<li>
						<input type="checkbox" class="checkSchedule" checked name="check" value="workSchedule"/>
						<span>work</span>
					</li>
					<li>
						<input type="checkbox" class="checkSchedule" checked name="check" value="todoSchedule"/>
						<span>todo</span>
					</li>
					<li>
						<input type="checkbox" class="checkSchedule" checked name="check" value="issueSchedule"/>
						<span>issue</span>
					</li>
					<li>
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
					</li>
				</ul>
			</div>
		</div>
	</div>
</section>
<footer class="currentFooter">
	<div class="footerContent">
		<p>
			대전광역시 중구 중앙로 76 영민빌딩 2층 203호<br>
			기관명: (재)대덕인재개발원, 최종프로젝트 PMS(Project Management System)<br>
			Copyright 2018 <span>DDIT 203 Class, CURRENT</span> All rights reserved. 
		</p>
	</div>
</footer>
<script src='../lib/moment.min.js?ver=1'></script>
<script src='../lib/jquery.min.js'></script>
<script src='../fullcalendar/fullcalendar.js?ver=1'></script>
<script src='../fullcalendar/locale-all.js?ver=1'></script>
<script type="text/javascript" src="js/classie.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	//fullcalendar 한글화, 사이즈, 일정 출력
	var result = resultFunc();
	$('#calendar').fullCalendar({
		locale : 'ko',	// 한글화
		//height : 650,	// 사이즈
		eventLimit: true,
		/*
		eventRender: function(event, element){
			element.popover({
				title : event.title,
				content: '<b>Inicio</b>: ' + event.start + "<b>Fin</b>: " + event.end,
				trigger: 'hover',
				//placement: 'top',
				//container: 'body'
			});
		},*/
		events : result
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
							<c:when test="${schedule.project_edate == null}">
								json.end = "${schedule.format_project_eedate}";
							</c:when>
							<c:when test="${schedule.project_edate != null}">
								json.end = "${schedule.format_project_edate}";
							</c:when>
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
							<c:when test="${schedule.work_edate == null}">
								json.end = "${schedule.format_work_eedate}";
							</c:when>
							<c:when test="${schedule.work_edate != null}">
								json.end = "${schedule.format_work_edate}";
							</c:when>
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
							<c:when test="${schedule.todo_edate == null}">
								json.end = "${schedule.format_todo_eedate}";
							</c:when>
							<c:when test="${schedule.todo_edate != null}">
								json.end = "${schedule.format_todo_edate}";
							</c:when>
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
				subSelectBox.append("	<option value='${projectList.project_id}'>${projectList.project_title}</option>");
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
	
	// 알람 탭 메뉴
	$("#tabs").tabs();
	
	var menuLeft = document.getElementById('cbp-spmenu-s1'),
	 showLeftPush = document.getElementById('showLeftPush'),
	 body = document.body;

	$("#showLeftPush").click(function(){
		classie.toggle( this, 'active' );
		classie.toggle( body, 'cbp-spmenu-push-toright' );
		classie.toggle( menuLeft, 'cbp-spmenu-open' );
	});
	
	function dialog(){
		var dialogBox = $('.dialog'),
			 dialogTrigger = $('.dialog__trigger'),
			 dialogAction = $('.dialog__action');
			 
			 // Open the dialog
			 dialogTrigger.on('click', function(e){
				 dialogBox.toggleClass('dialog--active');
				 e.stopPropagation()
			 });
	
			 $(".dialog").click(function(){
				 dialogBox.toggleClass('dialog--active');
			 });
	
			 $(".dialog__triggers").click(function(){
				 dialogBox.removeClass('dialog--active');
			 });
	
			 // Close the dialog - press escape key // key#27
			 $(document).keyup(function(e){
				 if(e.keyCode === 27){
					 dialogBox.removeClass('dialog--active');
				 }
			 });
	};
	
	//Run function when the document has loaded
	$(function(){
		dialog();
	});
	
	function dialogs(){
		var dialogBoxs = $('.dialogs'),
			 dialogTriggers = $('.dialog__triggers'),
			 dialogActions = $('.dialog__actions');
			 
			 // Open the dialog
			 dialogTriggers.on('click', function(e){
				 dialogBoxs.toggleClass('dialog--actives');
				 e.stopPropagation()
			 });

			 $(".dialogs").click(function(){
				 dialogBoxs.toggleClass('dialog--actives');
			 });

			 $(".dialog__trigger").click(function(){
				 dialogBoxs.removeClass('dialog--actives');
			 });

			 // Close the dialog - press escape key // key#27
			 $(document).keyup(function(e){
				 if(e.keyCode === 27){
					 dialogBoxs.removeClass('dialog--actives');
				 }
			 });
	};

	// Run function when the document has loaded
	$(function(){
		dialogs();
	});
	
}); // ready
</script>
</body>
</html>