<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:forEach items="${workList}" var="work" varStatus="i">
	<div class="currentCardList">
		<div class="currentCardListTitle">
			<h2><i class="icon-speech icons"></i>${work.work_title}</h2>
			<div class="workStartEnd">
				<span>업무 시작일 <fmt:formatDate value="${work.work_sdate }" pattern="yyyy-MM-dd"/></span> ~ <span>업무 마감일  <fmt:formatDate value="${work.work_eedate }" pattern="yyyy-MM-dd"/></span>
			</div>
		</div>
		<div class="cardUserInfo">
			<div class="cardUserInfoImg">
				<img src="${work.member_profile}">
			</div>
			<div class="cardUserInfoName">
				<b>${work.member_name}</b><br> <%-- 작성자 --%>
				<span>${work.work_wdate}</span>
			</div>
			<div class="updateDeleteIcon" id="myWorkGo">
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
				<%-- 업무 첨부파일 리스트 --%>
				<div class="attachments">
					<h3><i class="icon-folder icons"></i>첨부파일</h3>
					<c:forEach items="${attList}" var="att">
						<c:if test="${att.att_work eq work.work_id}">
							<br>
							<a href="/download?att_id=${att.att_id}">
								<span>${att.att_id}번 : ${att.att_name}</span>
							</a>
							<br>
						</c:if>
					</c:forEach>
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
										<div class="cardContentCommentUserImgHover">
											<img src="${cmt.member_profile}">
										</div>
									</div>
									<div class="cardContentCommentUserName">
										<b>${cmt.member_name}</b><span class="times"><fmt:formatDate value="${cmt.cmt_date}" pattern="yyyy-MM-dd"/> </span>
										<c:if test="${cmt.cmt_member eq memberVo.member_mail}">
										<input type="button" value="수정" class="commentUpdateBtn" onclick="updateCmt('${cmt.cmt_id}', '${work.work_id}');" />
										<input type="button" value="삭제" class="commentDeleteBtn" onclick="deleteCmt('${cmt.cmt_id}', '${work.work_id}');" />
										</c:if>
										<br>
										<span id="cmtContent${cmt.cmt_id}">${cmt.cmt_content}</span>
											<div class="cmtContentC"  id="cmt${cmt.cmt_id}" >
												<input type="text" name="cmt_content" value="${cmt.cmt_content}" id="cmtSave${cmt.cmt_id}" required="required" />
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

