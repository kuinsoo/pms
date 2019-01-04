<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach items="${workList}" var="work" varStatus="i">
	<div class="currentCardList">
		<h2><i class="icon-speech icons"></i>${work.work_title}</h2>
		<div class="cardUserInfo">
			<div class="cardUserInfoImg">
				<img src="${work.member_profile}">
			</div>
			<div class="cardUserInfoName">
				<b>${work.member_mail}</b><br> <%-- 작성자 --%>
				<span>${work.work_wdate}</span>
			</div>
			<div class="updateDeleteIcon">
				<a href="#openCardUpdate${work.work_id}"><i class="icon-wrench icons"></i></a>
				<%@ include file="/WEB-INF/views/card/cardUpdate.jsp" %>
				<a href="#opens${work.work_id}" onclick="todoReset(${work.work_id});"><i class="icon-bulb icons"></i></a>
				<%-- 할일관련 --%>
				<%@ include file="/WEB-INF/views/todo/todo.jsp" %>
			</div>
		</div>
		<div class="currentCardContentView">
			<div class="currentCardContentViewLeft">
				<textarea readonly>${work.work_content}</textarea>
				<div class="attachments">
					<input type="file" />
				</div>
			</div>
			<%-- 할일관련 --%>
			<%@ include file="/WEB-INF/views/todo/todoList.jsp" %>
		</div>
            <%--<div class="currentCardContentBottomView" id="workCharts${work.work_id}" >
                <div id="container${work.work_id}"></div>
                <%@ include file="/WEB-INF/views/work/ajaxWorkChart.jsp" %>


		</div>--%>

		<!-- 댓글  -->
		<div class="cardContentComment">
			<ul>
				<li>
					<div class="cardContentCommentUser">
						<div class="cardContentCommentUserImg">
							<img src="${memberVo.member_profile}">
						</div>
						<div class="cardContentCommentUserName">
							<input type="text" class="commentInput" id="cmt_content${i.index}"
								   placeholder="댓글을 입력해주세요" required>
							<i class="icon-bubble icons"
							   onclick="insertCmt('${work.work_id}', 'cmt_content${i.index}');"></i>
						</div>
					</div>
				</li>
			</ul>
			<div id="commentListNewDiv${work.work_id}">
					<%-- commentList --%>
				<c:forEach items="${cmtList}" var="cmt">
					<c:if test="${cmt.cmt_work eq  work.work_id}">
						<ul>
							<li>
								<div class="cardContentCommentUser">
									<div class="cardContentCommentUserImg">
										<img src="${cmt.member_profile}">
									</div>
									<div class="cardContentCommentUserName">
										<b>${cmt.member_name}</b><span class="times">${cmt.cmt_date}</span>
										<input type="button" value="수정" class="commentUpdateBtn" onclick="updateCmt('${cmt.cmt_id}', '${work.work_id}');" />
										<input type="button" value="삭제" class="commentDeleteBtn" onclick="deleteCmt('${cmt.cmt_id}', '${work.work_id}');" />
										<br>
										<span id="cmtContent${cmt.cmt_id}">${cmt.cmt_content}</span>
											<div class="cmtContentC"  id="cmt${cmt.cmt_id}" >
												<input type="text" name="cmt_content" value="${cmt.cmt_content}" id="cmtSave${cmt.cmt_id}" />
												<input type="button" value="확인" onclick="updateCmtAjax('${cmt.cmt_id}', '${work.work_id}', '${projectVo.project_id}', '${cmt.cmt_content}' );"  >
											</div>
									</div>
								</div>
							</li>
						</ul>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</div> <%-- 끝--%>
</c:forEach>