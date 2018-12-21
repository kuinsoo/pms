<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach items="${postVoList}" var="postVo">
<tr>
	<td>
			<span <c:if test="${postVo.post_public=='n'}">id="secretLink" class="secretText"</c:if> >${postVo.title} </span>
	</td>
	<td>
		${postVo.post_date}
		<c:if test="${postVo.post_public=='n'}"> [비밀 글] </c:if>
	</td>
</tr>
</c:forEach>
<script>
	$("#secretLink").click(function(){
		$(location).attr('href','qnaReply/?board_id=${postVo.board_id}&post_hierarchy=${postVo.post_id}');
	});
</script>
				