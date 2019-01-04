
<%--
  Created by IntelliJ IDEA.
  User: Mr.KKu
  Date: 2018-11-13
  Time: 오전 11:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="/css/jquery-ui.css">
    <div class="columnCard">
        <div class="portlet" >
            <label class="kku-hide kku-group">1</label>
        </div>
        <c:forEach items="${wcList}" var="wcVo" >
            <c:if test="${wcVo.wc_group eq '1'}">
                <div class="portlet">
                    <div style="width: ${wcVo.work_progress}%; background: #8bcd24; font-family: D2Coding; font-weight: bold" >　${wcVo.work_progress}%</div>
                    <div class="portlet-header" >${wcVo.work_title}</div>
                    <div class="portlet-content">${wcVo.work_content}</div>
                    <label class="kku-hide kku-no" >${wcVo.wc_id}</label>
                    <label class="kku-hide kku-group" >${wcVo.wc_group}</label>
                    <label class="kku-hide kku-index" >${wcVo.wc_index}</label>
                    <div class="portletHover">
	                	${wcVo.work_title} <br><br>
	                	${wcVo.work_content}
	                </div>
                </div>
            </c:if>
        </c:forEach>
    </div>

    <div class="columnCard">
        <div class="portlet">
            <label class="kku-hide kku-group">2</label>
        </div>
        <c:forEach items="${wcList}" var="wcVo" >
            <c:if test="${wcVo.wc_group eq '2'}">
                <div class="portlet">
                    <div style="width: ${wcVo.work_progress}%; background: #8bcd24; font-family: D2Coding; font-weight: bold" >　${wcVo.work_progress}%</div>
                    <div class="portlet-header">${wcVo.work_title}</div>
                    <div class="portlet-content">${wcVo.work_content}</div>
                    <label class="kku-hide kku-no" >${wcVo.wc_id}</label>
                    <label class="kku-hide kku-group" >${wcVo.wc_group}</label>
                    <label class="kku-hide kku-index" >${wcVo.wc_index}</label>
                    <div class="portletHover">
	                	${wcVo.work_title} <br><br>
	                	${wcVo.work_content}
	                </div>
                </div>
            </c:if>
        </c:forEach>
    </div>

    <div class="columnCard">
        <div class="portlet">
            <label class="kku-hide kku-group">3</label>
        </div>
        <c:forEach items="${wcList}" var="wcVo" >
            <c:if test="${wcVo.wc_group eq '3'}">
                <div class="portlet">
                    <div style="width: ${wcVo.work_progress}%; background: #8bcd24; font-family: D2Coding; font-weight: bold" >　${wcVo.work_progress}%</div>
                    <div class="portlet-header">${wcVo.work_title}</div>
                    <div class="portlet-content">${wcVo.work_content}</div>
                    <label class="kku-hide kku-no" >${wcVo.wc_id}</label>
                    <label class="kku-hide kku-group" >${wcVo.wc_group}</label>
                    <label class="kku-hide kku-index" >${wcVo.wc_index}</label>
                    <div class="portletHover">
	                	${wcVo.work_title} <br><br>
	                	${wcVo.work_content}
	                </div>
                </div>
            </c:if>
        </c:forEach>
    </div>

    <div class="columnCard">
        <div class="portlet">
            <label class="kku-hide kku-group">4</label>
        </div>
        <c:forEach items="${wcList}" var="wcVo" >
            <c:if test="${wcVo.wc_group eq '4'}">
                <div class="portlet">
                    <div style="width: ${wcVo.work_progress}%; background: #8bcd24; font-family: D2Coding; font-weight: bold" >　${wcVo.work_progress}%</div>
                    <div class="portlet-header">${wcVo.work_title}</div>
                    <div class="portlet-content">${wcVo.work_content}</div>
                    <label class="kku-hide kku-no" >${wcVo.wc_id}</label>
                    <label class="kku-hide kku-group" >${wcVo.wc_group}</label>
                    <label class="kku-hide kku-index" >${wcVo.wc_index}</label>
                    <div class="portletHover">
	                	${wcVo.work_title} <br><br>
	                	${wcVo.work_content}	                	
	                </div>
                </div>
            </c:if>
        </c:forEach>
    </div>

    <div class="columnCard">
        <div class="portlet">
            <label class="kku-hide kku-group">5</label>
        </div>
        <c:forEach items="${wcList}" var="wcVo" >
            <c:if test="${wcVo.wc_group eq '5'}">
                <div class="portlet">
                    <div style="width: ${wcVo.work_progress}%; background: #8bcd24; font-family: D2Coding; font-weight: bold" >　${wcVo.work_progress}%</div>
                    <div class="portlet-header">${wcVo.work_title}</div>
                    <div class="portlet-content">${wcVo.work_content}</div>
                    <label class="kku-hide kku-no" >${wcVo.wc_id}</label>
                    <label class="kku-hide kku-group" >${wcVo.wc_group}</label>
                    <label class="kku-hide kku-index" >${wcVo.wc_index}</label>
                    <div class="portletHovers">
	                	${wcVo.work_title} <br><br>
	                	${wcVo.work_content}
	                </div>
                </div>
            </c:if>
        </c:forEach>
    </div>

<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	$( function() {
			var tabs = $("#planList").tabs();
		tabs.find(".columnCard" ).sortable({
			connectWith: ".columnCard",
			handle: ".portlet-header",
			cancel: ".portlet-toggle",
			placeholder: "portlet-placeholder ui-corner-all",
			stop      : function(event, ui){
				var prev = isNaN(parseFloat(ui.item.prev().children(".kku-index").text()))  ?  9999 : parseInt(ui.item.prev().children(".kku-index").text());
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

				// alert(ui.item.prev().index());
				// alert(ui.item.prev().text()) //전값
				// alert(ui.item.text()) //현재값
				// alert(ui.item.next().text()) //다음값
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
</script>
