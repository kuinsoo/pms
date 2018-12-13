<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--카드리스트--%>
<c:forEach items="${workList}" var="work" varStatus="i">
    <div class="currentCardList" >
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
            </div>
        </div>

        <label class="cardContent" >${work.work_title} </label><br/>  <%-- 업무 제목 --%>
        <div class="cardContent">
            <textarea readonly> ${work.work_content} </textarea> <%-- 업무 내용 --%>
        </div>
        <!-- 댓글  -->
        <div class="cardContentBottom">
                <%--<i class="icon-bubble icons"></i>--%>
                <%--<span onclick="insertCmt('${work.work_id}', 'cmt_content${i.index}');">댓글 작성</span>--%>
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
                                    <img src="${cmt.member_profile}">
                                </div>
                                <div class="cardContentCommentUserName">
                                    <b>${cmt.member_name}</b><span class="times">${cmt.cmt_date}</span>
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

                            <input type="text" class="form-control" id="cmt_content${i.index}" value="" placeholder="댓글을 입력해주세요" required >
                            <div class="cardContentBottom">
                                <i class="icon-bubble icons"></i>
                                <span onclick="insertCmt('${work.work_id}', 'cmt_content${i.index}');">댓글 작성</span>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div> <%-- 끝--%>
</c:forEach>