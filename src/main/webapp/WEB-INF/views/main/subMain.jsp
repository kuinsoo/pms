<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- header & left --%>
<%@ include file="/WEB-INF/views/header.jsp" %>

<%--CURRENT SECTION(MAIN)--%>
<section class="currentMain">
    <div class="currentMainContainer">
        <div class="currentMainContainerLeft">
            <%@ include file="/WEB-INF/views/main/report.jsp" %>
            <div class="projectTaskContainer">
                <div class="projectTaskContainerTitle">
                    <i class="far fa-sticky-note"></i><span>WORK CARD</span>
                </div>
            </div>
            <div class="projectTaskContainerDragDrop">
                <div class="projectTaskDragDrop">
                    <ul id="titleList">
                        <li class="titleBox">요청</li>
                        <li class="titleBox">진행</li>
                        <li class="titleBox">이슈발생</li>
                        <li class="titleBox">처리대기</li>
                        <li class="titleBox">완료</li>
                    </ul>
                    <div class="kku-boarder kku-mainPage" id="planList">
                        <%--<%@include file="/WEB-INF/views/card/cardChart.jsp"%>--%>
                    </div>
                </div>
            </div>
            
            <%@ include file="/WEB-INF/views/main/projectWriter.jsp" %>
			<%@ include file="/WEB-INF/views/main/calendarCardList.jsp" %>
			
            <%--카드리스트--%>
            <div id="submain_work">
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
                                <%@ include file="/WEB-INF/views/todo/todo.jsp" %>
                            </div>
                        </div>
                        <div class="currentCardContentView">
                            <div class="currentCardContentViewLeft">
                                <textarea readonly>${work.work_content}</textarea>
                            </div>
                            <%@ include file="/WEB-INF/views/todo/todoList.jsp" %>
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
            </div>
            <%-- submainwork --%>
        </div>
        <%-- MainController --%>

        <div class="currentMainContainerRight">
            <div class="currentSubMainTitle">
                <i class="icon-star icons"></i>
                <span>${projectVo.project_title}</span>
                <!--
                <i class="icon-share icons dialog__triggerss"></i>
                <div class="dialogss">
                    <ul>
                        <li>프로젝트 설정</li>
                        <li>알림(푸쉬) 설정</li>
                        <li>프로젝트 숨기기</li>
                    </ul>
                </div>
                -->
            </div>
            <div class="projectTeamsTop">
                <!-- (변찬우) for node // 외부에서 접근해서 인증 허용 해줘야 함..  -->
                <iframe src="https://127.0.0.1:8443/"></iframe>
            </div>
            <%@ include file="/WEB-INF/views/main/participants.jsp" %>
        </div>
    </div>
</section>

<%@ include file="/WEB-INF/views/main/footer.jsp" %>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.2/js/swiper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="js/classie.js"></script>
<script type="text/javascript" src="js/submain.js"></script>

</body>
</html>