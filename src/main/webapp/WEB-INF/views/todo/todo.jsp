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
    var work_id = ${work.work_id};
    popupSearchMember${work.work_id}(work_id);
    
});

//to-do list 등록 ==문의: jerry==
function insertTodo${work.work_id}() {
    var sdate = $('input[name=non_todo_sdate${work.work_id}]').val(); //UTC형식 Date를 sdate에 담는다.
    var eedate = $('input[name=non_todo_eedate${work.work_id}]').val(); //UTC형식 Date를 eedate에 담는다.
    var repSdate = sdate.replace("T", " "); //Parsing('T' 제거)
    var repEedate = eedate.replace("T", " "); //Parsing('T' 제거)
    $("#todo_sdate${work.work_id}").attr('value', repSdate); //Controller에 보낼 hidden에 값을 세팅
    $("#todo_eedate${work.work_id}").attr('value', repEedate); //Controller에 보낼 hidden에 값을 세팅
	var work_id = ${work.work_id};
    var project_id = ${projectVo.project_id};
    var param = $('#todoInsert${work.work_id}').serialize();

	$.ajax({
	   method: "POST",
	   url: "/todoInsert",
	   data: param,
	   success: function(data) {
	      window.location.href = '#close';
	      $('#todoInsertHtmlAjax${work.work_id}').html("");
	      $('#todoInsertHtmlAjax${work.work_id}').html(data);
	      getToDoPagination${work.work_id}(1, project_id, work_id);
	   },
	   error:function(data) {
	      console.log("todo.jsp : insertTodo() - error");
	   }
	});
}

/* popup member list Ajax */
function popupMemberAjax${work.work_id}(project_id, work_id){
    $.ajax({
    	method: "POST",
    	url: "/popupMemberList",
    	data: {"project_id" : project_id, "work_id" : work_id},
    	success: function(data){
    		$("#popupMemberList${work.work_id}").html("");
    		$("#popupMemberList${work.work_id}").html(data);
    	},
    	error: function(data){
    		console.log("todo.jsp : popupMemberAjax() - error");
    	}
    });
}

/* to-do list의 member list radio 버튼 클릭시 */
function setMemberName${work.work_id}(name){
	$('#todo_pmember${work.work_id}').attr('value', name);
}

/* to-do 등록시 참여자 이름/이메일 검색 */
function popupSearchMember${work.work_id}(work_id){
	//할 일 1. enter쳐도 검색 될 수 있게 기능 구현하기
	var project_id = ${projectVo.project_id};
	var searchMember = $('#popupSearchForm${work.work_id}').find("#memberSearch${work.work_id}").val();
	var searchOption = $('#popupSearchForm${work.work_id}').find("#sel_popupSearch${work.work_id} option:selected").val();
	
	$.ajax({
		method: "POST",
		url: '/popupMemberList',
		data: {"project_id" : project_id, "work_id" : work_id, "searchMember" : searchMember, "searchOption" : searchOption},
		success: function(data){
			$("#popupMemberList${work.work_id}").html("");
    		$("#popupMemberList${work.work_id}").html(data);
		},
		error: function(data){
			console.log("todo.jsp : popupSearchMember() - error");
		}
	});
	
}

/* to-do 등록시 검색창에 ENTER KEY event */
function enterKey${work.work_id}(e){
	if(e.keyCode == 13){
		popupSearchMember${work.work_id}('${work.work_id}');
		return false;
	}
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
							<li><input type="text" name="todo_pmember" id="todo_pmember${work.work_id}" placeholder="담당자를 입력하세요." /></li>
							<li><textarea name="todo_content" placeholder="내용을 입력하세요."></textarea></li>
							<li><input type="datetime-local" name="non_todo_sdate${work.work_id}" id="non_todo_sdate${work.work_id}" value=""/></li>
							<li><input type="datetime-local" name="non_todo_eedate${work.work_id}" id="non_todo_eedate${work.work_id}" value=""/></li>
						</ul>
					</form>
				</div>
			</div>
			<div class="issueCreateInputFieldRightContainer">
				<form id="popupSearchForm${work.work_id}" name="popupSearchForm${work.work_id}">
					<select name="sel_popupSearch${work.work_id}" id="sel_popupSearch${work.work_id}">
						<option value="member_name">이름</option>
						<option value="pmember_member">이메일</option>
					</select>
					<input type="text" name="memberSearch${work.work_id}" id="memberSearch${work.work_id}" onkeypress="return enterKey${work.work_id}(event)">
					<input type="button" value="검색" onclick="javascript:popupSearchMember${work.work_id}('${work.work_id}');">
				</form>
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
						<!-- popupMemberList.jsp -->
					</tbody>
				</table>
			</div>			
		</div>
		<div class="btnPopupCenter">
			<input type="button" value="등록" class="issueInfoCreate" onclick="insertTodo${work.work_id}();"/>
			<a href="#close" class="issueInfoClose">취소</a>
		</div>
	</div>
</div>