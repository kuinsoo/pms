<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script>

$(document).ready(function(){
	//to-do 등록시 시작일자는 현재시간으로 기본값(default) 설정  ==문의: jerry==
    var date = new Date();
    date.setHours(date.getHours() + 9);
    //console.log(date.toISOString());
    document.getElementById('non_todo_sdate').value = date.toISOString().slice(0, 16);
});

//to-do list 등록 ==문의: jerry==
function insertTodo${work.work_id}() {
	console.log('hi');
	var sdate = $('input[name=non_todo_sdate]').val(); //UTC형식 Date를 sdate에 담는다.
	var eedate = $('input[name=non_todo_eedate]').val(); //UTC형식 Date를 eedate에 담는다.
	var repSdate = sdate.replace("T", " "); //Parsing('T' 제거)
	var repEedate = eedate.replace("T", " "); //Parsing('T' 제거)
	$("#todo_sdate").attr('value', repSdate); //Controller에 보낼 hidden에 값을 세팅
	$("#todo_eedate").attr('value', repEedate); //Controller에 보낼 hidden에 값을 세팅

	var param = $('#todoInsert').serialize(); //<form id="todoInsert"> 값
	
	$.ajax({
		method: "POST",
		url: "/todoInsert",
		data: param,
		success: function(data) {
			console.log(data);
			window.location.href = '#close';
			$('#todoInsertHtmlAjax${work.work_id}').html("");
			$('#todoInsertHtmlAjax${work.work_id}').html(data);
		},
		error:function(data) {
			alert("error");
		}
	});
}

//할일등록의 등록버튼에 마우스올리면 커서 변경 ==문의: jerry==
$(".issueInfoCreate").mouseover(function () {
	$(this).css("cursor", "pointer");
});

</script>

<!-- to-do insert 입력 -->
<div class="white_contents" id="opens">
	<div>
		<a href="#close"><i class="icon-close icons"></i></a>
		<div class="issueCreateInputField">
			<div class="issueCreateInputFieldLeft">
				<ul>
					<li>담당자</li>
					<li>할일내용</li>
					<li>시작일자</li>
					<li>마감일자</li>
				</ul>
			</div>
			<div class="issueCreateInputFieldRight">
				<form method="POST" name="todoInsert" id="todoInsert">
					<ul>
						<li><input type="text" name="todo_pmember" placeholder="담당자를 입력하세요." /></li>
						<li><textarea name="todo_content" placeholder="내용을 입력하세요."></textarea></li>
						<li><input type="datetime-local" name="non_todo_sdate" id="non_todo_sdate" value="" /></li>
						<li><input type="hidden" name="todo_sdate" id="todo_sdate" value="" /></li>
						<li><input type="datetime-local" name="non_todo_eedate"></li>
						<li><input type="hidden" name="todo_eedate" id="todo_eedate" value="" /></li>
						<li><input type="hidden" name="work_project" id="todo_project_id" value="${projectVo.project_id}" /></li>
						<li><input type="hidden" name="todo_work" id="todo_work" value="${work.work_id}" /></li>
					</ul>
				</form>
			</div>
		</div>
		<input type="button" value="등록" class="issueInfoCreate" onclick="insertTodo${work.work_id}();"/>
		<a href="#close" class="issueInfoClose">취소</a>
	</div>
</div>