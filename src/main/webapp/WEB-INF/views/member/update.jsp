<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				<form action="/memberDetailUpdate" method="post"  enctype="multipart/form-data">
					<div>
						<label> 프로필 사진 등록 </label>
						<div>
							<img alt="" src="${memberVo.member_profile}"> 
							<input type="file" id="profile" name="member_profile"/>
						</div>
					</div> 
					<div>
						<label>핸드폰 번호 수정</label>
						<div>
							<input name = "member_tel" value ='${memberVo.member_tel}'/>
						</div>
					</div>
					<div>
						<label>비밀번호 수정</label>
						<div>
							<input name ="member_pass"  value ='${memberVo.member_pass}'/>
						</div>
						<button type="submit"class="btn btn-default">수정</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>