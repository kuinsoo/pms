<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach items="${workList}" var="work" varStatus="i">
        <div class="cardUserInfo">
            <div class="cardUserInfoImg">
                <img src="http://placehold.it/40x40">
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
            <span>댓글 작성</span>
            <i class="icon-bulb icons"></i>
            <span>이슈 등록</span>
        </div>

        <div class="cardContentComment">
            <ul>
                <li>
                    <div class="cardContentCommentUser">
                        <div class="cardContentCommentUserImg">
                            <img src="http://placehold.it/40x40">
                        </div>
                        <div class="cardContentCommentUserName">
                            <b>userName</b><span class="times">2018-12-05 14:19</span>
                            <br>
                            <span>content~~~!!~~~~~~~~~~~!!!!!!!!!!!!!~~~~~~~~~~~~~~~~~~~~~~</span>
                        </div>
                    </div>
                </li>
            </ul>
            <ul>
                <li>
                    <div class="cardContentCommentUser">
                        <div class="cardContentCommentUserImg">
                            <img src="http://placehold.it/40x40">
                        </div>
                        <div class="cardContentCommentUserName">
                            <input type="text" placeholder="댓글을 입력해주세요" class="commentInput">
                        </div>
                    </div>
                </li>
            </ul>
        </div>
</c:forEach>