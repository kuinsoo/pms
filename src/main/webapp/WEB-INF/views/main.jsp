
<%--
  Created by IntelliJ IDEA.
  User: Mr.KKu
  Date: 2018-11-13
  Time: 오전 11:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">

<style>

    body {
        min-width: 520px;
        font-size: 13px;
        font-family: D2Coding;
    }
    .kku-boarderUl {
        border: 0.5px solid indianred;
        text-align: center;
        width: 100%;
        height: 150px;
    }
    .column {
        width: 170px;
        float: left;
        padding-bottom: 100px;
    }

    .portlet {
        margin: 0 1em 1em 0;
        padding: 0.3em;
    }
    .portlet-header {
        padding: 0.2em 0.3em;
        margin-bottom: 0.5em;
        position: relative;
    }
    .portlet-toggle {
        position: absolute;
        top: 50%;
        right: 0;
        margin-top: -8px;
    }
    .portlet-content {
        padding: 0.4em;
    }
    .portlet-placeholder {
        border: 1px dotted black;
        margin: 0 1em 1em 0;
        height: 50px;
    }

    #planList {
        width: 875px;
        height: 500px;
        margin: 0 auto;
        padding-left: 25px;
    }

    #titleList {
        list-style: none;
        width: 875px;
        height: 20px;
        margin: 0 auto;
    }

    .titleBox {
        width: 175px;
        float: left;
    }

</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(document).ready(function () {
		$('.kku-hide').hide();
	});
	$( function() {
		var tabs = $("#planList").tabs();
		tabs.find(".column" ).sortable({
			connectWith: ".column",
			handle: ".portlet-header",
			cancel: ".portlet-toggle",
			placeholder: "portlet-placeholder ui-corner-all",
			stop      : function(event, ui){
				var prev = isNaN(parseFloat(ui.item.prev().children(".kku-index").text()))  ?  9999999 : parseInt(ui.item.prev().children(".kku-index").text());
				var next = isNaN(parseFloat(ui.item.next().children(".kku-index").text())) ? 0 : parseInt(ui.item.next().children(".kku-index").text());
				var index = prev - ((prev - next) / 2);
				var no = parseInt(ui.item.children(".kku-no").text());
				var group = ui.item.prev().children(".kku-group").text();
				if (group === "" ) {
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

		$( ".portlet" )
			.addClass( "ui-widget ui-widget-content ui-helper-clearfix ui-corner-all" )
			.find( ".portlet-header" )
			.addClass( "ui-widget-header ui-corner-all" )
			.prepend( "<span class='ui-icon ui-icon-minusthick portlet-toggle'></span>");

		$( ".portlet-toggle" ).on( "click", function() {
			var icon = $( this );
			icon.toggleClass( "ui-icon-minusthick ui-icon-plusthick" );
			icon.closest( ".portlet" ).find( ".portlet-content" ).toggle();
		});
	} );

	function updateCard(no, group, index){
		location.href = "/updateCard?card_no="+no+"&card_group="+group+"&card_index="+index;
	};
</script>
<ul id="titleList" >
    <li class="titleBox">요청</li>
    <li class="titleBox">진행</li>
    <li class="titleBox">이슈발생</li>
    <li class="titleBox">처리대기</li>
    <li class="titleBox">완료</li>
</ul>
<div class="kku-boarder kku-mainPage" id="planList">

    <div class="column">
        <div class="portlet" >
            <label class="kku-hide kku-group">1</label>
        </div>
        <c:forEach items="${cardList}" var="cardVo" >
            <c:if test="${cardVo.card_group eq '1'}">
                <div class="portlet">
                    <div class="portlet-header" >${cardVo.card_title}</div>
                    <div class="portlet-content">
                            ${cardVo.card_content}
                    </div>
                    <label class="kku-hide kku-no" >${cardVo.card_no}</label>
                    <label class="kku-hide kku-group" >${cardVo.card_group}</label>
                    <label class="kku-hide kku-index" >${cardVo.card_index}</label>
                </div>
            </c:if>
        </c:forEach>
    </div>

    <div class="column">
        <div class="portlet">
            <label class="kku-hide kku-group">2</label>
        </div>
        <c:forEach items="${cardList}" var="cardVo" >
            <c:if test="${cardVo.card_group eq '2'}">
                <div class="portlet">
                    <div class="portlet-header">${cardVo.card_title}</div>
                    <div class="portlet-content">
                            ${cardVo.card_content}
                    </div>
                    <label class="kku-hide kku-no" >${cardVo.card_no}</label>
                    <label class="kku-hide kku-group" >${cardVo.card_group}</label>
                    <label class="kku-hide kku-index" >${cardVo.card_index}</label>
                </div>
            </c:if>
        </c:forEach>
    </div>

    <div class="column">
        <div class="portlet">
            <label class="kku-hide kku-group">3</label>
        </div>
        <c:forEach items="${cardList}" var="cardVo" >
            <c:if test="${cardVo.card_group eq '3'}">
                <div class="portlet">
                    <div class="portlet-header">${cardVo.card_title}</div>
                    <div class="portlet-content">
                            ${cardVo.card_content}
                    </div>
                    <label class="kku-hide kku-no" >${cardVo.card_no}</label>
                    <label class="kku-hide kku-group" >${cardVo.card_group}</label>
                    <label class="kku-hide kku-index" >${cardVo.card_index}</label>
                </div>
            </c:if>
        </c:forEach>
    </div>

    <div class="column">
        <div class="portlet">
            <label class="kku-hide kku-group">4</label>
        </div>
        <c:forEach items="${cardList}" var="cardVo" >
            <c:if test="${cardVo.card_group eq '4'}">
                <div class="portlet">
                    <div class="portlet-header">${cardVo.card_title}</div>
                    <div class="portlet-content">
                            ${cardVo.card_content}
                    </div>
                    <label class="kku-hide kku-no" >${cardVo.card_no}</label>
                    <label class="kku-hide kku-group" >${cardVo.card_group}</label>
                    <label class="kku-hide kku-index" >${cardVo.card_index}</label>
                </div>
            </c:if>
        </c:forEach>
    </div>

    <div class="column">
        <div class="portlet">
            <label class="kku-hide kku-group">5</label>
        </div>
        <c:forEach items="${cardList}" var="cardVo" >
            <c:if test="${cardVo.card_group eq '5'}">
                <div class="portlet">
                    <div class="portlet-header">${cardVo.card_title}</div>
                    <div class="portlet-content">
                            ${cardVo.card_content}
                    </div>
                    <label class="kku-hide kku-no" >${cardVo.card_no}</label>
                    <label class="kku-hide kku-group" >${cardVo.card_group}</label>
                    <label class="kku-hide kku-index" >${cardVo.card_index}</label>
                </div>
            </c:if>
        </c:forEach>
    </div>

</div>
