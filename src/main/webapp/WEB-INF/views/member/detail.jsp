<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2> 마 이 페 이 지 </h2>
	<div>
		<div>	
			<div>	
					<div>
						<label> 프로필 사진 등록 </label>
						<div>
							<c:choose>
								<c:when test="${memberVo.member_profile == null}">
									<img src='/profile/noimage.png' />
								</c:when>
								<c:otherwise>
									<img src="${memberVo.member_profile}" />
								</c:otherwise>
							</c:choose>
						</div>
					</div> 
					<div>
						<label>핸드폰 번호 수정</label>
						<div>
							<label>${memberVo.member_tel}</label>
						</div>
					</div>
					<div>
						<label>비밀번호 수정</label>
						<div>
							<label>${memberVo.member_pass}</label>
						</div>
					</div>						
					<form action=/memberUpdate method="get">
						<input type="hidden" name ="member_mail"  value ='${memberVo.member_mail}'/>
						<button type="submit"class="btn btn-default">수정</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>