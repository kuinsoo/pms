<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
$(document).ready(function(){
    //페이지 접속시 to-do list 조회 ==문의: jerry==
    //todoSelect();
    
    //페이지 접속시 to-do list 조회(Ajax) ==문의: jerry==
	//function todoSelect() {
	var project_id = $('#todo_project_id').val();
	var work_id = ${work.work_id};
	console.log("project_id : " + project_id);
	console.log("work_id : " + work_id);
	
	$.ajax({
		method: "POST",
		url: "/todoSelect",
		data: {"project_id" : project_id, "work_id" : work_id},
		success: function (data) {
			//alert("success");
			console.log(data);
				
			//$('.currentCardContentViewRight').html(data);
			$('#todoInsertHtmlAjax${work.work_id}').html("");
			$('#todoInsertHtmlAjax${work.work_id}').html(data);
		   
		},
		error: function (data) {
			alert("error");
		}
	});
	//}
});

</script>

<!-- to-do list 조회 -->
<div class="currentCardContentViewRight">
	<table>
		<thead>
			<tr>
				<th><input type="checkbox" /></th>
				<th>TODO</th>
				<th>담당자</th>
				<th>시작</th>
				<th>마감</th>
				<th>이슈</th>
			</tr>
		</thead>
		<tbody id="todoInsertHtmlAjax${work.work_id}">
		<!-- todoInsertAjax.jsp -->
		</tbody>
	</table>
	<div class="pagination">
		<ul>
			<li><i class="icon-arrow-left icons"></i></li>
			<li><span>1</span></li>
			<li><span>2</span></li>
			<li><span>3</span></li>
			<li><span>4</span></li>
			<li><span>5</span></li>
			<li><i class="icon-arrow-right icons"></i></li>
		</ul>
	</div>
</div>
