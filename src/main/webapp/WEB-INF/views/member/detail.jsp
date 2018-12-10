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
				<%-- 	<div>
						<label> 프로필 사진 등록 </label>
						<div>
							<input name ="member_profile" value ='${memberVo.member_profile}'/>
						</div>
					</div> --%>
				<form action="/memberDetailUpdate" method="get">
					<div >
						<label>핸드폰 번호 수정</label>
						<div >
							<input name = "member_tel" value ='${memberVo.member_tel}'/>
						</div>
					</div>
					<div >
						<label>비밀번호 수정</label>
						<div >
							<input name ="member_pass"  value ='${memberVo.member_pass}'/>
						</div>
						<button type="submit"class="btn btn-default">수정</button>
					</div>
				</form>
					<div >
						<label>참여중인 프로젝트 조회하기</label>
						<div >
							<label></label>
						</div>
					</div>
					<div >
						<label>URL형태로 일감 공유 (열람만 가능)</label>
						<div >
							<label></label>
						</div>
					</div>
					<div >
						<label>자신에게 할당받은 일감들을 보관기능</label>
						<div >
							<label></label>
						</div>
					</div>
					<div >
						<label>즐겨찾기 리스트 출력</label>
						<div >
							<label></label>
						</div>
					</div>
					<div >
						<label>회원탈퇴하기</label>
						<div >
							<label></label>
						</div>
					</div>

			</div>
		</div>
	</div>
</body>
</html>