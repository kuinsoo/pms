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
	            <i class="icon-wrench icons"></i>
	            <a href="#opens"><i class="icon-bulb icons"></i></a>
	            <div class="white_contents" id="opens">
	                <div>
	                    <a href="#close"><i class="icon-close icons"></i></a>
	                    <div class="issueCreateInputField">
	                        <div class="issueCreateInputFieldLeft">
	                            <ul>
	                                <li>담당자</li>
	                                <li>할일내용</li>
	                                <li>시작일자</li>
	                                <li>마감일자</li>
	                            </ul>
	                        </div>
	                        <div class="issueCreateInputFieldRight">
	                            <form method="POST" name="todoInsert" id="todoInsert">
	                                <ul>
	                                    <li><input type="text" name="todo_pmember"
	                                               placeholder="담당자를 입력하세요."/></li>
	                                    <li><textarea name="todo_content"
	                                                  placeholder="내용을 입력하세요."></textarea></li>
	                                    <li><input type="datetime-local" name="non_todo_sdate"
	                                               id="non_todo_sdate" value=""/></li>
	                                    <li><input type="hidden" name="todo_sdate" id="todo_sdate"
	                                               value=""/></li>
	                                    <li><input type="datetime-local" name="non_todo_eedate"></li>
	                                    <li><input type="hidden" name="todo_eedate" id="todo_eedate"
	                                               value=""/></li>
	                                    <li><input type="hidden" name="project_id"
	                                               value="${projectVo.project_id}"/></li>
	                                    <li><input type="hidden" name="todo_work" id="todo_work"
	                                               value="${work.work_id}"/></li>
	                                </ul>
	                            </form>
	                        </div>
	                    </div>
	                    <input type="button" value="등록" class="issueInfoCreate"
	                           onClick="insertTodo();"/>
	                    <a href="#close" class="issueInfoClose">취소</a>
	                </div>
	            </div>
	        </div>
	    </div>
	    <div class="currentCardContentView">
	        <div class="currentCardContentViewLeft">
	            <textarea readonly>${work.work_content}</textarea>
	        </div>
	        <div class="currentCardContentViewRight">
	            <table>
	                <thead>
	                <tr>
	                    <th><input type="checkbox"/></th>
	                    <th>TODO</th>
	                    <th>담당자</th>
	                    <th>시작</th>
	                    <th>마감</th>
	                    <th>이슈</th>
	                </tr>
	                </thead>
	                <tbody id="todoInsertHtmlAjax${work.work_id}">
	                	<!-- todoInsertAjax.jsp -->
	                </tbody>
	            </table>
	            <div class="pagination">
	                <ul>
	                    <li><i class="icon-arrow-left icons"></i></li>
	                    <li><span>1</span></li>
	                    <li><span>2</span></li>
	                    <li><span>3</span></li>
	                    <li><span>4</span></li>
	                    <li><span>5</span></li>
	                    <li><i class="icon-arrow-right icons"></i></li>
	                </ul>
	            </div>
	        </div>
	    </div>
	    <div class="currentCardContentBottomView">
	        <div id="container${work.work_id}"></div>
	        <%--<%@ include file="/WEB-INF/views/work/testChart.jsp" %>--%>
	    </div>
	
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
	                                <input type="button" value="수정" class="commentUpdateBtn"/>
	                                <input type="button" value="삭제" class="commentDeleteBtn"/>
	                                <br>
	                                <span>${cmt.cmt_content}</span>
	                            </div>
	                        </div>
	                    </li>
	                </ul>
	            </c:if>
	        </c:forEach>
	    </div>
	</div> <%-- 끝--%>
</c:forEach>