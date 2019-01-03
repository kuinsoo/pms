<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="projectWriter">
    <div id="tabss">
        <ul>
            <li><a href="#tabss-1">업무</a></li>
            <li><a href="#tabss-2">글</a></li>
            <li><a href="#tabss-3">일정</a></li>
            <li><a href="#tabss-4">할일</a></li>
        </ul>
        <!-- tap1 업무 -->
        <div id="tabss-1">
            <form action="/createWork" method="post" name="workfrm1" enctype="multipart/form-data" >
                <div class="workContainerInput">
                    <input type="text" name="work_title" placeholder="업무제목을 입력해주세요" class="workTitle"/>

                    <div class="workDateDiv">
                        <!-- 업무 시작일 -->
                        <i class="icon-clock icons"></i>
                        <input type="datetime-local" name="work_sdate" class="work_sdate">

                        <!-- 업무 마감 예상일 -->
                        <i class="icon-clock icons"></i>
                        <input type="datetime-local" name="work_eedate" class="work_eedate">
                    </div>
                    <textarea class="workTextarea" name="work_content"
                              placeholder="업무내용을 입력해주세요"></textarea>

                    <div class="workTypeDiv">
                        <h3>업무유형</h3>
                        <input type="radio" name="work_type" value="1" class="workType1"/><span>설계</span>
                        <input type="radio" name="work_type" value="2" class="workType2"/><span>개발</span>
                        <input type="radio" name="work_type" value="3" class="workType3"/><span>유지보수</span>
                    </div>
                    <div class="workImportance">
                        <h3>업무 중요도</h3>
                        <select name="work_importance">
                            <option value="1">Level 1</option>
                            <option value="2">Level 2</option>
                            <option value="3">Level 3</option>
                            <option value="4">Level 4</option>
                            <option value="5">Level 5</option>
                        </select>
                    </div>
                    <input type="hidden" name="project_id" value="${projectVo.project_id}"/>
                    <div class="workVisibility">
                        <h3>업무 공개여부</h3>
                        <input type="checkbox" name="work_public" value="Y" class="workVisibilityCheck"/>
                        <span>WORK_PUBLIC</span>
                    </div>
                    <div>
                        <input type="file" name="file" />
                        <input type="file" name="file" />
                    </div>
                    <div class="workSubmit">
                        <input type="submit" class="tabssTextAreaSubmit" value="올리기" <%-- onclick="createWork();" --%> />
                    </div>
                </div>
            </form>
        </div>
        <%--tap1 끝 --%>
        <div id="tabss-2">
            <textarea class="tabssTextArea" placeholder="글을 작성하세요"></textarea>
            <input type="submit" class="tabssTextAreaSubmit" value="올리기"/>
        </div>
        <div id="tabss-3">
            <input type="text" placeholder="일정 제목을 입력하세요" class="calendarTitle"/>
            <div class="calendarContainerInput">
                <div class="calendarInputDiv">
                    <i class="icon-clock icons"></i>
                    <input type="date">
                </div>
                <span class="calendarInputDivSpan">~</span>
                <div class="calendarInputDivs">
                    <i class="icon-clock icons"></i>
                    <input type="date">
                </div>
            </div>
            <input type="text" placeholder="장소를 입력하세요" class="calendarTitle"/>
            <input type="text" placeholder="메모를 입력하세요" class="calendarMemo"/>
            <input type="submit" class="tabssTextAreaSubmit" value="올리기"/>
        </div>
        <div id="tabss-4">
            <input type="text" placeholder="할일제목을 입력하세요(선택)" class="todoInput"/>
            <ul>
                <li><input type="text" placeholder="할일 입력" class="todoInputContent"/></li>
                <li><input type="text" placeholder="할일 입력" class="todoInputContent"/></li>
                <li><input type="text" placeholder="할일 입력" class="todoInputContent"/></li>
            </ul>
            <div class="todoPlus">
                <i class="icon-plus icons"></i>
                <span>할일 추가</span>
            </div>
            <input type="button" class="tabssTextAreaSubmit" value="올리기"/>
        </div>
    </div>
</div>