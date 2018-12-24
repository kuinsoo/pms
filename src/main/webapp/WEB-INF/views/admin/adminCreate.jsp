<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CURRENT ADMIN</title>
<link rel="shortcut icon" type="image/x-icon" href="/images/favicon.png" />
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.css">
<style type="text/css">
/* ADMIN COMMON */
*{margin:0px;padding:0px;box-sizing:border-box;font-family:'NanumSquare', sans-serif;}
a{text-decoration:none;}
ul{list-style-type:none;}

/* ADMIN HEADER */
.header{width:100%;height:85px;position:fixed;}
.topHeader{width:100%;height:50px;background-color:#333;}
.adminLogo{float:left;margin-left:20px;color:red;font-size:20px;line-height:50px;}
.adminInfo{float:right;color:#fff;font-size:17px;line-height:50px;margin-right:20px;}
.adminInfo > span{color:#ccc;}
.subHeader{width:100%;height:35px;background-color:#494b50;}
.subHeader > ul > li{
	display:inline-block;font-size:18px;line-height:35px;
	width:100px;height:35px;text-align:center;border-right:1px solid #333;
}
.subHeader > ul > li > a{color:#fff;}

/* ADMIN CONTAINER */
.adminContainer{width:100%;overflow:hidden;padding-top:85px;}
.adminRightContentInner{width:100%;height:100vh;padding:50px 40px 20px 40px;}

/* ADMIN LEFT MENU */
.adminLeftMenu{width:15%;height:100%;float:left;}
.adminLeftMenuTitle {
	display:flex;justify-content:center;align-items:center;width:100%;height:200px;
	flex-direction:column;border-bottom:1px solid #dee3db;
}
.adminLeftMenuTitle > i{font-size:50px;}
.adminLeftMenuTitle > p{font-size:30px;}

.adminRightContent{width:85%;border-left:1px solid #dee3db;float:left;}
.adminRightContentTop {
	width:100%;height:40px;border-bottom:1px solid #dee3db;line-height:40px;text-indent:20px;
}
.adminRightContentTop > p{font-size:17px;}
.adminRightContent > .adminRightContentInner > h2 {
	display:block;font-size:20px;width:100%;border-bottom:1px solid #333;
	padding-bottom:10px;
}
.adminRightContent > .adminRightContentInner > h2 > span{color:#ccc;font-size:17px;padding-left:10px;font-weight:normal;}

/* 테이블 */
.adminTitleInputContent{width:100%;height:500px;margin-top:20px;}
.adminTitleInputContent > table{width:100%;border-collapse:collapse;}
.adminTitleInputContent > table > tbody > tr:first-child {
	border-top:2px solid #ccc;border-bottom:1px solid #dee3eb;
}
.adminTitleInputContent > table > tbody > tr:last-child {
	border-bottom:1px solid #dee3db;
}
.adminTitleInputContent > table > tbody > tr > td{padding:10px;}
.adminTitleInputContent > table > tbody > tr > td > input[type="text"] {
	border:none;outline:none;font-size:20px;text-indent:5px;width:100%;
}
.adminTitleInputContent > table > tbody > tr > td > textarea {
	font-size:20px;padding:10px;outline:none;width:100%;
}
.adminTitleInputContent > table > tbody > tr > .titleTd {
	background-color:#f6f6f6;font-size:20px;text-indent:5px;
}
















.adminRightContent > .adminRightContentInner > table {
	border-collapse:collapse;width:80%;margin:0 auto;margin-top:50px;font-size:17px;
}
.adminRightContent > .adminRightContentInner > table > thead > tr{border-top:2px solid #333;border-bottom:1px solid #333;}
.adminRightContent > .adminRightContentInner > table > thead > tr > th{padding:10px 40px 10px 40px;font-size:20px;}
.adminRightContent > .adminRightContentInner > table > tbody > tr{border-bottom:1px solid #333;}
.adminRightContent > .adminRightContentInner > table > tbody > tr > td{padding:10px 0px 10px 0px;}
.adminRightContent > .adminRightContentInner > table > tbody > tr > td:nth-child(odd){text-align:center;}
.adminRightContent > .adminRightContentInner > table > tbody > tr > td:nth-child(even){text-indent:20px;}
.adminPagination{width:100%;height:30px;text-align:center;line-height:30px;}
.adminBtns{width:80%;margin:0 auto;margin-top:20px;}
.adminBtns > .adminDelete {
	opacity:0;
	float:left;width:100px;height:30px;border:none;background-color:#333;color:#fff;
	font-size:17px;outline:none;cursor:pointer;border-radius:5px;
}
.adminBtns > .adminCreate {
	float:right;width:100px;height:30px;border:none;background-color:#333;color:#fff;
	font-size:17px;outline:none;cursor:pointer;border-radius:5px;
}
.adminPagination > ul > li{display:inline-block;font-size:20px;}
.adminPagination > ul > li > i{vertical-align:middle;}
.adminPagination > ul > li > a{vertical-align:middle;padding:0px 15px 0px 15px;}


/* ADMIN FOOTER */
.footerContent{width:100%;text-align:center;border-top:1px solid #dee3db;}
.footerContent > p{font-size:18px;padding:20px;line-height:30px;}
.footerContent > p > span{font-weight:bold;}
</style>
</head>

<body>
<div class="header">
	<div class="topHeader">
		<div class="adminLogo">
			CURRENT ADMIN
		</div>
		<div class="adminInfo">
			전체관리자<span>님</span> (admin@admin.com)
		</div>
	</div>
	<div class="subHeader">
		<ul>
			<li><a href="#">공지사항</a></li>
			<li><a href="#">가이드</a></li>
			<li><a href="#">Q&A</a></li>
		</ul>
	</div>
</div>
<div class="adminContainer">
	<div class="adminLeftMenu">
		<div class="adminLeftMenuTitle">
			<i class="icon-settings icons"></i>
			<br>
			<p>공지사항</p>
		</div>
	</div>
	<div class="adminRightContent">
		<div class="adminRightContentTop">
			<p>CURRENT ADMIN > 공지사항</p>
		</div>
		<div class="adminRightContentInner">
			<h2>공지사항 정보 관리<span>공지사항 정보를 변경하실 수 있습니다.</span></h2>
			
			<div class="adminTitleInputContent">
				<table>
					<colgroup width="10%" />
					<colgroup width="90%" />
					<tr>
						<td class="titleTd">제목</td>
						<td><input type="text" value="제목 테스트" /></td>
					</tr>
					<tr>
						<td class="titleTd">내용</td>
						<td>
							<textarea>내용</textarea>
						</td>
					</tr>
				</table>
			</div>
			
			<table>
				<colgroup width="10%" />
				<colgroup width="70%" />
				<colgroup width="20%" />
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>등록일</th>
					</tr>
				<thead>
				<tbody>
					<tr>
						<td>10</td>
						<td>제목</td>
						<td>2018-12-24</td>
					</tr>
					<tr>
						<td>9</td>
						<td>제목</td>
						<td>2018-12-24</td>
					</tr>
					<tr>
						<td>8</td>
						<td>제목</td>
						<td>2018-12-24</td>
					</tr>
					<tr>
						<td>7</td>
						<td>제목</td>
						<td>2018-12-24</td>
					</tr>
					<tr>
						<td>6</td>
						<td>제목</td>
						<td>2018-12-24</td>
					</tr>
					<tr>
						<td>5</td>
						<td>제목</td>
						<td>2018-12-24</td>
					</tr>
					<tr>
						<td>4</td>
						<td>제목</td>
						<td>2018-12-24</td>
					</tr>
					<tr>
						<td>3</td>
						<td>제목</td>
						<td>2018-12-24</td>
					</tr>
					<tr>
						<td>2</td>
						<td>제목</td>
						<td>2018-12-24</td>
					</tr>
					<tr>
						<td>1</td>
						<td>제목</td>
						<td>2018-12-24</td>
					</tr>
				</tbody>
			</table>
			<div class="adminPagination">
				<div class="adminBtns">
					<input type="button" value="삭제" class="adminDelete" />
					<input type="button" value="글쓰기" class="adminCreate" />
				</div>
				<ul>
					<li><i class="icon-arrow-left icons"></i></li>
					<li><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><i class="icon-arrow-right icons"></i></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<div class="footerContent">
        <p>
            대전광역시 중구 중앙로 76 영민빌딩 2층 203호<br>
            기관명: (재)대덕인재개발원, 최종프로젝트 PMS(Project Management System)<br>
            Copyright 2018 <span>DDIT 203 Class, CURRENT</span> All rights reserved.
        </p>
    </div>
</body>
</html>