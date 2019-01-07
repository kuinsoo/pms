<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<div class="white_content_card" id="openCardUpdate${work.work_id}">
    <div>
        <a href="#close${work.work_id}"><i class="icon-close icons"></i></a>
        <c:forEach items="${projectWorkList}" var="projectWorks">
            <c:if test="${projectWorks.work_id eq work.work_id}" >
                <form action="/updateWork" method="post" id="updateWorkFrm${work.work_id}" name="updateWorkFrm" enctype="multipart/form-data" >
                    <div class="workContainerInput" style="margin-top:40px;">
                        <input type="text" name="work_title" value="${projectWorks.work_title}" placeholder="업무제목을 입력해주세요" class="workTitle"/>

                        <div class="workDateDiv">
                            <!-- 업무 시작일 -->
                            <i class="icon-clock icons"></i>
                            <input type="datetime-local" name="work_sdate" class="work_sdate" value="<fmt:formatDate value='${projectWorks.work_sdate}' pattern="yyyy-MM-dd'T'hh:mm:ss" />" />

                            <!-- 업무 마감 예상일 -->
                            <i class="icon-clock icons"></i>
                            <input type="datetime-local" name="work_eedate" class="work_eedate" id="updateWorkEedate${work.work_id}" value="<fmt:formatDate value='${projectWorks.work_eedate}' pattern="yyyy-MM-dd'T'hh:mm:ss" />" />
                        </div>
                        <textarea class="workTextarea" name="work_content"
                                  placeholder="업무내용을 입력해주세요">${projectWorks.work_content}</textarea>

                        <div class="workTypeDiv">
                            <h3>업무유형</h3>
                            <c:choose>
                                <c:when test="${projectWorks.work_type eq '1'}">
                                    <input type="radio" name="work_type" value="1" class="workType1" checked="checked"/><span>설계</span>
                                    <input type="radio" name="work_type" value="2" class="workType2"/><span>개발</span>
                                    <input type="radio" name="work_type" value="3" class="workType3"/><span>유지보수</span>
                                </c:when>
                                <c:when test="${projectWorks.work_type eq '2'}">
                                    <input type="radio" name="work_type" value="1" class="workType1"/><span>설계</span>
                                    <input type="radio" name="work_type" value="2" class="workType2"  checked="checked" /><span>개발</span>
                                    <input type="radio" name="work_type" value="3" class="workType3"/><span>유지보수</span>
                                </c:when>
                                <c:when test="${projectWorks.work_type eq '3'}">
                                    <input type="radio" name="work_type" value="1" class="workType1"/><span>설계</span>
                                    <input type="radio" name="work_type" value="2" class="workType2"/><span>개발</span>
                                    <input type="radio" name="work_type" value="3" class="workType3" checked="checked" /><span>유지보수</span>
                                </c:when>
                            </c:choose>
                        </div>
                        <div class="workImportance">
                            <h3>업무 중요도</h3>
                            <select name="work_importance">
                                <c:choose>
                                    <c:when test="${projectWorks.work_importance eq '1'}">
                                        <option value="1" selected="selected">Level 1</option>
                                        <option value="2">Level 2</option>
                                        <option value="3">Level 3</option>
                                        <option value="4">Level 4</option>
                                        <option value="5">Level 5</option>
                                    </c:when>
                                    <c:when test="${projectWorks.work_importance eq '2'}">
                                        <option value="1">Level 1</option>
                                        <option value="2" selected="selected" >Level 2</option>
                                        <option value="3">Level 3</option>
                                        <option value="4">Level 4</option>
                                        <option value="5">Level 5</option>
                                    </c:when>
                                    <c:when test="${projectWorks.work_importance eq '3'}">
                                        <option value="1">Level 1</option>
                                        <option value="2">Level 2</option>
                                        <option value="3" selected="selected">Level 3</option>
                                        <option value="4">Level 4</option>
                                        <option value="5">Level 5</option>
                                    </c:when>
                                    <c:when test="${projectWorks.work_importance eq '4'}">
                                        <option value="1">Level 1</option>
                                        <option value="2">Level 2</option>
                                        <option value="3">Level 3</option>
                                        <option value="4" selected="selected">Level 4</option>
                                        <option value="5">Level 5</option>
                                    </c:when>
                                    <c:when test="${projectWorks.work_importance eq '5'}">
                                        <option value="1">Level 1</option>
                                        <option value="2">Level 2</option>
                                        <option value="3">Level 3</option>
                                        <option value="4">Level 4</option>
                                        <option value="5" selected="selected">Level 5</option>
                                    </c:when>
                                </c:choose>
                            </select>
                        </div>
                        <input type="hidden" name="project_id" value="${projectVo.project_id}"/>
                        <input type="hidden" name="work_id" value="${work.work_id}"/>
                        <div class="workVisibility">
                            <h3>업무 공개여부</h3>
                            <c:choose>
                                <c:when test="${projectWorks.work_public eq 'Y'}">
                                    <input type="checkbox" name="work_public" value="Y" class="workVisibilityCheck" checked/>
                                </c:when>
                                <c:when test="${projectWorks.work_public eq 'N'}">
                                    <input type="checkbox" name="work_public" value="Y" class="workVisibilityCheck" />
                                </c:when>
                            </c:choose>
                            <span>WORK_PUBLIC</span>
                        </div>
                    </div>
                </form>
            </c:if>
        </c:forEach>
        <div class="workSubmit">
            <input type="button" class="tabssTextAreaSubmit" value="수정" id="workPopUpdate" onclick="updateWork('${work.work_id}')" style="float:left;"  />
            <input type="button" class="tabssTextAreaSubmit" value="삭제" id="workPopDelete"  onclick="deleteWork('${work.work_id}')" />
        </div>



    </div>
</div>

<script>
    function deleteWork(work_id){
        $.ajax({
            type: "get",
            url : "/deleteWork",
            data: "work_id="+work_id,
            success : function (data) {
                $('#subMainForm').submit();
            },
            error : function (data) {

            }
        });
    };

    function updateWork(work_id) {
        $('#updateWorkFrm'+work_id).submit();
    }

</script>