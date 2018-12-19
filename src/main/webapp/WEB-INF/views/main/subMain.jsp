<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- header & left --%>
<%@ include file="/WEB-INF/views/header.jsp" %>

<%--CURRENT SECTION(MAIN)--%>
<section class="currentMain">
    <div class="currentMainContainer">
        <div class="currentMainContainerLeft">
            <%-- report  --%>
            <%@ include file="/WEB-INF/views/main/report.jsp" %>
            <div class="projectTaskContainer">
                <div class="projectTaskContainerTitle">
                    <i class="far fa-sticky-note"></i><span>WORK CARD</span>
                </div>
            </div>
            <div class="projectTaskContainerDragDrop">
                <div class="projectTaskDragDrop">
                    <ul id="titleList">
                        <li class="titleBox">요청</li>
                        <li class="titleBox">진행</li>
                        <li class="titleBox">이슈발생</li>
                        <li class="titleBox">처리대기</li>
                        <li class="titleBox">완료</li>
                    </ul>
                    <div class="kku-boarder kku-mainPage" id="planList">
                        <%--<%@include file="/WEB-INF/views/card/cardChart.jsp"%>--%>
                    </div>
                </div>
            </div>
            <%-- 등록  --%>
            <%@ include file="/WEB-INF/views/main/projectWriter.jsp" %>

            <%-- 달력 리스트 주석처리중 --%>
			<%@ include file="/WEB-INF/views/main/calendarCardList.jsp" %>
			
            <%--카드리스트--%>
            <div id="submain_work">
                <c:forEach items="${workList}" var="work" varStatus="i">
				    <div class="currentCardList">
				        <h2><i class="icon-speech icons"></i>${work.work_title}</h2>
				        <div class="cardUserInfo">
				            <div class="cardUserInfoImg">
				                <img src="${work.member_profile}">
				            </div>
				            <div class="cardUserInfoName">
				                <b>${work.member_mail}</b><br> <%-- 작성자 --%>
				                <span>${work.work_wdate}</span>
				            </div>
				            <div class="updateDeleteIcon">
				                <i class="icon-wrench icons"></i>
				                <a href="#opens"><i class="icon-bulb icons"></i></a>
				                    <%-- 할일관련 --%>
				                <%@ include file="/WEB-INF/views/todo/todo.jsp" %>
				            </div>
				        </div>
				        <div class="currentCardContentView">
				            <div class="currentCardContentViewLeft">
				                <textarea readonly>${work.work_content}</textarea>
				            </div>
				            <%-- 할일관련 --%>
				            <%@ include file="/WEB-INF/views/todo/todoList.jsp" %>
				        </div>
				        <div class="currentCardContentBottomView">
				            <div id="container${work.work_id}"></div>
				                <%@ include file="/WEB-INF/views/work/testChart.jsp" %>
				        </div>
				
				        <!-- 댓글  -->
				        <div class="cardContentComment">
				            <ul>
				                <li>
				                    <div class="cardContentCommentUser">
				                        <div class="cardContentCommentUserImg">
				                            <img src="${memberVo.member_profile}">
				                        </div>
				                        <div class="cardContentCommentUserName">
				                            <input type="text" class="commentInput" id="cmt_content${i.index}"
				                                   placeholder="댓글을 입력해주세요" required>
				                            <i class="icon-bubble icons"
				                               onclick="insertCmt('${work.work_id}', 'cmt_content${i.index}');"></i>
				                        </div>
				                    </div>
				                </li>
				            </ul>
				            <c:forEach items="${cmtList}" var="cmt">
				                <c:if test="${cmt.cmt_work eq  work.work_id}">
				                    <ul>
				                        <li>
				                            <div class="cardContentCommentUser">
				                                <div class="cardContentCommentUserImg">
				                                    <img src="${cmt.member_profile}">
				                                </div>
				                                <div class="cardContentCommentUserName">
				                                    <b>${cmt.member_name}</b><span class="times">${cmt.cmt_date}</span>
				                                    <input type="button" value="수정" class="commentUpdateBtn"/>
				                                    <input type="button" value="삭제" class="commentDeleteBtn"/>
				                                    <br>
				                                    <span>${cmt.cmt_content}</span>
				                                </div>
				                            </div>
				                        </li>
				                    </ul>
				                </c:if>
				            </c:forEach>
				        </div>
				    </div> <%-- 끝--%>
				</c:forEach>
            </div>
            <%-- submainwork --%>
        </div>
        <%-- MainController --%>

        <div class="currentMainContainerRight">
            <div class="currentSubMainTitle">
                <i class="icon-star icons"></i>
                <span>${projectVo.project_title}</span>
                <!--
                <i class="icon-share icons dialog__triggerss"></i>
                <div class="dialogss">
                    <ul>
                        <li>프로젝트 설정</li>
                        <li>알림(푸쉬) 설정</li>
                        <li>프로젝트 숨기기</li>
                    </ul>
                </div>
                -->
            </div>
            <div class="projectTeamsTop">
                <!-- (변찬우) for node // 외부에서 접근해서 인증 허용 해줘야 함..  -->
                <iframe src="https://127.0.0.1:8443/"></iframe>
            </div>
            <%-- 참여자 목록 --%>
            <%@ include file="/WEB-INF/views/main/participants.jsp" %>
        </div>
    </div>
</section>

<%@ include file="/WEB-INF/views/main/footer.jsp" %>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.2/js/swiper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="js/classie.js"></script>
<script>
// DIM POPUP - 팀원초대
$('.projectCreatePopUps').click(function () {
   var $hrefs = $(this).attr('href');
   layer_popups($hrefs);
});

function layer_popups(els) {
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
         marginTop: -$elHeights / 2,
         marginLeft: -$elWidths / 2
      })
   } else {
      $els.css({top: 0, left: 0});
   }

   $els.find('a.btn-layerCloses').click(function () {
      isDims ? $('.dim-layers').fadeOut() : $els.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
      return false;
   });

   $('.layer .dimBgs').click(function () {
      $('.dim-layers').fadeOut();
      return false;
   });
}

var menuLeft = document.getElementById('cbp-spmenu-s1'),
   showLeftPush = document.getElementById('showLeftPush'),
   body = document.body;

$("#showLeftPush").click(function () {
   classie.toggle(this, 'active');
   classie.toggle(body, 'cbp-spmenu-push-toright');
   classie.toggle(menuLeft, 'cbp-spmenu-open');
});

function dialog() {
   var dialogBox = $('.dialog'),
      dialogTrigger = $('.dialog__trigger'),
      dialogAction = $('.dialog__action');

   // Open the dialog
   dialogTrigger.on('click', function (e) {
      dialogBox.toggleClass('dialog--active');
      e.stopPropagation()
   });

   $(".dialog").click(function () {
      dialogBox.toggleClass('dialog--active');
   });

   $(".dialog__triggers").click(function () {
      dialogBox.removeClass('dialog--active');
   });
   $(".dialog__triggerss").click(function () {
      dialogBox.removeClass('dialog--active');
   });

   // Close the dialog - press escape key // key#27
   $(document).keyup(function (e) {
      if (e.keyCode === 27) {
         dialogBox.removeClass('dialog--active');
      }
   });
};

// Run function when the document has loaded
$(function () {
   dialog();
});

function dialogs() {
   var dialogBoxs = $('.dialogs'),
      dialogTriggers = $('.dialog__triggers'),
      dialogActions = $('.dialog__actions');

   // Open the dialog
   dialogTriggers.on('click', function (e) {
      dialogBoxs.toggleClass('dialog--actives');
      e.stopPropagation()
   });

   $(".dialogs").click(function () {
      dialogBoxs.toggleClass('dialog--actives');
   });

   $(".dialog__trigger").click(function () {
      dialogBoxs.removeClass('dialog--actives');
   });
   $(".dialog__triggerss").click(function () {
      dialogBoxs.removeClass('dialog--actives');
   });

   // Close the dialog - press escape key // key#27
   $(document).keyup(function (e) {
      if (e.keyCode === 27) {
         dialogBoxs.removeClass('dialog--actives');
      }
   });
};

// Run function when the document has loaded
$(function () {
   dialogs();
});

function dialogss() {
   var dialogBoxss = $('.dialogss'),
      dialogTriggerss = $('.dialog__triggerss'),
      dialogActionss = $('.dialog__actionss');

   // Open the dialog
   dialogTriggerss.on('click', function (e) {
      dialogBoxss.toggleClass('dialog--activess');
      e.stopPropagation()
   });

   $(".dialog__trigger").click(function () {
      dialogBoxss.removeClass('dialog--activess');
   });

   $(".dialog__triggers").click(function () {
      dialogBoxss.removeClass('dialog--activess');
   });

   // Close the dialog - press escape key key#27
   $(document).keyup(function (e) {
      if (e.keyCode === 27) {
         dialogBoxss.removeClass('dialog--activess');
      }
   });
};

// Run function when the document has loaded
$(function () {
   dialogss();
});

// 알람 탭 메뉴
$("#tabs").tabs();

// 서브 메인 작성 카드 리스트
$("#tabss").tabs();

var ctx = document.getElementById("myChart").getContext('2d');
var myChart = new Chart(ctx, {
   type: 'pie',
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
               beginAtZero: true
            }
         }]
      }
   }
});

$(document).ready(function () {
   $('.kku-hide').hide();

   updateCard('0', '0', 0, '${projectVo.project_id}');

   // html dom 이 다 로딩된 후 실행된다.
   $(document).ready(function () {
      // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
      $(".projectTeams > h2").click(function () {
         var submenu = $(this).next("ul");

         // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
         if (submenu.is(":visible")) {
            submenu.slideUp();
         } else {
            submenu.slideDown();
         }
      });
   });


});
$(function () {
   var tabs = $("#planList").tabs();
   tabs.find(".column").sortable({
      connectWith: ".column",
      handle: ".portlet-header",
      cancel: ".portlet-toggle",
      placeholder: "portlet-placeholder ui-corner-all",
      stop: function (event, ui) {
         var prev = isNaN(parseFloat(ui.item.prev().children(".kku-index").text())) ? 9999999 : parseInt(ui.item.prev().children(".kku-index").text());
         var next = isNaN(parseFloat(ui.item.next().children(".kku-index").text())) ? 0 : parseInt(ui.item.next().children(".kku-index").text());
         var index = prev - ((prev - next) / 2);
         var no = parseInt(ui.item.children(".kku-no").text());
         var group = ui.item.prev().children(".kku-group").text();
         if (group === "") {
            group = ui.item.next().children(".kku-group").text();
         }
         // alert(next)
         // alert(index)
         // alert(index)

         //alert(ui.item.prev().index());
         //alert(ui.item.prev().text()) //전값
         //alert(ui.item.text()) //현재값
         //alert(ui.item.next().text()) //다음값
         tabs.tabs("refresh");
         updateCard(no, group, index);
      }
   });

   $(".portlet")
      .addClass("ui-widget ui-widget-content ui-helper-clearfix ui-corner-all")
      .find(".portlet-header")
      .addClass("ui-widget-header ui-corner-all")
      .prepend("<span class='ui-icon ui-icon-minusthick portlet-toggle'></span>");

   $(".portlet-toggle").on("click", function () {
      var icon = $(this);
      icon.toggleClass("ui-icon-minusthick ui-icon-plusthick");
      icon.closest(".portlet").find(".portlet-content").toggle();
   });
});

/*
function updateCard(no, group, index){
   location.href = "/updateCard?card_no="+no+"&card_group="+group+"&card_index="+index;
}; */


function createWork() {
   var param = $('form[name=workfrm1]').serialize();
   $.ajax({
      method: "POST",
      url: "/ajaxCreateWork",
      data: param,
      success: function (data) {
         $('#submain_work').html("");
         $('#submain_work').html(data);
         updateCard('0', '0', 0, '${projectVo.project_id}');
      },
      error: function (data) {
      }
   });
}

function insertCmt(work_id, cmt_content) {
   var cmt_contenta = $('#' + cmt_content).val();
   $.ajax({
      method: "GET",
      url: "/ajaxInsertCmt",
      data: {"work_id": work_id, "cmt_content": cmt_contenta, "project_id": ${projectVo.project_id}},
      success: function (data) {
         $('#submain_work').html("");
         $('#submain_work').html(data);
      },
      error: function (data) {
      }
   });
}

//submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
// if (submenu.is(":visible")) {
// submenu.slideUp();
// } else {
// submenu.slideDown();
// }

function updateCard(no, group, index) {

   $.ajax({
      type: "GET",
      url: "/ajaxUpdateCard",
      data: {"wc_id": no, "wc_group": group, "wc_index": index, "project_id":${projectVo.project_id}},
      success: function (data) {
         $('#planList').html("");
         $('#planList').html(data);
         $('.kku-hide').hide();
      }
   });

   // location.href = "/updateCard?wc_id="+no+"&wc_group="+group+"&wc_index="+index+"&project_id=${projectVo.project_id}";
};
</script>

</body>
</html>