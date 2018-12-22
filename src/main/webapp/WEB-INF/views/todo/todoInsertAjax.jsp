<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach items="${todoListMap.todoList}" var="todo">
<%-- 	<c:if test="${todo.todo_work eq work.work_id}"> --%>
		<tr>
			<td><input type="checkbox" /></td>
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
								<input type="button" value="등록" class="issueCreateBtn" /> <input
									type="button" value="수정" class="insueUpdateBtn" />
								<form action="#" method="post">
									<textarea>이슈에 대한 내용,,,,,</textarea>
								</form>
							</div>
						</div>
					</div>
				</div></td>
			<td>${todo.todo_pmember}</td>
			<td>${todo.format_todo_sdate}</td>
			<td>${todo.format_todo_eedate}</td>
			<td>${todo.todo_issue}</td>
		</tr>
<%-- 	</c:if> --%>
</c:forEach>
