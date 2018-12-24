<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <c:forEach items="${cmtList}" var="cmt">
            <ul>
                <li>
                    <div class="cardContentCommentUser">
                        <div class="cardContentCommentUserImg">
                            <img src="${cmt.member_profile}">
                        </div>
                        <div class="cardContentCommentUserName">
                            <b>${cmt.member_name}</b><span class="times">${cmt.cmt_date}</span>
                            <input type="button" value="수정" class="commentUpdateBtn"/>
                            <input type="button" value="삭제" class="commentDeleteBtn" onclick="deleteCmt('${cmt.cmt_id}', '${cmt.cmt_work}');" />
                            <br>
                            <span>${cmt.cmt_content}</span>
                        </div>
                    </div>
                </li>
            </ul>
    </c:forEach>