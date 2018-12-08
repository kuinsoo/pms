<%--
  Created by IntelliJ IDEA.
  User: Mr.KKu
  Date: 2018-12-07
  Time: 오후 8:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach items="${inviteProjectList}" var="inviteProject">
    <li>
        <div class="projectCard">
            <div class="projectCardTitle">
                <a href="#projectCreatePopUpInvite" class="projectCreatePopUpInvite">${inviteProject.project_title}</a>
            </div>
            <div class="dim-layera">
                <div class="dimBga"></div>
                <div id="projectCreatePopUpInvite" class="pop-layera">
                    <div class="pop-containera">
                        <div class="pop-contsa">
                            <div class="pop-conts-headera">
                                <p>프로젝트 초대</p>
                                <a href="#" class="btn-layerClosea">
                                    <i class="icon-close icons"></i>
                                </a>
                            </div>
                            <div class="pop-conts-sectiona">
                                <div class="pop-conts-section-titlea">
                                        <%-- 프로젝트 생성 시작 --%>
                                    <span>프로젝트명</span>
                                    <input type="text"  class="projectTitleInputa" name="" value="${inviteProject.project_title}" readonly />
                                    <br>
                                    <span>프로젝트개요</span>
                                    <textarea class="projectContentInputa" name="" readonly>${inviteProject.project_overview}</textarea>

                                    <div class="projectInvite">
                                        <p>${inviteProject.member_name}님이 초대 하셨습니다 수락 하시겠습니까?</p>
                                    </div>
                                    <div class="layerPopUpBtna">
                                        <a href="/acceptInvitation?accept=Y&id=${inviteProject.project_id}"><button class="createProjectSubmita">수락</button></a>
                                        <a href="/acceptInvitation?accept=N&id=${inviteProject.project_id}" class="btn-layerClosea layerPopupClosea">취소</a>
                                    </div>
                                        <%-- 프로젝트 생성 끝 --%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <script>
				// DIM POPUP
				$('.projectCreatePopUpInvite').click(function(){
					var $hrefa = $(this).attr('href');
					layer_popupa($hrefa);
				});
				function layer_popupa(ela){
					var $ela = $(ela);        //레이어의 id를 $el 변수에 저장
					var isDima = $ela.prev().hasClass('dimBga');   //dimmed 레이어를 감지하기 위한 boolean 변수

					isDima ? $('.dim-layera').fadeIn() : $ela.fadeIn();

					var $elWidtha = ~~($ela.outerWidth()),
						$elHeighta = ~~($ela.outerHeight()),
						docWidtha = $(document).width(),
						docHeighta = $(document).height();

					// 화면의 중앙에 레이어를 띄운다.
					if ($elHeighta < docHeighta || $elWidtha < docWidtha) {
						$ela.css({
							marginTop: -$elHeighta /2,
							marginLeft: -$elWidtha/2
						})
					} else {
						$ela.css({top: 0, left: 0});
					}

					$ela.find('a.btn-layerClosea').click(function(){
						isDima ? $('.dim-layera').fadeOut() : $ela.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
						return false;
					});

					$('.layer .dimBga').click(function(){
						$('.dim-layera').fadeOut();
						return false;
					});
				}
            </script>
            <div class="projectCardUserName">
                <img src="http://placehold.it/30x30">
                <br>
                    ${inviteProject.member_name}님 참여중
            </div>
        </div>
    </li>
</c:forEach>