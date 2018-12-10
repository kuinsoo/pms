<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp" %>
	<style>
		.error{
			color: red;
		}
	</style>
	<script type="text/javascript">
		$(document).ready(function() {
			$(".error").hide();
			//커서의 위치가 다른곳을 선택했을 때의 이벤트 발생
			//blur()이벤트 사용
			$("#pass2").blur(function() {
				if($("#pass2").val() != $("#pass1").val()){
					$(".error").show();
				} else{
					$(".error").hide();
				}
			});

		});
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
						<h2>내 프로필</h2>
						<div class="profileImg">
							<div id="fileList">
								<c:choose>
									<c:when test="${memberVo.member_profile != null}">
										<input type="file" id="fileElem" class="fileInputCSS" value="${memberVo.member_profile}"
										name="member_profile" multiple accept="image/*" style="display:none" onchange="handleFiles(this.files)">									
									</c:when>
									<c:otherwise>
										<img src='/profile/noimage.png' />
									</c:otherwise>
								</c:choose>
							  	<div></div>
							</div>
							<div class="profileUploadImg">
								<a href="#" id="fileSelect"></a>
							</div>
						</div>
					</div>
					<div class="myPageContainerRightUser">
						<div class="userContentsInfoRight_1">
							<ul>
								<li>사용자 이름 </li>
								<li>사용자 이메일</li>
								<li>휴대폰 번호</li>
								<li>비밀번호</li>
								<li>비밀번호 확인</li> 
							</ul>
						</div>
						<div class="userContentsInfoRight_2">
								<ul>
									<li><input type="text" value= "${memberVo.member_name}" name ="member_name"/></li>
									<li><input type="text" value= "${memberVo.member_mail}" disabled="disabled"/></li>
									<li><input type="text"  value= "${memberVo.member_tel}" name ="member_tel"/></li>
									<li><input type="password" id = "pass1" value= "${memberVo.member_pass}" name ="member_pass"/></li>
									<li><input type="password" id = "pass2" value= "${memberVo.member_pass}" /></li>
										<span class="error"> 입력하신 비밀번호가 일치하지 않습니다.</span>
									<li>
										<input type="submit" value="변경" />
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
									<select>
										<option>전체</option>
										<option>프로젝트 명</option>
									</select>
									<input type="text" placeholder="검색어를 입력해주세요"/>
									<i class="icon-magnifier icons"></i>
								</div>
								<table border="1" cellpadding="0" cellspacing="">
									<colgroup width="10%" />
									<colgroup width="60%" />
									<colgroup width="30%" />
									<tr>
										<th><span>번호</span></th>
										<th><span>참여중인 프로젝트 명</span></th>
										<th><span>프로젝트 팀장</span></th>
									</tr>
									<tr>
										<td>10</td>
										<td>테스트 프로젝트</td>
										<td>Legend of Mr. Kku</td>
									</tr>
									<tr>
										<td>9</td>
										<td>테스트 프로젝트</td>
										<td>Legend of Mr. Kku</td>
									</tr>
									<tr>
										<td>8</td>
										<td>테스트 프로젝트</td>
										<td>Legend of Mr. Kku</td>
									</tr>
									<tr>
										<td>7</td>
										<td>테스트 프로젝트</td>
										<td>Legend of Mr. Kku</td>
									</tr>
									<tr>
										<td>6</td>
										<td>테스트 프로젝트</td>
										<td>Legend of Mr. Kku</td>
									</tr>
									<tr>
										<td>5</td>
										<td>테스트 프로젝트</td>
										<td>Legend of Mr. Kku</td>
									</tr>
									<tr>
										<td>4</td>
										<td>테스트 프로젝트</td>
										<td>Legend of Mr. Kku</td>
									</tr>
									<tr>
										<td>3</td>
										<td>테스트 프로젝트</td>
										<td>Legend of Mr. Kku</td>
									</tr>
									<tr>
										<td>2</td>
										<td>테스트 프로젝트</td>
										<td>Legend of Mr. Kku</td>
									</tr>
									<tr>
										<td>1</td>
										<td>테스트 프로젝트</td>
										<td>Legend of Mr. Kku</td>
									</tr>
								</table>
								<p>
									<i class="icon-arrow-left icons"></i>
									<span>1</span>
									<i class="icon-arrow-right icons"></i>
								</p>
							</div>
						</div>
						<div id="tabs2-2">
							<div class="projectTable">
								<div class="projectSearchDiv">
									<select>
										<option>전체</option>
										<option>프로젝트 명</option>
									</select>
									<input type="text" placeholder="검색어를 입력해주세요"/>
									<i class="icon-magnifier icons"></i>
								</div>
								<table border="1" cellpadding="0" cellspacing="0">
									<colgroup width="10%" />
									<colgroup width="60%" />
									<colgroup width="30%" />
									<tr>
										<th><span>번호</span></th>
										<th><span>즐겨찾기 한 프로젝트 명</span></th>
										<th><span>프로젝트 팀장</span></th>
									</tr>
									<tr>
										<td>10</td>
										<td>테스트 프로젝트</td>
										<td>Legend of Mr. Kku</td>
									</tr>
									<tr>
										<td>9</td>
										<td>테스트 프로젝트</td>
										<td>Legend of Mr. Kku</td>
									</tr>
									<tr>
										<td>8</td>
										<td>테스트 프로젝트</td>
										<td>Legend of Mr. Kku</td>
									</tr>
									<tr>
										<td>7</td>
										<td>테스트 프로젝트</td>
										<td>Legend of Mr. Kku</td>
									</tr>
									<tr>
										<td>6</td>
										<td>테스트 프로젝트</td>
										<td>Legend of Mr. Kku</td>
									</tr>
									<tr>
										<td>5</td>
										<td>테스트 프로젝트</td>
										<td>Legend of Mr. Kku</td>
									</tr>
									<tr>
										<td>4</td>
										<td>테스트 프로젝트</td>
										<td>Legend of Mr. Kku</td>
									</tr>
									<tr>
										<td>3</td>
										<td>테스트 프로젝트</td>
										<td>Legend of Mr. Kku</td>
									</tr>
									<tr>
										<td>2</td>
										<td>테스트 프로젝트</td>
										<td>Legend of Mr. Kku</td>
									</tr>
									<tr>
										<td>1</td>
										<td>테스트 프로젝트</td>
										<td>Legend of Mr. Kku</td>
									</tr>
								</table>
								<p>
									<i class="icon-arrow-left icons"></i>
									<span>1</span>
									<i class="icon-arrow-right icons"></i>
								</p>
							</div>
						</div>
						<div id="tabs2-3">
							<div class="projectTable">
								<div class="projectSearchDiv">
									<select>
										<option>전체</option>
										<option>프로젝트 명</option>
									</select>
									<input type="text" placeholder="검색어를 입력해주세요"/>
									<i class="icon-magnifier icons"></i>
								</div>
								<table border="1" cellpadding="0" cellspacing="">
									<colgroup width="10%" />
									<colgroup width="60%" />
									<colgroup width="30%" />
									<tr>
										<th><span>번호</span></th>
										<th><span>일감 리스트</span></th>
										<th><span>프로젝트 팀장</span></th>
									</tr>
									<tr>
										<td>10</td>
										<td>테스트 프로젝트</td>
										<td>Legend of Mr. Kku</td>
									</tr>
									<tr>
										<td>9</td>
										<td>테스트 프로젝트</td>
										<td>Legend of Mr. Kku</td>
									</tr>
									<tr>
										<td>8</td>
										<td>테스트 프로젝트</td>
										<td>Legend of Mr. Kku</td>
									</tr>
									<tr>
										<td>7</td>
										<td>테스트 프로젝트</td>
										<td>Legend of Mr. Kku</td>
									</tr>
									<tr>
										<td>6</td>
										<td>테스트 프로젝트</td>
										<td>Legend of Mr. Kku</td>
									</tr>
									<tr>
										<td>5</td>
										<td>테스트 프로젝트</td>
										<td>Legend of Mr. Kku</td>
									</tr>
									<tr>
										<td>4</td>
										<td>테스트 프로젝트</td>
										<td>Legend of Mr. Kku</td>
									</tr>
									<tr>
										<td>3</td>
										<td>테스트 프로젝트</td>
										<td>Legend of Mr. Kku</td>
									</tr>
									<tr>
										<td>2</td>
										<td>테스트 프로젝트</td>
										<td>Legend of Mr. Kku</td>
									</tr>
									<tr>
										<td>1</td>
										<td>테스트 프로젝트</td>
										<td>Legend of Mr. Kku</td>
									</tr>
								</table>
								<p>
									<i class="icon-arrow-left icons"></i>
									<span>1</span>
									<i class="icon-arrow-right icons"></i>
								</p>
							</div>
						</div>
						<div id="tabs2-4">
							<div class="projectTable">
								<div class="projectSearchDiv">
									<select>
										<option>전체</option>
										<option>프로젝트 명</option>
									</select>
									<input type="text" placeholder="검색어를 입력해주세요"/>
									<i class="icon-magnifier icons"></i>
								</div>
								<table border="1" cellpadding="0" cellspacing="">
									<colgroup width="10%" />
									<colgroup width="60%" />
									<colgroup width="30%" />
									<tr>
										<th><span>번호</span></th>
										<th><span>보관함</span></th>
										<th><span>보관 날짜(?)</span></th>
									</tr>
									<tr>
										<td>10</td>
										<td>테스트 프로젝트</td>
										<td>Legend of Mr. Kku</td>
									</tr>
									<tr>
										<td>9</td>
										<td>테스트 프로젝트</td>
										<td>Legend of Mr. Kku</td>
									</tr>
									<tr>
										<td>8</td>
										<td>테스트 프로젝트</td>
										<td>Legend of Mr. Kku</td>
									</tr>
									<tr>
										<td>7</td>
										<td>테스트 프로젝트</td>
										<td>Legend of Mr. Kku</td>
									</tr>
									<tr>
										<td>6</td>
										<td>테스트 프로젝트</td>
										<td>Legend of Mr. Kku</td>
									</tr>
									<tr>
										<td>5</td>
										<td>테스트 프로젝트</td>
										<td>Legend of Mr. Kku</td>
									</tr>
									<tr>
										<td>4</td>
										<td>테스트 프로젝트</td>
										<td>Legend of Mr. Kku</td>
									</tr>
									<tr>
										<td>3</td>
										<td>테스트 프로젝트</td>
										<td>Legend of Mr. Kku</td>
									</tr>
									<tr>
										<td>2</td>
										<td>테스트 프로젝트</td>
										<td>Legend of Mr. Kku</td>
									</tr>
									<tr>
										<td>1</td>
										<td>테스트 프로젝트</td>
										<td>Legend of Mr. Kku</td>
									</tr>
								</table>
								<p>
									<i class="icon-arrow-left icons"></i>
									<span>1</span>
									<i class="icon-arrow-right icons"></i>
								</p>
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
</div>

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