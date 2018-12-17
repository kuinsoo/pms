<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	<tbody>
		<tr>
			<td><input type="checkbox" /></td>
			<td>
				<a href="#open" class="issueTitlePopup">샘플 제목 테스트</a>
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
												<li><input type="text" /></li>
												<li><input type="text" /></li>
												<li><input type="text" /></li>
												<li><input type="text" /></li>																			
											</ul>
										</div>
									</div>
									<textarea>누른것에 대한 상세 내용...........</textarea>
								</form>
							</div>
							<div class="issueSelectPageRight">
								<h2>발생이슈</h2>
								<input type="button" value="등록" class="issueCreateBtn" />
								<input type="button" value="수정" class="insueUpdateBtn" />
								<form action="#" method="post">
									<textarea>이슈에 대한 내용,,,,,</textarea>
								</form>
							</div>
						</div>
					</div>
			    </div>
			</td>
			<td>구인수</td>
			<td>2018-12-14</td>
			<td>2018-12-18</td>
			<td>발생</td>
		</tr>
		<!-- forEach구문 자리 -->
	</tbody>
</table>