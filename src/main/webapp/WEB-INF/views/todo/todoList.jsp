<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
$(document).ready(function(){
	var project_id = $('#todo_project_id').val();
	var work_id = ${work.work_id};
	//console.log("project_id : " + project_id);
	//console.log("work_id : " + work_id);
	
	//페이지 접속시 to-do list 조회(Ajax) ==문의: jerry==
	getToDoList${work.work_id}(1, project_id, work_id);
	
	//to-do list의 pagination(Ajax) ==문의: jerry==
	getToDoPagination${work.work_id}(1, project_id, work_id);
	
	//마감일자와 오늘날짜를 비교하여 자동 체크
// 	var beforeDate = new Date();
// 	todoEdateCheck(beforeDate);
	
});

/* 페이지 접속시 to-do list 조회(Ajax) ==문의: jerry== */
function getToDoList${work.work_id}(page, project_id, work_id){
	var pageSize = 5;
	$.ajax({
		method: "POST",
		url: "/todoSelect",
		data: {"project_id" : project_id, "work_id" : work_id, "page" : page, "pageSize" : pageSize},
		success: function (data) {
			//alert("success");
			//console.log(data);
			$('#todoInsertHtmlAjax${work.work_id}').html("");
			$('#todoInsertHtmlAjax${work.work_id}').html(data);
		},
		error: function (data) {
			console.log("todoList.jsp : getToDoList() - error");
		}
	});
}

/* to-do list의 pagination(Ajax) ==문의: jerry== */
function getToDoPagination${work.work_id}(page, project_id, work_id){
	var pageSize = 5;
	$.ajax({
		method: "POST",
		url: "/todoPagination",
		data: {"project_id" : project_id, "work_id" : work_id, "page" : page, "pageSize" : pageSize},
		success: function(data){
			//console.log(data);
			$('#pagination${work.work_id}').html("");
			$('#pagination${work.work_id}').html(data);
		},
		error: function(data){
			console.log("todoList.jsp : getToDoPagination() - error");
		}
	});
}

/* todoComplet을 Y로 변경 */
function todoComplet(todo_id, todo_issue){
	var chk = "";
	var checked = document.getElementById("todoListCheck"+todo_id).checked;
	
	/* 체크를 했으면 Y로 변경 */
	if(checked == true){
		chk = "Y";
		$.ajax({
			method: "POST",
			url: "/todoCompletY",
			data: {"todo_id" : todo_id, "chk" : chk},
			success: function(data){
				$("#minusBtn"+todo_id).html("");
			},
			error: function(data){
				console.log("todoList.jsp : todoComplet() - Y, error");
			}
		});
	/* 체크를 풀었으면 N으로 변경 */	
	}else if(checked == false && todo_issue == null){
		chk = "N";
		$.ajax({
			method: "POST",
			url: "/todoCompletY",
			data: {"todo_id" : todo_id, "chk" : chk},
			success: function(data){
					var html = "<i class='fas fa-minus' style='color: red; cursor: pointer;' id='todoDelete${todo.todo_id}'></i>";
					$("#minusBtn"+todo_id).html("");
					$("#minusBtn"+todo_id).html(html);
			},
			error: function(data){
				console.log("todoList.jsp : todoComplet() - N, error");
			}
		});
	}
}

function goTodoDelete${work.work_id}(todo_id, work_id){
	var project_id = $('#todo_project_id').val();
	
	$.ajax({
		method: "POST",
		url: "/todoDelete",
		data: {"todo_id" : todo_id, "project_id" : project_id, "work_id" : work_id},
		success: function(data){
			console.log(data);
			$('#todoInsertHtmlAjax${work.work_id}').html("");
	        $('#todoInsertHtmlAjax${work.work_id}').html(data);
	        getToDoPagination${work.work_id}(1, project_id, work_id);
		},
		error: function(data){
			console.log("todoList.jsp : goTodoDelete() - error");
		}
	});
}

function insertIssue() {
	var param = $('form[name=insertIssueForm${todo.todo_work}]').serialize();
}

/* 날짜 비교(보류) */
// function todoEdateCheck(beforeDate){
// 	beforeDate.setHours(beforeDate.getHours() + 9);
// 	var utcDate = beforeDate.toISOString().slice(0, 16);
// 	var date = utcDate.replace("T", " ");
// 	if()
// }

</script>

<!-- to-do list 조회 -->
<div class="currentCardContentViewRight">
	<table>
		<thead>
			<tr>
				<th>선택</th>
				<th>TODO</th>
				<th>담당자</th>
				<th>시작</th>
				<th>마감</th>
				<th>이슈</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody id="todoInsertHtmlAjax${work.work_id}">
			<!-- todoInsertAjax.jsp -->
		</tbody>
	</table>
	<div class="pagination" id="pagination${work.work_id}">
		<!-- todoPageinationHtml.jsp -->
	</div>
</div>
