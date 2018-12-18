<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach items="${workToDoSelectList}" var="todoSelect">
	<c:if test="${todoSelect.todo_work eq work.work_id}">
		<tr>
			<td><input type="checkbox" /></td>
			<td>
				<a href="#open" class="issueTitlePopup">${todoSelect.todo_title}</a>
				<div class="white_content" id="open">
					<div>
						<a href="#close"><i class="icon-close icons"></i></a>
						<div class="issueSelectPage">
							<div class="issueSelectPageLeft">
								<form action="#" method="post">
									<div class="issueProfile">
										<img src="http://placehold.it/150x200" />
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
												<li><input type="text"/>${todoSelect.todo_title}</li>
												<li><input type="text"/>${todoSelect.todo_sdate}</li>
												<li><input type="text"/>${todoSelect.todo_eedate}</li>
												<li><input type="text"/>${todoSelect.todo_complet}</li>																			
											</ul>
										</div>
									</div>
									<textarea>${todoSelect.todo_content}</textarea>
								</form>
							</div>
							<div class="issueSelectPageRight">
								<h2>발생이슈</h2>
								<input type="button" value="등록" class="issueCreateBtn" />
								<input type="button" value="수정" class="insueUpdateBtn" />
								<form action="#" mehtod="post">
									<textarea>이슈에 대한 내용,,,,,</textarea>
								</form>
							</div>
						</div>
					</div>
			    </div>
			</td>
			<td>${todoSelect.todo_pmember}</td>
			<td>${todoSelect.todo_sdate}</td>
			<td>${todoSelect.todo_eedate}</td>
			<td>${todoSelect.todo_issue}</td>
		</tr>
	</c:if>
</c:forEach>