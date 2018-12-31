<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach items="${todoListMap.todoList}" var="todo">
	<tr>
		<td>
			<c:choose>
				<c:when test="${todo.todo_complet == 'Y'}">
					<input type="checkbox" class="todoListCheck" name="todoListCheck" id="todoListCheck${todo.todo_id}" onclick="todoComplet(${todo.todo_id}, ${todo.todo_issue});" checked="checked"/>
				</c:when>
				<c:when test="${todo.todo_complet == 'N'}">
					<input type="checkbox" class="todoListCheck" name="todoListCheck" id="todoListCheck${todo.todo_id}" onclick="todoComplet(${todo.todo_id}, ${todo.todo_issue});"/>
				</c:when>
			</c:choose>
		</td>
		<td><a href="#open${todo.todo_id}" class="issueTitlePopup" onclick="initialization${todo.todo_work}(${todo.todo_id});">${todo.todo_content}</a>
			<div class="white_content3" id="open${todo.todo_id}">
				<div>
					<a href="#close" class="mainCloseBtns" onclick="getToDoList${todo.todo_work}(1, ${todo.work_project}, ${todo.todo_work});"></a>
					<div class="issueSelectPage">
						<div class="issueSelectPageLeft">
							<form action="#" method="post">
								<div class="issueProfile">
									<img src="${todo.member_profile}" />
								</div>
								<div class="issues">
									<div class="issuesLeft">
										<ul>
											<li>담당자</li>
											<li>시작</li>
											<li>예상마감</li>
											<li>마감</li>
										</ul>
									</div>
									<div class="issuesRight">
										<ul>
											<li><input type="text" id="todo_pmember${todo.todo_id}" value="${todo.todo_pmember}" /></li>
											<li><select style="display:none" id="pmember_member" name="pmember_member"></select></li>
											<li><input type="text" value="${todo.format_todo_sdate}" /></li>
											<li><input type="text" id="todo_eedate${todo.todo_id}" value="${todo.format_todo_eedate}" /></li>
											<li><input type="text" value="${todo.todo_complet}" /></li>
										</ul>
									</div>
								</div>
								<textarea id="todo_content${todo.todo_id}" readonly>${todo.todo_content}</textarea>
								<input type="button" value="수정" class="issueCreateBtn" onclick="attrChangeUpdate${todo.todo_work}(${todo.todo_id});">
								<input type="button" value="등록" class="issueCreateBtn" onclick="updateTodo${todo.todo_work}(${todo.todo_id}, ${todo.todo_work});">
							</form>
						</div>
						<div class="issueSelectPageRight">
							<h2>발생이슈</h2>
							<c:choose>
								<c:when test="${todo.todo_issue == null}">
									<input type="button" value="등록" class="issueCreateBtn" onclick="insertIssue${todo.todo_work}(${todo.todo_id});"/>
								</c:when>
								<c:otherwise>
									<input type="button" value="수정" class="insueUpdateBtn" onclick="updateIssue${todo.todo_work}(${todo.todo_id});"/>  
									<input type="button" value="등록" class="issueCreateBtn" onclick="insertIssue${todo.todo_work}(${todo.todo_id});"/>
									<input type="button" value="삭제" class="insueUpdateBtn" onclick="deleteIssue${todo.todo_work}(${todo.todo_id});"/>  
								</c:otherwise>
							</c:choose>
						</div>
						<form style="text-align: left;" name="insertIssueForm${todo.todo_id}">
							<label>Title</label><input type="text" id="input_issue_title${todo.todo_id}" name="issue_title"><br>
							<label>Level</label>
							<select class="sel_issueLevel" id="input_issue_level${todo.todo_id}" name="issue_level">
								<option value="1">level 1</option>
								<option value="2">level 2</option>
								<option value="3">level 3</option>
								<option value="4">level 4</option>
								<option value="5">level 5</option>
							</select><br>
							<label>담당자</label><input type="text" name="issue_member" value="${todo.todo_pmember}" readonly><br>
							<label>발생일시</label><input type="datetime-local" id="non_issue_sdate${todo.todo_id}" name="non_issue_sdate${todo.todo_id}" value=""><br>
							<label>이슈내용</label><br>
							<textarea id="input_issue_content${todo.todo_id}" name="issue_content" placeholder="내용을 입력해주세요."></textarea><br>
							<br><hr><br>
							<c:choose>
								<c:when test="${todo.todo_issue == null}"></c:when>
								<c:otherwise>
									<label>해결자</label>
									<select class="sel_issue_helper" name="issue_helper">
										<c:forEach items="${issueMemberList}" var="member">
											<option>${member.member_name}(${member.pmember_member})</option>
										</c:forEach>
									</select><br>
									<label>해결일시</label><input type="datetime-local" id="non_issue_edate${todo.todo_id}" name="non_issue_edate${todo.todo_id}" value=""><br>
									<label>해결방법</label><br>
									<textarea placeholder="내용을 입력해주세요." name="issue_solution"></textarea>
									<input type="button" value="해결등록" class="insueUpdateBtn" onclick="helperUpdate${todo.todo_work}(${todo.todo_id});"/>
								</c:otherwise>
							</c:choose>
							<input type="hidden" id="issue_id${todo.todo_id}" name="issue_id" value="">
							<input type="hidden" name="issue_work" value="${todo.todo_work}">
							<input type="hidden" id="todo_id${todo.todo_id}" name="todo_id" value="${todo.todo_id}">
							<input type="hidden" id="issue_sdate${todo.todo_id}" name="issue_sdate" value="">
							<input type="hidden" id="issue_edate${todo.todo_id}" name="issue_edate" value="">
							<input type="hidden" id="work_project${todo.todo_id}" name="work_project" value="">
						</form>
						<br><hr><br>
						<div>
							<table>
								<thead>
									<tr>
										<th>선택</th>
										<th>제목</th>
										<th>레벨</th>
										<th>담당자</th>
										<th>발생일시</th>
										<th>이슈내용</th>
									</tr>
								</thead>
								<tbody id="issueSelectHtmlAjax${todo.todo_id}">
									<!-- issueSelectHtmlAjax.jsp -->
								</tbody>
								<tr>
									<th>해결자</th>
									<th>해결일시</th>
									<th>해결방법</th>
								</tr>
								<tbody id="issueHelperHtmlAjax${todo.todo_id}">
									<!-- issueHelperHtmlAjax.jsp -->
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</td>
		<td>${todo.todo_pmember}</td>
		<td>${todo.format_todo_sdate}</td>
		<td>${todo.format_todo_eedate}</td>
		<td>${todo.todo_issue}</td>
		<td></td>
		<c:choose>
			<c:when test="${todo.todo_complet == 'N' && todo.todo_issue == null}">
				<td id="minusBtn${todo.todo_id}"><i class='fas fa-minus' style='color: red; cursor: pointer;' id='todoDelete${todo.todo_id}' onclick="goTodoDelete${todo.todo_work}(${todo.todo_id}, ${todo.todo_work});"></i></td>
			</c:when>
			<c:otherwise>
				<td id="minusBtn${todo.todo_id}"></td>
			</c:otherwise>
		</c:choose>
	</tr>
</c:forEach>
