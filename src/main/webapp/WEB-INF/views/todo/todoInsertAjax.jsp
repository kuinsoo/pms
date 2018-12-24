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
		<td><a href="#open${todo.todo_id}" class="issueTitlePopup">${todo.todo_content}</a>
			<div class="white_content3" id="open${todo.todo_id}">
				<div>
					<a href="#close" class="mainCloseBtns"></a>
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
											<li><input type="text" value="${todo.todo_pmember}" /></li>
											<li><input type="text" value="${todo.format_todo_sdate}" /></li>
											<li><input type="text" value="${todo.format_todo_eedate}" /></li>
											<li><input type="text" value="${todo.todo_complet}" /></li>
										</ul>
									</div>
								</div>
								<textarea>${todo.todo_content}</textarea>
							</form>
						</div>
						<div class="issueSelectPageRight">
							<h2>발생이슈</h2>
							<c:choose>
								<c:when test="${todo.todo_issue == null}">
									<input type="button" value="등록" class="issueCreateBtn" />
								</c:when>
								<c:otherwise>
									<input type="button" value="수정" class="insueUpdateBtn" />
								</c:otherwise>
							</c:choose>
						</div>
						<form style="text-align: left;" name="insertIssueForm${todo.todo_work}">
							<label>Title</label><input type="text" name=""><br>
							<label>Level</label>
							<select class="sel_issueLevel" name="sel_issueLevel">
								<option value="1">level 1</option>
								<option value="2">level 2</option>
								<option value="3">level 3</option>
								<option value="4">level 4</option>
								<option value="5">level 5</option>
							</select><br>
							<label>담당자</label><input type="text" id="" name="" readonly><br>
							<label>발생일시</label><input type="datetime-local"><br>
							<label>이슈내용</label><br>
							<textarea placeholder="내용을 입력해주세요."></textarea><br>
							<br><hr><br>
							<label>해결자</label>
							<select>
								<option>프로젝트 참여자들</option>
							</select><br>
							<label>해결일시</label><input type="datetime-local"><br>
							<label>해결방법</label><br>
							<textarea placeholder="내용을 입력해주세요."></textarea>
						</form>
					</div>
				</div>
			</div></td>
		<td>${todo.todo_pmember}</td>
		<td>${todo.format_todo_sdate}</td>
		<td>${todo.format_todo_eedate}</td>
		<td>${todo.todo_issue}</td>
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
