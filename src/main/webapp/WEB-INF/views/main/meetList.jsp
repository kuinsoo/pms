<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>

/* DIM LAYER POPUP */
.pop-layer .pop-container {
    background-color: #fff;
    border-radius: 10px;
}

.pop-layer {
    display: none;
    position: absolute;
    top: 50%;
    left: 50%;
    width: 600px;
    height: auto;
    z-index: 10;
}

.dim-layer {
    display: none;
    position: fixed;
    _position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: 100;
}

.dim-layer .dimBg {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: #000;
    opacity: .5;
    filter: alpha(opacity=50);
}

.dim-layer .pop-layer {
    display: block;
    width: 600px;
}

.pop-layer .pop-container > .pop-conts > .pop-conts-header {
    width: 100%;
    height: 50px;
    background-color: #eee;
    font-size: 20px;
    border-radius: 10px 10px 0px 0px;
}

.pop-layer .pop-container > .pop-conts > .pop-conts-header > p {
    float: left;
    padding: 15px;
}

.pop-layer .pop-container > .pop-conts > .pop-conts-header > a {
    float: right;
    padding: 15px;
    color: #000;
}

.pop-layer .pop-container > .pop-conts > .pop-conts-section {
    width: 100%;
    font-size: 20px;
    clear: both;
}

.pop-layer .pop-container > .pop-conts > .pop-conts-section > .pop-conts-section-title {
    width: 100%;
    padding: 20px;
}

.pop-layer .pop-container > .pop-conts > .pop-conts-section > .pop-conts-section-title > span {
    margin-left: 7px;
}

.pop-layer .pop-container > .pop-conts > .pop-conts-section > .pop-conts-section-title > form > .projectTitleInput {
    margin-top: 7px;
    font-size: 20px;
    width: 100%;
    outline: none;
    padding: 5px;
}
.layerPopupClose {
    display: block;
    border: 1px solid #ccc;
    width: 100px;
    height: 50px;
    border-radius: 5px;
    float: left;
    text-align: center;
    line-height: 50px;
    margin-left: 20px;
    color: #000;
}
/* settings layer popup */
.white_content {
	position:fixed;top:0;right:0;bottom:0;left:0;background:rgba(0, 0, 0, 0.8);opacity:0;
	-webkit-transition: opacity 400ms ease-in;-moz-transition: opacity 400ms ease-in;
	transition: opacity 400ms ease-in;pointer-events:none;z-index:4;
}
.white_content:target{opacity:1;pointer-events:auto;}
.white_content > div {
	position:absolute;top:50%;left:50%;margin-top:-250px;margin-left:-300px;
	width:600px;height:500px;border:1px solid #dee3eb;border-radius:10px;
	background-color:white;overflow:hidden;
}
.white_content > div > .mainCloseBtns {
	float:right;display:block;color:#000;width:30px;height:30px;overflow:hidden;
	background-image:url("../images/xButtonClose.png");background-repeat:no-repeat;background-size:cover;
}
.white_content > div > .mainCloseBtns > i{font-size:20px;}

.btnField{line-height:40px;margin-top:60px;}
.btnField > h2{color:#000;font-size:20px;}
.btnField > h2 > span{color:#f00;}
.projectUpdateSettings{border:none;cursor:pointer;width:100%;height:30px;background-color:#746fcc;color:#fff;font-size:20px;outline:none;}
.projectDeleteSettings{border:none;cursor:pointer;width:100%;height:30px;background-color:#746fcc;color:#fff;font-size:20px;outline:none;}

</style>

<div class="meetList">
    <div class="meetListTitles">
        <i class="far fa-newspaper"></i>
        <span>지난 회의목록</span>
    </div>
    <div class="meets">
		<table class="table">
			<thead>
				<tr>
					<th>no</th>
					<th>회의제목</th>
					<th>개설자</th>
					<th>회의록</th>
					<th>대화록</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody id="meetingListAjax">
				<tr>
					<td colspan="6">아직 진행된 회의가 없습니다.  |  ${projectVo.project_id}</td>
				</tr>
			</tbody>
		</table>
    </div>
</div>
<script>
$(document).ready(function(){
	var project_id = ${projectVo.project_id};
	getMeetingListAjax(project_id);
	
});

function getMeetingListAjax(project_id){
	(function poll(){
		$.ajax({
		    url : '/meetingList',
		    type : 'post',
		    data : {"project_id" : project_id},
		    success : function (data) {
		    	console.log("call~ java ");
				$('#meetingListAjax').html("");
				$('#meetingListAjax').html(data);
		    },
		    error: function (data) {
		    	location.href = "/";
				// alert("error");
			},
		    timeout: 3000,
		    complete: setTimeout(function(){ poll(); }, 6000)
		 })
	})();
};


</script>
