<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:forEach items="${cmtList}" var="cmt">
	<ul>
		<li>
			<div class="cardContentCommentUser">
				<div class="cardContentCommentUserImg">
					<img src="${cmt.member_profile}">
				</div>
				<div class="cardContentCommentUserName">
					<b>${cmt.member_name}</b><span class="times"><fmt:formatDate
							value="${cmt.cmt_date}" pattern="yyyy-MM-dd" /> </span>
					<c:if test="${cmt.cmt_member eq memberVo.member_mail}">
						<input type="button" value="수정" class="commentUpdateBtn" onclick="updateCmt('${cmt.cmt_id}', '${cmt.cmt_work}');" />
						<input type="button" value="삭제" class="commentDeleteBtn" onclick="deleteCmt('${cmt.cmt_id}', '${cmt.cmt_work}');" />
					</c:if>
					<br> <span id="cmtContent${cmt.cmt_id}">${cmt.cmt_content}</span>
					<div class="cmtContentC" id="cmt${cmt.cmt_id}">
						<input type="text" name="cmt_content" value="${cmt.cmt_content}" id="cmtSave${cmt.cmt_id}" required="required"/>
						 <input type="button" value="확인" onclick="updateCmtAjax('${cmt.cmt_id}', '${work.work_id}', '${projectVo.project_id}', '${cmt.cmt_content}' );">
					</div>
				</div>
			</div>
		</li>
	</ul>
</c:forEach>


<script>
$(document).ready(function () {
    <%-- 댓글감추기 --%>
    $('.cmtContentC').hide();
});
<%-- 댓글 삭제 --%>
function deleteCmt(cmt_id, work_id) {
    $.ajax({
        type: "GET",
        url: "/deleteCmt",
        data: {"cmt_id": cmt_id, "project_id": ${projectVo.project_id}, "work_id" : work_id },
        success: function (data) {
            $('#commentListNewDiv'+work_id).html("");
            $('#commentListNewDiv'+work_id).html(data);
            $('.commentInput').val("");
            $('.cmtContentC').hide();
			alert("dhodlf")
        }
    });
}

<%-- 댓글 수정 --%>
function updateCmt(cmt_id, work_id) {
    $('#cmtContent'+cmt_id).hide();
    $('.cmtContentC').hide();
    $('#cmt'+cmt_id).show();
}

function updateCmtShow(cmt_id) {
    $('#cmtContent'+cmt_id).show();
    $('.cmtContentC').hide();
    $('#cmt'+cmt_id).hide();
}

function updateCmtAjax(cmt_id, work_id, project_id, cmt_content) {
    var cmtSave = $('#cmtSave'+cmt_id).val();
    $.ajax({
        type: "GET",
        url: "/updateCmt",
        data: {"cmt_id": cmt_id, "work_id":work_id, "project_id": project_id, "cmt_content": cmtSave},
        success: function (data) {
            $('#cmtContent'+cmt_id).val(data.cmt_content);
            $('.commentInput').val("");
            updateCmtShow(cmt_id);

        }
    });
}
</script>
