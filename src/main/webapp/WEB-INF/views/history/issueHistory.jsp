<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="utf-8">
<title></title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js" charset="utf-8"></script>
<script type="text/javascript">
	var curPage = 1;
	
	$(document).ready(function(){	//페이지가 로드되면 데이터를 가져오고 page를 증가시킨다. == $(document).ready(function(){});
		getList(curPage);
		//page++;
	});
	
	var ingFlag = false;
	$(window).scroll(function(){	//스크롤이 최하단으로 내려가면 리스트를 조회하고 page를 증가시킨다.
		//console.log("window-scroll" );
		//console.log(Math.abs($(window).scrollTop() - ($(document).height() - $(window).height())));
		
		if(ingFlag == false){
			//if(Math.abs($(window).scrollTop() - ($(document).height() - $(window).height())) < 3){
			if($(window).scrollTop() == $(document).height() - $(window).height()){
				console.log("scrollTop : " + $(window).scrollTop() + " / height : " + ($(document).height() - $(window).height()));
				getList(curPage);
				ingFlag = true;
			}
		}
// 		else{
// 			return false;
// 		}
	});
	
	function getList(page){
		var sid = '${memberVo.member_mail}';
		var cnt = ${projectCnt};
		var pageSize = 5;
		$.ajax({
			url: '/issueHistoryAjax',
			type: 'POST',
			//dataType: 'json',
			data: {page : page, pageSize : pageSize, member_mail : sid},
			success: function(data){
				//if(data.indexOf("<span>") > 0 ){
				if(page <= cnt){
				
					console.log(data);
					$("#ajaxx").append(data);
					
					curPage++;
					ingFlag = false;
				}else{
					ingFlag = true;
				}
			}
		});
	}
		
	//새로고침시 스크롤바 위치를 0으로 세팅
	$(window).on('beforeunload', function(){
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
	height: 30px;
	background-color: green;
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
