<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp" %>
	<style>
		.error{
			color: red;
		}
		.telerror{
			color: red;
		}
		.inputerror{
			color: red;
		}
	
	</style>
	<script type="text/javascript">
		$(document).ready(function() {
			
			getMyPageList(1);
			
			$(".phoneBtns").hide();
			$(".saveBtn").hide();
			$("#pass2").hide();				
			$("#pass2input").hide();				
			$("#telnum").hide();				
			$("#telnumLi").hide();		
			$('#member_name').prop('readonly', true);
			$('#member_tel').prop('readonly', true);
			$('#pass1').prop('readonly', true);
			$(".error").hide();
			$(".telerror").hide();
			$(".inputerror").hide();
			
			$(".updateBtn").click(function(){	
				$(".profileUploadImg").show();
				$(".phoneBtns").show();
				$(".saveBtn").show();
				$("#pass2").show();				
				$("#pass2input").show();				
				$("#telnum").show();				
				$("#telnumLi").show();		
				$(".updateBtn").hide();
				
				$('#member_name').prop('readonly', false);
				$('#member_tel').prop('readonly', false);
				$('#pass1').prop('readonly', false);
			});
			
			$('.saveBtn').prop('disabled', true);
			$(".phoneBtns").click(function(){	
				$('.saveBtn').prop('disabled', true);
				$(".inputerror").show();
			});
			var certificationNumber;
			
			//커서의 위치가 다른곳을 선택했을 때의 이벤트 발생
			//blur()이벤트 사용
			$("#pass2input").blur(function() {
				if($("#pass2input").val() != $("#pass1").val()){
					$(".error").show();
					$('.saveBtn').prop('disabled', true);
				} else{
					$(".error").hide();
					$('.saveBtn').prop('disabled', false);
				}
			});
			$('.saveBtn').prop('disabled', false);
	
			$("#fileElem").change(function(){
				console.log("fileChange");
				
				 //var files = e.originalEvent.dataTransfer.files;
				var file = $(this)[0].files[0];
	    	    	
		    	var reader = new FileReader();
		        reader.readAsDataURL(file);
		        reader.onload = function(readEvent) {
		        	
		        	//$("#fileList").css("background-image", readEvent.target.result);
		        	
		        	 //$("#fileList").css("src", window.URL.createObjectURL(file));
		        	 
		        	 $("#fileList").css("background-image", window.URL.createObjectURL(file));
		        	
		        	/*var img = $("<img/>", {
		    			src : readEvent.target.result,
		    			width : 120,
		    			height : 120
		    		});
		        	
		        	$("#test").prepend(img.clone());*/
		        	
		        	//$("#pic").hide();
		       	}
			    
			});
		});
		
		<!-- 핸드폰 번호 입력 후 인증 버튼 -->
		function telAjax(){
			var member_tel = $("#member_tel").val();
			$.ajax({
				type :"GET",
				url :"/myPageAjax",
				data : "member_tel="+member_tel,
				success : function(data){
					certificationNumber = data;
				}
			});
		}
		function onkeyup_event(){
			if(certificationNumber == $("#telnum").val()){
				$(".telerror").hide();
				$(".inputerror").hide();
				$('.saveBtn').prop('disabled', false);
			}else{
				$(".telerror").show();
				$(".inputerror").hide();
				$('.saveBtn').prop('disabled', true);
			}
		}
		
		// 페이징 처리 Ajax
		function getMyPageList(page){
			var pageSize = 10;
			
			$.ajax({
				type: "GET",
				url : "/myPageProjectAjax",
				data: {"page":page, "pageSize":pageSize},
				success : function(data){
					var html ="";
					$.each(data.projectList, function (idx,my){
						html += "<tr>";
						html += "	<td>"+ my.rnum +"</td>";
						html += "	<td>"+ my.project_title +"</td>";
						html += "	<td>"+ my.pmember_member +"</td>";
						html += "</tr>";
					});
			
					$("#projectList").html("");
					$("#projectList").html(html);
				
					var paging ="";
						paging +="<li><a href='javascript:getMyPageList("+ i +");'aria-label='Previous'><span aria-hidden='true'>&laquo;</span>";
						for(var i= 1; i<=data.pageCnt; i++) {
							paging += "<li><a href='javascript:getMyPageList("+ i +");'>"+ i+ "</a></li>";
						}
							paging +="<li><a href='javascript:getMyPageList("+ data.pageCnt +");'aria-label='Next'><span aria-hidden='true'>&raquo;</span>";
					$(".pagination").html(paging);
				},
				fail : function(xhr){
					console.log(xhr);
				}
			});
		}
			
		// 검색 Ajax	
		function getSearchProject(){
		var param = $('form[name=searchProject]').serialize();
			
			$.ajax({
				type: "POST",
				url : "/searchProjectAjax",
				data: param,
				success : function(data){
						console.log("data : " + data);
					var html ="";
					$.each(data.projectList, function (idx,my){
						html += "<tr>";
						html += "	<td>"+ my.rnum +"</td>";
						html += "	<td>"+ my.project_title +"</td>";
						html += "	<td>"+ my.pmember_member +"</td>";
						html += "</tr>";
					});
					
					$("#projectList").html("");
					$("#projectList").html(html);
				
					var paging ="";
						paging +="<li><a href='javascript:getMyPageList("+ i +");'aria-label='Previous'><span aria-hidden='true'>&laquo;</span>";
						for(var i= 1; i<=data.pageCnt; i++) {
							paging += "<li><a href='javascript:getMyPageList("+ i +");'>"+ i+ "</a></li>";
						}
							paging +="<li><a href='javascript:getMyPageList("+ data.pageCnt +");'aria-label='Next'><span aria-hidden='true'>&raquo;</span>";
					$(".pagination").html(paging);
				},
				fail : function(xhr){
					console.log(xhr);
				}
			});
		}
	
	</script>
	
	<!-- CURRENT SECTION(MAIN) -->	
	<section class="currentMain">
		<div class="currentMainContainer">
			<div class="myPageContainer">
				<div class="myPageContainerTitle">
					<h2>사용자 기본 정보</h2>
				</div>
				<!-- 사용자 정보 -->
				<form action="/myPageUpdate" method="post" enctype="multipart/form-data">
				<div class="myPageContainerLeft">
					<div class="myPageContainerLeftUser">
						<h2>${memberVo.member_name}님의 프로필</h2>
						<div class="profileImg">
							<div id="fileList" style="background-image:url('${memberVo.member_profile}');background-repeat:no-repeat;background-position:50% 50%;background-size:cover;">
								<c:choose>
									<c:when test="${memberVo.member_profile != null}">
										<input type="file" name="member_profile" id="fileElem" class="fileInputCSS" multiple accept="image/*" style="display:none">								
									</c:when>
									<c:otherwise>
										<div>
										<input type="file" name="member_profile" id="fileElem" class="fileInputCSS" multiple accept="image/*" style="display:none" onchange="handleFiles(this.files)">
										</div>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="profileUploadImg">
								<a href="#" id="fileSelect"></a>
							</div>
						</div>
					</div>
					<div class="myPageContainerRightUser">
						<div class="userContentsInfoRight_1">
							<ul id="test">
								<li>사용자 이메일</li>
								<li>사용자 이름 </li>
								<li>휴대폰 번호</li>
								<li id = "telnumLi">인증번호 입력</li>
								<li>비밀번호</li>
								<li id = "pass2">비밀번호 확인</li> 
							</ul>
						</div>
						<div class="userContentsInfoRight_2">
							<ul>
								<li><input type="text" value= "${memberVo.member_mail}" disabled="disabled" id = "member_mail"  name = "member_mail"/></li>
								<li><input type="text" value= "${memberVo.member_name}" name ="member_name" id ="member_name"/></li>
								<li><input type="text"  value= "${memberVo.member_tel}" name ="member_tel"  id ="member_tel"/>
									<input type="button" onclick="telAjax();" value="인증" class="phoneBtns" />
								<li><input type="text" id ="telnum" onkeyup="onkeyup_event();"/>
									<span class = "inputerror"> 인증번호를 입력해 주세요..</span>
									<span class= "telerror"> 인증번호가 일치하지 않습니다.</span>
								</li>
								<li><input type="password" id = "pass1" value= "${memberVo.member_pass}" name ="member_pass"/></li>
								<li>
									<input type="password" id = "pass2input" value= "${memberVo.member_pass}" />
									<span class="error"> 입력하신 비밀번호가 일치하지 않습니다.</span>
								</li>
								<li>
									<input type="button" value="변경" class = "updateBtn"/>
									<input type="submit" value="확인" class = "saveBtn"/>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</form>				
				<div class="myPageContainerRight">
					<div class="myPageContainerRightLeftChart">
						<canvas id="myChart" width="349" height="500"></canvas>
					</div>
					<div class="myPageContainerRightRightChart">
						<canvas id="myChart2" width="349" height="500"></canvas>
					</div>
				</div>
				<div class="myPageBottomContainer">
					<div id="tabs2">
						<ul>
							<li><a href="#tabs2-1">참여중인 프로젝트</a></li>
							<li><a href="#tabs2-2">즐겨찾기한 프로젝트</a></li>
							<li><a href="#tabs2-3">일감 조회</a></li>
							<li><a href="#tabs2-4">보관함</a></li>
							<li><a href="#tabs2-5">회원탈퇴</a></li>
						</ul>
						<div id="tabs2-1">
							<div class="projectTable">
								<div class="projectSearchDiv">　　
									<form name ="searchProject" method="POST" onsubmit="return false;">
										<input type="text" id="searchText" name ="searchText" value='${searchText}'  placeholder="검색어를 입력해주세요"/>
										<input type="hidden" name="page" value='1' />
										<input type="hidden" name="pageSize" value='10' />
										<i class="icon-magnifier icons searchBtn" onclick="javascript:getSearchProject();"></i>  
									</form>
								</div>
								<table>
									<colgroup width="10%" />
									<colgroup width="60%" />
									<colgroup width="30%" />
									<thead>
										<tr>
											<th><span>번호</span></th>
											<th><span>참여중인 프로젝트 명</span></th>
											<th><span>프로젝트 팀장</span></th>
										</tr>
									</thead>
									<tbody id ="projectList">
									<%-- <c:forEach items="${projectList}" var = "vo">
										<tr>
											<td>${vo.rnum}</td>
											<td>${vo.project_title}</td>
											<td>${vo.pmember_member}</td>
										</tr>
										</c:forEach> --%>
									</tbody>
								</table>
								<div class="text-center">
									 <ul class="pagination"></ul>
								</div>
							</div>
						</div>
						<div id="tabs2-2">
							<div class="projectTable">
								<div class="projectSearchDiv">　　
									<form name="searchProject" method="POST" onsubmit="return false;">
										<!-- <input type="text" id="searchText" name ="searchText" value='${searchText}'  placeholder="검색어를 입력해주세요"/> -->
									<form name ="searchProject" method="POST" onsubmit="return false;">
										<!--  <input type="text" id="searchText" name ="searchText" value='${searchText}'  placeholder="검색어를 입력해주세요"/>-->
										<input type="hidden" name="page" value='1' />
										<input type="hidden" name="pageSize" value='10' />
										<i class="icon-magnifier icons searchBtn" onclick="javascript:getSearchProject();"></i>  
									</form>
								</div>
								<table>
									<colgroup width="10%" />
									<colgroup width="60%" />
									<colgroup width="30%" />
									<thead>
										<tr>
											<th><span>번호</span></th>
											<th><span>즐겨찾기한 프로젝트 명</span></th>
											<th><span>프로젝트 팀장</span></th>
										</tr>
									</thead>
									<tbody id ="projectList">
									<%-- <c:forEach items="${projectList}" var = "vo">
										<tr>
											<td>${vo.rnum}</td>
											<td>${vo.project_title}</td>
											<td>${vo.pmember_member}</td>
										</tr>
										</c:forEach> --%>
									</tbody>
								</table>
								<div class="text-center">
									 <ul class="pagination"></ul>
								</div>
							</div>
						</div>
						<div id="tabs2-3">
							<div class="projectTable">
								<div class="projectSearchDiv">　　
									<form name ="searchProject" method="POST" onsubmit="return false;">
										<!-- <input type="text" id="searchText" name ="searchText" value='${searchText}'  placeholder="검색어를 입력해주세요"/> -->
										<!--  <input type="text" id="searchText" name ="searchText" value='${searchText}'  placeholder="검색어를 입력해주세요"/>-->
										<input type="hidden" name="page" value='1' />
										<input type="hidden" name="pageSize" value='10' />
										<i class="icon-magnifier icons" onclick="javascript:getSearchProject();"></i>  
									</form>
								</div>
								<table>
									<colgroup width="10%" />
									<colgroup width="60%" />
									<colgroup width="30%" />
									<thead>
										<tr>
											<th><span>번호</span></th>
											<th><span>참여중인 프로젝트 명</span></th>
											<th><span>프로젝트 팀장</span></th>
										</tr>
									</thead>
									<tbody id ="projectList">
									<%-- <c:forEach items="${projectList}" var = "vo">
										<tr>
											<td>${vo.rnum}</td>
											<td>${vo.project_title}</td>
											<td>${vo.pmember_member}</td>
										</tr>
										</c:forEach> --%>
									</tbody>
								</table>
								<div class="text-center">
									 <ul class="pagination"></ul>
								</div>
							</div>
						</div>
						<div id="tabs2-4">
							<div class="projectTable">
								<div class="projectSearchDiv">　　
									<form name ="searchProject" method="POST" onsubmit="return false;">
										<!-- <input type="text" id="searchText" name ="searchText" value='${searchText}'  placeholder="검색어를 입력해주세요"/> -->
										<!--  <input type="text" id="searchText" name ="searchText" value='${searchText}'  placeholder="검색어를 입력해주세요"/>-->
										<input type="hidden" name="page" value='1' />
										<input type="hidden" name="pageSize" value='10' />
										<i class="icon-magnifier icons" onclick="javascript:getSearchProject();"></i>  
									</form>
								</div>
								<table>
									<colgroup width="10%" />
									<colgroup width="60%" />
									<colgroup width="30%" />
									<thead>
										<tr>
											<th><span>번호</span></th>
											<th><span>참여중인 프로젝트 명</span></th>
											<th><span>프로젝트 팀장</span></th>
										</tr>
									</thead>
									<tbody id ="projectList">
									<%-- <c:forEach items="${projectList}" var = "vo">
										<tr>
											<td>${vo.rnum}</td>
											<td>${vo.project_title}</td>
											<td>${vo.pmember_member}</td>
										</tr>
										</c:forEach> --%>
									</tbody>
								</table>
								<div class="text-center">
									 <ul class="pagination"></ul>
								</div>
							</div>
						</div>
						<div id="tabs2-5">
							<div class="tabs2-5center">
								<p>정말로 탈퇴 하실건가요?ㅜㅜ</p>
								<input type="button" value="응 탈퇴ㅂㅂ" class="goodbyeBtn" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<footer class="currentFooter">
		<div class="footerContent">
			<p>
				대전광역시 중구 중앙로 76 영민빌딩 2층 203호<br>
				기관명: (재)대덕인재개발원, 최종프로젝트 PMS(Project Management System)<br>
				Copyright 2018 <span>DDIT 203 Class, CURRENT</span> All rights reserved. 
			</p>
		</div>
	</footer>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.2/js/swiper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.js"></script>
<script type="text/javascript" src="js/classie.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<script>
// DIM POPUP - 팀원초대
$('.projectCreatePopUps').click(function(){
    var $hrefs = $(this).attr('href');
    layer_popups($hrefs);
});
function layer_popups(els){
    var $els = $(els);        //레이어의 id를 $el 변수에 저장
    var isDims = $els.prev().hasClass('dimBgs');   //dimmed 레이어를 감지하기 위한 boolean 변수

    isDims ? $('.dim-layers').fadeIn() : $els.fadeIn();

    var $elWidths = ~~($els.outerWidth()),
        $elHeights = ~~($els.outerHeight()),
        docWidths = $(document).width(),
        docHeights = $(document).height();

    // 화면의 중앙에 레이어를 띄운다.
    if ($elHeights < docHeights || $elWidths < docWidths) {
        $els.css({
            marginTop: -$elHeights /2,
            marginLeft: -$elWidths/2
        })
    } else {
        $els.css({top: 0, left: 0});
    }

    $els.find('a.btn-layerCloses').click(function(){
        isDims ? $('.dim-layers').fadeOut() : $els.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
        return false;
    });

    $('.layer .dimBgs').click(function(){
        $('.dim-layers').fadeOut();
        return false;
    });
}

var menuLeft = document.getElementById('cbp-spmenu-s1'),
	 showLeftPush = document.getElementById('showLeftPush'),
	 body = document.body;

$("#showLeftPush").click(function(){
	classie.toggle( this, 'active' );
	classie.toggle( body, 'cbp-spmenu-push-toright' );
	classie.toggle( menuLeft, 'cbp-spmenu-open' );
});

function dialog(){
	var dialogBox = $('.dialog'),
		 dialogTrigger = $('.dialog__trigger'),
		 dialogAction = $('.dialog__action');
		 
		 // Open the dialog
		 dialogTrigger.on('click', function(e){
			 dialogBox.toggleClass('dialog--active');
			 e.stopPropagation()
		 });

		 $(".dialog").click(function(){
			 dialogBox.toggleClass('dialog--active');
		 });

		 $(".dialog__triggers").click(function(){
			 dialogBox.removeClass('dialog--active');
		 });

		 // Close the dialog - press escape key // key#27
		 $(document).keyup(function(e){
			 if(e.keyCode === 27){
				 dialogBox.removeClass('dialog--active');
			 }
		 });
};

// Run function when the document has loaded
$(function(){
	dialog();
});

function dialogs(){
	var dialogBoxs = $('.dialogs'),
		 dialogTriggers = $('.dialog__triggers'),
		 dialogActions = $('.dialog__actions');
		 
		 // Open the dialog
		 dialogTriggers.on('click', function(e){
			 dialogBoxs.toggleClass('dialog--actives');
			 e.stopPropagation()
		 });

		 $(".dialogs").click(function(){
			 dialogBoxs.toggleClass('dialog--actives');
		 });

		 $(".dialog__trigger").click(function(){
			 dialogBoxs.removeClass('dialog--actives');
		 });

		 // Close the dialog - press escape key // key#27
		 $(document).keyup(function(e){
			 if(e.keyCode === 27){
				 dialogBoxs.removeClass('dialog--actives');
			 }
		 });
};

// Run function when the document has loaded
$(function(){
	dialogs();
});

// 알람 탭 메뉴
$("#tabs").tabs();

// 마이페이지 하단 탭 메뉴
$("#tabs2").tabs();

window.URL = window.URL || window.webkitURL;

var fileSelect = document.getElementById("fileSelect"),
    fileElem = document.getElementById("fileElem"),
    fileList = document.getElementById("fileList");

fileSelect.addEventListener("click", function (e) {
  if (fileElem) {
    fileElem.click();
  }
  e.preventDefault(); // prevent navigation to "#"
}, false);

function handleFiles(files) {
  if (!files.length) {
    fileList.innerHTML = "";
  } else {
    fileList.innerHTML = "";
    var list = document.createElement("div");
    fileList.appendChild(list);
    for (var i = 0; i < files.length; i++) {
            
      var img = document.createElement("img");
      img.src = window.URL.createObjectURL(files[i]);
      img.height = 150;
      img.onload = function() {
        window.URL.revokeObjectURL(this.src);
      }
      list.appendChild(img);
    }
  }
}

var ctx = document.getElementById("myChart").getContext('2d');
var myChart = new Chart(ctx, {
    type: 'line',
    data: {
        labels: ["요청", "진행", "피드백", "완료", "보류"],
        datasets: [{
            label: '',
            data: [12, 19, 3, 5, 2],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)'
            ],
            borderColor: [
                'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero:true
                }
            }]
        }
    }
});

var ctx2 = document.getElementById("myChart2").getContext('2d');
var myChart2 = new Chart(ctx2, {
    type: 'horizontalBar',
    data: {
        labels: ["요청", "진행", "피드백", "완료", "보류"],
        datasets: [{
            label: '',
            data: [12, 19, 3, 5, 2],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)'
            ],
            borderColor: [
                'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero:true
                }
            }]
        }
    }
});

$(".goodbyeBtn").click(function(){
	confirm("진짜 탈퇴하는건가유?!");
});
</script>
</body>
</html>