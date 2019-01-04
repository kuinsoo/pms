<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- header & left --%>
<%@ include file="/WEB-INF/views/header.jsp" %>

<%--CURRENT SECTION(MAIN)--%>
<section class="currentMain">
    <div class="currentMainContainer">
        <div class="currentMainContainerLeft">
            <div id="subMainTabMenu">
                <ul class="subMaintab">
                    <li class="current" data-tab="subMaintab1"><a href="#">업무 리포트</a></li>
                    <li data-tab="subMaintab2"><a href="#">업무 카드</a></li>
                    <li data-tab="subMaintab3"><a href="#">간트 차트</a></li>
                    <li data-tab="subMaintab4"><a href="#">회의 리스트</a></li>
                </ul>
                <div id="subMaintab1" class="tabcontent current">
                    <%@ include file="/WEB-INF/views/main/report.jsp" %>
                </div>

                <div id="subMaintab2" class="tabcontent">
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
                </div>
                
                <div id="subMaintab3" class="tabcontent">
                    <%-- 간트 차드 --%>
                    
                </div>

                <div id="subMaintab4" class="tabcontent">
                    <%-- 회의 리스트--%>
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
                                    <th>회의 제목</th>
                                    <th>회의 개요</th>
                                    <th>개설자</th>
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
                </div>
            </div>

            <%-- 등록  --%>
            <%@ include file="/WEB-INF/views/main/projectWriter.jsp" %>

            <%-- 달력 리스트 주석처리중 --%>
            <%@ include file="/WEB-INF/views/main/calendarCardList.jsp" %>

            <%--카드리스트--%>
            <div id="submain_work">
                <%-- 업무 List --%>
                <%@ include file="/WEB-INF/views/work/ajaxWorkList.jsp"%>
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
    //회의목록 출력
    getMeetingListAjax();

    function getMeetingListAjax(){
        var project_id = ${projectVo.project_id};
        //(function poll(){
        $.ajax({
            url : '/meetingList',
            type : 'POST',
            data : {"project_id":project_id},
            success : function (data) {
                $('#meetingListAjax').html("");
                $('#meetingListAjax').html(data);
            },
            error: function (data) {
            }
            // timeout: 3000,
            // complete: setTimeout(function(){ poll(); }, 6000)
        });
        //})();
    };

    //회의록,대화록 다운로드
    $(function(){
        $('#meetingListAjax').on('click', '.saveDocFile', function(){
            var title =$(this).parents('.myPInfo').prev().find('.meeting_title').html();
            var date =$(this).parents('.myPInfo').prev().find('.format_meeting_sdate').html();

            var textToSave =$(this).parents('.btnP').find('.saveDoc').html();
            //console.log($(this).parents('.btnP').find('.btnC').html());

            var textToSaveAsBlob = new Blob([textToSave], {type:"text/html"});
            var textToSaveAsURL = window.URL.createObjectURL(textToSaveAsBlob);
            var fileNameToSaveAs = title+"_회의록_"+date;

            var downloadLink = document.createElement("a");
            downloadLink.download = fileNameToSaveAs;
            downloadLink.innerHTML = "Download File";
            downloadLink.href = textToSaveAsURL;
            downloadLink.style.display = "none";
            document.body.appendChild(downloadLink);

            downloadLink.click();
        });
        $('#meetingListAjax').on('click', '.saveChatFile', function(){
            var title =$(this).parents('.myPInfo').prev().find('.meeting_title').html();
            var date =$(this).parents('.myPInfo').prev().find('.format_meeting_sdate').html();

            var textToSave =$(this).parents('.btnP').find('.saveChat').html();

            var textToSaveAsBlob = new Blob([textToSave], {type:"text/html"});
            var textToSaveAsURL = window.URL.createObjectURL(textToSaveAsBlob);
            var fileNameToSaveAs = title+"_대화록_"+date;

            var downloadLink = document.createElement("a");
            downloadLink.download = fileNameToSaveAs;
            downloadLink.innerHTML = "Download File";
            downloadLink.href = textToSaveAsURL;
            downloadLink.style.display = "none";
            document.body.appendChild(downloadLink);

            downloadLink.click();
        });
    });


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
            labels: ["업무", "할일", "이슈"],
            datasets: [{
                label: '',
                data: ['${workMainChart.workCnt}', '${workMainChart.todoCnt}', '${workMainChart.issueCnt}'],
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
        <%-- 댓글감추기 --%>
        $('.cmtContentC').hide();

        updateCard('0', '0', 0, '${projectVo.project_id}');

        // html dom 이 다 로딩된 후 실행된다.
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


    /* work cart  현재 미사용 중  */
    function createWork() {
        var param = $('form[name=workfrm1]').serialize();

        $.ajax({
            method: "POST",
            url: "/ajaxCreateWork",
            enctype: 'multipart/form-data',
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
    <%-- 댓글 삽입 --%>
    function insertCmt(work_id, cmt_content) {
        var cmt_contenta = $('#' + cmt_content).val();
        $.ajax({
            method: "GET",
            url: "/ajaxInsertCmt",
            data: {"work_id": work_id, "cmt_content": cmt_contenta, "project_id": ${projectVo.project_id}},
            success: function (data) {
                $('#commentListNewDiv'+work_id).html("");
                $('#commentListNewDiv'+work_id).html(data);
                $('.commentInput').val("");
            },
            error: function (data) {
            }
        });
    }


    <%-- 댓글 삭제 --%>
    function deleteCmt(cmt_id, work_id) {
        $.ajax({
            type: "GET",
            url: "/deleteCmt",
            data: {"cmt_id": cmt_id, "project_id": ${projectVo.project_id}, "work_id" : work_id },
            success: function (data) {
                $('#commentListNewDiv'+work_id).html("");
                $('#commentListNewDiv'+work_id).html(data);
                $('.commentInput').val("");

            }
        });
    }

    <%-- 댓글 수정 --%>


    function updateCmt(cmt_id, work_id) {
        $('#cmtContent'+cmt_id).hide();
        $('.cmtContentC').hide();
        $('#cmt'+cmt_id).show();
    }

    function updateCmtShow(cmt_id) {
        $('#cmtContent'+cmt_id).show();
        $('.cmtContentC').hide();
        $('#cmt'+cmt_id).hide();
    }

    function updateCmtAjax(cmt_id, work_id, project_id, cmt_content) {
        var cmtSave = $('#cmtSave'+cmt_id).val();
        $.ajax({
            type: "GET",
            url: "/updateCmt",
            data: {"cmt_id": cmt_id, "work_id":work_id, "project_id": project_id, "cmt_content": cmtSave},
            success: function (data) {
                $('#cmtContent'+cmt_id).val(data.cmt_content);
                $('.commentInput').val("");
                updateCmtShow(cmt_id);

            }
        });
    }

    function updateCard(no, group, index){
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

    function workChart(work_id) {
        var parm = "project_id=${projectVo.project_id}&work_id="+ work_id;
        $.ajax({
            type: "POST",
            url:  "/ajaxWorkChart",
            data: parm,
            success: function (data) {
                $('#container'+work_id).html("")
                $('#container'+work_id).html(data)
            }
        });
    }
    //submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
    // if (submenu.is(":visible")) {
    // submenu.slideUp();
    // } else {
    // submenu.slideDown();
    // }

    // 서브메인 탭 메뉴
    $(function() {
        $('ul.subMaintab li').click(function() {
            var activeTab = $(this).attr('data-tab');
            $('ul.subMaintab li').removeClass('current');
            $('.tabcontent').removeClass('current');
            $(this).addClass('current');
            $('#' + activeTab).addClass('current');
        })
    });

    /* to-do 등록시 초기화 */
    function todoReset(work_id) {
        document.getElementById('todoInsert' + work_id).reset();

        var date = new Date();
        date.setHours(date.getHours() + 9);
        document.getElementById('non_todo_sdate'+work_id).value = date.toISOString().slice(0, 16);
    }


</script>
</body>
</html>