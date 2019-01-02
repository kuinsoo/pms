<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="utf-8">
<title></title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.1.1.min.js" charset="utf-8"></script>
<script type="text/javascript">
var curPage = 1;

$(document).ready(function(){	//페이지가 로드되면 데이터를 가져오고 page를 증가시킨다. == $(document).ready(function(){});
	getList(curPage);
	//page++;
});

var ingFlag = false;

/* 스크롤 최하단시 리스트 조회 및 page 증가 ==문의: jerry== */
$(window).scroll(function() {
	//console.log("window-scroll" );
	//console.log(Math.abs($(window).scrollTop() - ($(document).height() - $(window).height())));
	
	if(ingFlag == false){
		if(Math.abs($(window).scrollTop() - ($(document).height() - $(window).height())) < 1){
		//if($(window).scrollTop() == $(document).height() - $(window).height()){
			console.log("scrollTop : " + $(window).scrollTop() + " / height : " + ($(document).height() - $(window).height()));
			getList(curPage);
			ingFlag = true;
		}
	}
	//else{
	//	return false;
	//}
});

/* 프로젝트별 총기간 및 소요기간 퍼센트 ==문의: jerry== */
function getList(page) {
	var sid = '${memberVo.member_mail}';
	var cnt = ${projectCnt};
	var pageSize = 5;
	
	$.ajax({
		url: '/issueHistoryAjax',
		type: 'POST',
		data: {page : page, pageSize : pageSize, member_mail : sid},
		success: function(data){
			//if(data.indexOf("<span>") > 0 ){
			if(page <= cnt){
				$("#ajaxx").append(data);
				
				curPage++;
				ingFlag = false;
				
			}else{
				ingFlag = true;
			}
		},
		error: function(data){
			console.log("issueHistory.jsp : getList() - error");
		}
	});
}

/* 새로고침시 스크롤바 위치를 0으로 세팅 ==문의: jerry== */
$(window).on('beforeunload', function() {
	return $(window).scrollTop(0);
});

</script>
<style media="screen">
.scroll{
	width:100%;
	height:1000px;
}

.container{
	width: 800px;
	height: auto;
	margin: 0 auto;
}

#myProgress {
	width: 100%;
	background-color: grey;
}

.myBar {
	width: 10px;
	height: 15px;
	background-color: #64FE2E;
}

.issuePin {
	width: 100%;
	height: 15px;
	background-color: #FFFFFF;
}

.pin{
	position: relative;
	width: 9px;
	height: 17px;
	float: left;
}

</style>
</head>
<body>
	<div class="scroll">
		<div class="container" id="ajaxx">
			<!-- issueHistoryAjax.jsp -->
		</div>
	</div>
</body>
</html>
