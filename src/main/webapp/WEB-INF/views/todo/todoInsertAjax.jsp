<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach items="${todoListMap.todoList}" var="todo">
	<tr>
		<!-- 완료 컬럼 -->
		<td>
			<c:choose>
				<c:when test="${todo.todo_complet == 'Y'}">
					<input type="checkbox" class="todoListCheck" name="todoListCheck" id="todoListCheck${todo.todo_id}" onclick="todoComplet${todo.todo_work}('${todo.todo_id}', '${todo.todo_issue}', '${todo.todo_work}');" checked="checked"/>
				</c:when>
				<c:when test="${todo.todo_complet == 'N'}">
					<input type="checkbox" class="todoListCheck" name="todoListCheck" id="todoListCheck${todo.todo_id}" onclick="todoComplet${todo.todo_work}('${todo.todo_id}', '${todo.todo_issue}', '${todo.todo_work}');"/>
				</c:when>
			</c:choose>
		</td>
		<!-- 제목 컬럼 -->
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
											<li><input type="text" id="todo_pmember${todo.todo_id}" value="${todo.todo_pmember}" readonly/></li>
											<li>
												<select style="display:none" id="pmember_member${todo.todo_id}" name="pmember_member"></select>
												<input type="text" id="todo_sdate${todo.todo_id}" value="${todo.format_todo_sdate}" readonly/>
											</li>
											<li><input type="text" id="todo_eedate${todo.todo_id}" value="${todo.format_todo_eedate}" readonly/></li>
											<c:choose>
												<c:when test="${todo.todo_complet == 'Y'}">
													<li><input type="text" value="완료" readonly/></li>
												</c:when>
												<c:when test="${todo.todo_complet == 'N'}">
													<li><input type="text" value="진행중" readonly/></li>
												</c:when>
											</c:choose>
										</ul>
									</div>
								</div>
								<textarea id="todo_content${todo.todo_id}" readonly>${todo.todo_content}</textarea>
								<input type="button" id="todoUpdateSaveBtn${todo.todo_id}" style="display:none;" value="저장" class="issueCreateBtn" onclick="updateTodo${todo.todo_work}(${todo.todo_id}, ${todo.todo_work});">
								<input type="button" id="todoUpdateBtn${todo.todo_id}" value="수정" class="issueUpdateBtnLeft" onclick="attrChangeUpdate${todo.todo_work}(${todo.todo_id});">
							</form>
						</div>
						<div class="issueSelectPageRight">
							<form name="insertIssueForm${todo.todo_id}">
								<input type="hidden" id="member_name${todo.todo_id}" name="member_name" value="">
								<input type="hidden" id="pmember_member${todo.todo_id}" name="pmember_name" value="">
								<input type="hidden" id="issue_id${todo.todo_id}" name="issue_id" value="">
								<input type="hidden" name="issue_work" value="${todo.todo_work}">
								<input type="hidden" id="todo_id${todo.todo_id}" name="todo_id" value="${todo.todo_id}">
								<input type="hidden" id="issue_sdate${todo.todo_id}" name="issue_sdate" value="">
								<input type="hidden" id="issue_edate${todo.todo_id}" name="issue_edate" value="">
								<input type="hidden" id="work_project${todo.todo_id}" name="work_project" value="">
								<div class="occurIssueDivContainer">
									<table class="occurIssueDiv">
										<tbody>
											<tr>
												<td colspan="2">발생이슈</td>
											</tr>
											<tr>
												<td>TITLE</td>
												<td><input type="text" id="input_issue_title${todo.todo_id}" name="issue_title"></td>
											</tr>
											<tr>
												<td>LEVEL</td>
												<td>
													<select class="sel_issueLevel" id="input_issue_level${todo.todo_id}" name="issue_level">
														<option value="1">level 1</option>
														<option value="2">level 2</option>
														<option value="3">level 3</option>
														<option value="4">level 4</option>
														<option value="5">level 5</option>
													</select>
												</td>
											</tr>
											<tr>
												<td>담당자</td>
												<td><input type="text" name="issue_member" value="${todo.todo_pmember}" readonly></td>
											</tr>
											<tr>
												<td>발생일시</td>
												<td><input type="datetime-local" id="non_issue_sdate${todo.todo_id}" name="non_issue_sdate${todo.todo_id}" value=""></td>
											</tr>
											<tr>
												<td>이슈내용</td>
												<td>
													<textarea id="input_issue_content${todo.todo_id}" name="issue_content" placeholder="내용을 입력해주세요."></textarea>
												</td>
											</tr>
										</tbody>
									</table>
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
								<div class="solutionIssueContainer">
									<c:choose>
										<c:when test="${todo.todo_issue == null}"></c:when>
										<c:otherwise>
											<table class="solutionIssue">
												<tr>
													<td colspan="2">이슈에 대한 해결</td>
												</tr>
												<tr>
													<td>해결자</td>
													<td>
														<select class="sel_issue_helper" id="issue_helper">
															<c:forEach items="${issueMemberList}" var="member">
																<option>${member.member_name}(${member.pmember_member})</option>
															</c:forEach>
														</select>
													</td>
												</tr>
												<tr>
													<td>해결일시</td>
													<td><input type="datetime-local" id="non_issue_edate${todo.todo_id}" name="non_issue_edate${todo.todo_id}" value=""></td>
												</tr>
												<tr>
													<td>해결방법</td>
													<td>
														<textarea placeholder="내용을 입력해주세요." name="issue_solution"></textarea>
													</td>
												</tr>
											</table>								
											<input type="button" value="해결등록" class="solutionCreateBtn" onclick="helperUpdate${todo.todo_work}(${todo.todo_id});"/>
										</c:otherwise>
									</c:choose>
								</div>
							</form>
							
							<table class="occurIssueTable">
								<colgroup width="15%" />
								<colgroup width="10%" />
								<colgroup width="15%" />
								<colgroup width="15%" />
								<colgroup width="20%" />
								<colgroup width="25%" />
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
							</table>
							<table class="solutionTable">
								<thead>
									<tr>
										<th>해결자</th>
										<th>해결일시</th>
										<th>해결방법</th>
									</tr>
								</thead>
								<tbody id="issueHelperHtmlAjax${todo.todo_id}">
									<!-- issueHelperHtmlAjax.jsp -->
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</td>
		<!-- 담당자 컬럼 -->
		<td>${todo.todo_pmember}</td>
		<!-- 시작 컬럼 -->
		<td>${todo.format_todo_sdate}</td>
		<!-- 마감 컬럼 -->
		<td>${todo.format_todo_eedate}</td>
		<!-- 이슈 컬럼 -->
		<td>${todo.todo_issue}</td>
		<!-- 삭제 컬럼 -->
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
