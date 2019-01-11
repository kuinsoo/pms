<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:forEach items="${cmtList}" var="cmt">
    <ul>
        <li>
            <div class="cardContentCommentUser">
                <div class="cardContentCommentUserImg">
                    <img src="${cmt.member_profile}">
                </div>
                <div class="cardContentCommentUserName">
                    <b>${cmt.member_name}</b><span class="times"><fmt:formatDate value="${cmt.cmt_date}" pattern="yyyy-MM-dd"/> </span>
                    <c:if test="${cmt.cmt_member eq memberVo.member_mail}">
                        <input type="button" value="수정" class="commentUpdateBtn" onclick="updateCmt('${cmt.cmt_id}', '${work.work_id}');" />
                        <input type="button" value="삭제" class="commentDeleteBtn" onclick="deleteCmt('${cmt.cmt_id}', '${work.work_id}');" />
                    </c:if>
                    <br>
                    <span>${cmt.cmt_content}</span>
                </div>
            </div>
        </li>
    </ul>
</c:forEach>

