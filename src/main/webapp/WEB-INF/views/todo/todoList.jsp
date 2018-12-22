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

function goAllSelect(){
	
	var allSelect = document.getElementById("todoListTopCheck");
	var select = document.getElementsByName("todoListCheck");
	
	if(allSelect.checked){
		for(var i = 0; i < select.length; i++){
			select[i].checked = true;
		}
	}else{
		for(var i = 0; i < select.length; i++){
			select[i].checked = false;
		}
	}
	
}

</script>

<!-- to-do list 조회 -->
<div class="currentCardContentViewRight">
	<table>
		<thead>
			<tr>
				<th><input type="checkbox" class="todoListCheck" id="todoListTopCheck" onclick="goAllSelect();"/></th>
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
