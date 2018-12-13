<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach items="${workList}" var="work" varStatus="i">
    <div class="currentCardList" >
        <div class="cardUserInfo">
            <div class="cardUserInfoImg">
                <img src="${memberVo.member_profile}">
            </div>
            <div class="cardUserInfoName">
                <b>${memberVo.member_name}</b><br> <%-- 작성자 --%>
                <span>2018-12-05 10:27</span>
            </div>
            <div class="updateDeleteIcon">
                <i class="icon-wrench icons"></i>
            </div>
        </div>

        <label class="cardContent" >${work.work_title} </label><br/>  <%-- 업무 제목 --%>
        <div class="cardContent">
            <textarea readonly> ${work.work_content} </textarea> <%-- 업무 내용 --%>
        </div>
        <!-- 댓글  -->
        <div class="cardContentBottom">
            <i class="icon-bubble icons"></i>
            <span onclick="insertCmt('${work.work_id}', 'cmt_content${i.index}');">댓글 작성</span>
            <i class="icon-bulb icons"></i>
            <span>이슈 등록</span>
        </div>
        <div class="cardContentComment">
            <c:forEach items="${cmtList}" var="cmt">
                <c:if test="${cmt.cmt_work eq  work.work_id}">
                    <ul>
                        <li>
                            <div class="cardContentCommentUser">
                                <div class="cardContentCommentUserImg">
                                    <img src="${memberVo.member_profile}">
                                </div>
                                <div class="cardContentCommentUserName">
                                    <b>${cmt.cmt_member}</b><span class="times">${cmt.cmt_date}</span>
                                    <br>
                                    <span>${cmt.cmt_content}</span>
                                </div>
                            </div>
                        </li>
                    </ul>
                </c:if>
            </c:forEach>
            <ul>
                <li>
                    <div class="cardContentCommentUser">
                        <div class="cardContentCommentUserImg">
                            <img src="${memberVo.member_profile}">
                        </div>
                        <div class="cardContentCommentUserName">
                            <input type="text" id="cmt_content${i.index}"  placeholder="댓글을 입력해주세요">
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div> <%-- 끝--%>
</c:forEach>