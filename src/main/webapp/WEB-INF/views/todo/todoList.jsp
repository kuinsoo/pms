<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	$(document).ready(function(){
		var project_id = ${projectVo.project_id};
		var work_id = ${work.work_id};

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
				$('#pagination${work.work_id}').html("");
				$('#pagination${work.work_id}').html(data);
			},
			error: function(data){
				console.log("todoList.jsp : getToDoPagination() - error");
			}
		});
	}

	/* todoComplet을 Y로 변경 ==문의: jerry== */
	function todoComplet${work.work_id}(todo_id, todo_issue, work_id){
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
					movebar${work.work_id}(work_id);
				},
				error: function(data){
					console.log("todoList.jsp : todoComplet() - Y, error");
				}
			});

			/* 체크를 풀었으면 N으로 변경 */
		}else if(checked == false){
			chk = "N";
			$.ajax({
				method: "POST",
				url: "/todoCompletY",
				data: {"todo_id" : todo_id, "chk" : chk},
				success: function(data){
					/* 체크를 풀었으면 삭제버튼 출력 */
					if(checked == false && todo_issue == ''){
						var html = "<i class='fas fa-minus' style='color: red; cursor: pointer;' id='todoDelete${todo.todo_id}'></i>";
						$("#minusBtn"+todo_id).html("");
						$("#minusBtn"+todo_id).html(html);
					}
					movebar${work.work_id}(work_id);
				},
				error: function(data){
					console.log("todoList.jsp : todoComplet() - N, error");
				}
			});
		}
	}

	/* todo delete ==문의: jerry== */
	function goTodoDelete${work.work_id}(todo_id, work_id){
		var project_id = $('#todo_project_id').val();

		$.ajax({
			method: "POST",
			url: "/todoDelete",
			data: {"todo_id" : todo_id, "project_id" : project_id, "work_id" : work_id},
			success: function(data){
				$('#todoInsertHtmlAjax${work.work_id}').html("");
				$('#todoInsertHtmlAjax${work.work_id}').html(data);
				getToDoPagination${work.work_id}(1, project_id, work_id);
			},
			error: function(data){
				console.log("todoList.jsp : goTodoDelete() - error");
			}
		});
	}

	/* TO-DO 상세보기시 레이어팝업 초기화 ==문의: jerry== */
	function initialization${work.work_id}(todo_id){
		/* issue 등록시 발생일자를 현재 일시로 default 셋팅 설정  ==문의: jerry== */
		var date = new Date();
		date.setHours(date.getHours() + 9);

		document.getElementById('non_issue_sdate'+todo_id).value = date.toISOString().slice(0, 16);
		document.getElementById('non_issue_edate'+todo_id).value = date.toISOString().slice(0, 16);

		/* issue 조회 함수 호출 ==문의: jerry== */
		getIssueList${work.work_id}(todo_id);

		/* 도움 조회 함수 호출 ==문의: jerry== */
		getHelperList${work.work_id}(todo_id);
	}

	/* issue 등록 ==문의: jerry== */
	function insertIssue${work.work_id}(todo_id) {
		var sdate = $('input[name=non_issue_sdate'+ todo_id +']').val();
		var repSdate = sdate.replace("T", " ");
		$("#issue_sdate"+todo_id).val(repSdate);

		var param = $('form[name=insertIssueForm'+ todo_id +']').serialize();

		$.ajax({
			method: "POST",
			url: "/issueInsert",
			data: param,
			success: function(data){
				$('#issueSelectHtmlAjax'+todo_id).html("");
				$('#issueSelectHtmlAjax'+todo_id).html(data);
			},
			error: function(data){
				console.log("todoList.jsp : insertIssue() - error");
			}
		});
	}

	/* issue list 조회 ==문의: jerry== */
	function getIssueList${work.work_id}(todo_id) {

		$.ajax({
			method: "POST",
			url: "/issueSelectList",
			data: {"todo_id" : todo_id},
			success: function(data){
				$('#issueSelectHtmlAjax'+todo_id).html("");
				$('#issueSelectHtmlAjax'+todo_id).html(data);
			},
			error: function(data){
				console.log("todoList.jsp : getIssueList() - error");
			}
		});
	}

	/* issue 체크 후 수정 ==문의: jerry== */
	function setIssueUpdate${work.work_id}(todo_id, issue_id){
		var issue_title = document.getElementById('issue_title'+issue_id).innerText;
		var issue_level = document.getElementById('issue_level'+issue_id).innerText;
		var issue_content = document.getElementById('issue_content'+issue_id).innerText;

		$('#input_issue_title'+todo_id).val(issue_title);
		$('#input_issue_level'+todo_id + ' option[value=' + issue_level + ']').attr('selected', 'selected');
		$('#input_issue_content'+todo_id).val(issue_content);
		$('#issue_id'+todo_id).val(issue_id);
	}

	/* 등록된 issue 수정 ==문의: jerry== */
	function updateIssue${work.work_id}(todo_id){
		var sdate = $('input[name=non_issue_sdate'+ todo_id +']').val();
		var repSdate = sdate.replace("T", " ");
		$("#issue_sdate"+todo_id).val(repSdate);

		var param = $('form[name=insertIssueForm'+ todo_id +']').serialize();

		$.ajax({
			method: "POST",
			url: "/issueUpdate",
			data: param,
			success: function(data){
				getIssueList${work.work_id}(todo_id);
			},
			error: function(data){
				console.log("todoList.jsp : updateIssue() - error");
			}
		});
	}

	/* 도움 등록 ==문의: jerry== */
	function helperUpdate${work.work_id}(todo_id){
		var edate = $('input[name=non_issue_edate'+ todo_id +']').val();
		var repEdate = edate.replace("T", " ");
		$("#issue_edate"+todo_id).val(repEdate);

		var param = $('form[name=insertIssueForm'+ todo_id +']').serialize();

		$.ajax({
			method: "POST",
			url: "/helperUpdate",
			data: param,
			success: function(data){
				getHelperList${work.work_id}(todo_id);
			},
			error: function(data){
				console.log("todoList.jsp : helperUpdate() - error");
			}
		});
	}

	/* 도움 list 조회 ==문의: jerry== */
	function getHelperList${work.work_id}(todo_id) {

		$.ajax({
			method: "POST",
			url: "/issueHelperList",
			data: {"todo_id" : todo_id},
			success: function(data){
				$('#issueHelperHtmlAjax'+todo_id).html("");
				$('#issueHelperHtmlAjax'+todo_id).html(data);
			},
			error: function(data){
				console.log("todoList.jsp : getIssueList() - error");
			}
		});
	}

	/* 이슈 삭제 ==문의: jerry== */
	function deleteIssue${work.work_id}(todo_id){
		var issue_id = $('#issue_id'+todo_id).val();

		$.ajax({
			method: "POST",
			url: "/issueDelete",
			data: {"issue_id" : issue_id},
			success: function(data){
				getIssueList${work.work_id}(todo_id);
			},
			error: function(data){
				console.log("todoList.jsp : deleteIssue() - error");
			}
		});
	}

	/* to-do 수정시 input type 속성 변경 ==문의: jerry== */
	function attrChangeUpdate${work.work_id}(todo_id) {
		var project_id = ${projectVo.project_id};

		var edate = $('#todo_eedate'+ todo_id).val();
		var repEdate = edate.replace(" ", "T");

		$('#todo_eedate'+todo_id).attr('type', 'datetime-local');
		$('#todo_eedate'+ todo_id).val(repEdate);

		$('#todo_content'+todo_id).removeAttr('readonly');
		$('#todo_eedate'+todo_id).removeAttr('readonly');

		$('#todoUpdateBtn').hide();
		$('#todoUpdateSaveBtn').show();

		$.ajax({
			method: "POST",
			url: "/optionMember",
			data: {"project_id" : project_id},
			success: function(data){
				$('#todo_pmember'+todo_id).hide();
				$('#pmember_member').show();
				for(var i = 0; i < data.length; i++){
					var option = $("<option>"+data[i].member_name+'('+data[i].pmember_member+')'+"</option>");
					$('#pmember_member').append(option);
				}
			},
			error: function(data){
				console.log("todoList.jsp : attrChangeUpdate() - error");
			}
		});
	}

	/* to-do 수정 ==문의: jerry== */
	function updateTodo${work.work_id}(todo_id, work_id) {
		var project_id = ${projectVo.project_id};

		var option = $('#pmember_member option:selected').val();
		var optionSplit = option.split("(");
		var member_name = optionSplit[0];
		var pmember_member = optionSplit[1];
		pmember_member = pmember_member.replace(")", "");
		var todo_eedate = $('#todo_eedate'+todo_id).val();
		todo_eedate = todo_eedate.replace("T", " ");
		var todo_content = $('#todo_content'+todo_id).val();

		$.ajax({
			method: "POST",
			url: "/todoUpdate",
			data: {"todo_id" : todo_id, "member_name" : member_name, "pmember_member" : pmember_member, "todo_eedate" : todo_eedate, "todo_content" : todo_content},
			success: function(data){
				window.location.href = '#close';
				getToDoList${work.work_id}(1, project_id, work_id);
				initialization${work.work_id}(todo_id);
			},
			error: function(data){
				console.log("todoList.jsp : updateTodo() - error");
			}
		});
	}

</script>

<!-- to-do list 조회 -->
<div class="currentCardContentViewRight">
	<p>현재진행상황</p>
	<div class="w3-light-grey" >
		<div id="myBar${work.work_id}" class="w3-container w3-green" style="width:${work.work_progress}%" >${work.work_progress}%</div>
	</div>

	<table>
		<thead>
		<tr>
			<th>완료</th>
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
<link rel="stylesheet" href="../css/w3.css">

<script>
	function movebar${work.work_id}(work_id) {
		$.ajax({
			type: "GET",
			url: "/ajaxWorkProgress",
			data: "project_id=${projectVo.project_id}&work_id="+work_id,
			success: function (data) {
				var elem = document.getElementById("myBar"+work_id);
				var width = 0;
				var id = setInterval(frame, 10);
				if(data.work_progress == 0){
					elem.style.width = 0 + '%';
					elem.innerHTML = 0  + '%';
				}
				function frame() {
					if (width+1 >= data.work_progress) {
						clearInterval(id);
					} else {
						width++;
						elem.style.width = width + '%';
						elem.innerHTML = width + 1  + '%';
					}

				}
			}
		});

	}
</script>