<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
.issueCreateInputFieldRightContainer{
	overflow: scroll;
}
</style>
<script>

$(document).ready(function(){
	//to-do 등록시 시작일자는 현재시간으로 기본값(default) 설정  ==문의: jerry==
    var date = new Date();
    date.setHours(date.getHours() + 9);
    //console.log(date.toISOString());
    document.getElementById('non_todo_sdate${work.work_id}').value = date.toISOString().slice(0, 16);
    
    /* to-do 등록 팝업의 참여자 list ajax */
    var project_id = ${projectVo.project_id};
    $.ajax({
    	method: "POST",
    	url: "/popupMemberList",
    	data: {"project_id" : project_id},
    	success: function(data){
    		console.log("data : " + data);
    		$("#popupMemberList${work.work_id}").html("");
    		$("#popupMemberList${work.work_id}").html(data);
    	},
    	error: function(data){
    		console.log("insert-popup error : " + data);
    	}
    });
    
});

//to-di list 등록 ==문의: jerry==
function insertTodo() {
   var sdate = $('input[name=non_todo_sdate]').val(); //UTC형식 Date를 sdate에 담는다.
   var eedate = $('input[name=non_todo_eedate]').val(); //UTC형식 Date를 eedate에 담는다.
   var repSdate = sdate.replace("T", " "); //Parsing('T' 제거)
   var repEedate = eedate.replace("T", " "); //Parsing('T' 제거)
   $("#todo_sdate").attr('value', repSdate); //Controller에 보낼 hidden에 값을 세팅
   $("#todo_eedate").attr('value', repEedate); //Controller에 보낼 hidden에 값을 세팅

   var param = $('#todoInsert').serialize();

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

</script>

<!-- to-do insert 입력 -->
<div class="white_contents" id="opens${work.work_id}">
	<div>
		<a href="#close"><i class="icon-close icons"></i></a>
		<div class="issueCreateInputField">
			<div class="issueCreateInputFieldLeftContainer">
				<div class="issueCreateInputFieldLeft">
					<ul>
						<li>담당자</li>
						<li>할일내용</li>
						<li>시작일자</li>
						<li>마감일자</li>
					</ul>
				</div>
				<div class="issueCreateInputFieldRight">
					<form method="POST" name="todoInsert${work.work_id}" id="todoInsert${work.work_id}">
					
						<input type="hidden" name="todo_sdate" id="todo_sdate${work.work_id}" value=""/>
						<input type="hidden" name="todo_eedate" id="todo_eedate${work.work_id}" value=""/>
						<input type="hidden" name="work_project" id="todo_project_id" value="${projectVo.project_id}" />
						<input type="hidden" name="todo_work" id="todo_work" value="${work.work_id}" />
						
						<ul>
							<li><input type="text" name="todo_pmember" placeholder="담당자를 입력하세요." /></li>
							<li><textarea name="todo_content" placeholder="내용을 입력하세요."></textarea></li>
							<li><input type="datetime-local" name="non_todo_sdate${work.work_id}" id="non_todo_sdate${work.work_id}" value=""/></li>
							<li><input type="datetime-local" name="non_todo_eedate${work.work_id}" id="non_todo_eedate${work.work_id}" value=""/></li>
						</ul>
						
					</form>
				</div>
			</div>
			<div class="issueCreateInputFieldRightContainer">
				<input type="text" >
				<input type="button" value="검색">
				<table>
					<colgroup width="20%" />
					<colgroup width="50%" />
					<colgroup width="30%" />
					<thead>
						<tr>
							<th>선택</th>
							<th>이름</th>
							<th>이메일</th>
						</tr>
					</thead>
					<tbody id="popupMemberList${work.work_id}">
						<!-- $(function({ajax}) -->
					</tbody>
				</table>
			</div>			
		</div>
		<input type="button" value="등록" class="issueInfoCreate" onClick="insertTodo();"/>
		<a href="#close" class="issueInfoClose">취소</a>
		<div class="btnPopupCenter">
			<input type="button" value="등록" class="issueInfoCreate" onclick="insertTodo${work.work_id}();"/>
			<a href="#close" class="issueInfoClose">취소</a>
		</div>
	</div>
</div>