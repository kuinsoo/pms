<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>마이페이지이다</h2>
	<div>
		<div>
			<div>
				<form>
					<div>
						<label> 프로필 사진 등록 </label>
						<div>
							<label>${member.member_profile}</label>
						</div>
					</div>
					<div >
						<label>핸드폰 번호 수정</label>
						<div >
							<label>${member.member_tel}</label>
						</div>
					</div>
					<div >
						<label>비밀번호 수정</label>
						<div >
							<label>${member.member_pass}</label>
						</div>
					</div>
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

				</form>
			</div>
		</div>
	</div>
</body>
</html>