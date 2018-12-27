<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach items="${meetingList}" var="meetingVo"  varStatus="status">
	<tr>
		<td>${status.count}</td>
		<td>${meetingVo.meeting_title}</td>
		<td>${meetingVo.member_name}</td>
		<td ><a href="#projectCreatePopUpb${status.count}" class="projectCreatePopUpb"> 열람하기 </a></td>
		<td class="${meetingVo.meeting_founder}">chat</td>
		<td>${meetingVo.format_meeting_sdate}</td>
	</tr>



			<div class="dim-layerb">
                <div class="dimBgb"></div>
                <div id="projectCreatePopUpb${status.count}" class="pop-layerb">
                    <div class="pop-containerb">
                        <div class="pop-contsb">
                            <div class="pop-conts-headerb">
                                <p>회의목록</p>
                                <a href="#" class="btn-layerCloseb">
                                    <i class="icon-close icons"></i>
                                </a>
                            </div>
                            <div class="pop-conts-sectionb">
                                <div class="pop-conts-section-titleb">
									<%-- 컨텐츠 영역 --%>
									<p class="projectContentInputb" name="project_overview" placeholder="프로젝트 개요 입력">
									${meetingVo.meeting_content}
									</p>
		                                  
                                  <div class="layerPopUpBtnb">
                                      <input type="submit" value="초대하기" class="createProjectSubmitb">
                                      <a href="#" class="btn-layerCloses layerPopupCloseb">취소</a>
                                  </div>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
</c:forEach>

	