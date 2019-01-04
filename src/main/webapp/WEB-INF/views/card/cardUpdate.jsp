<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="white_content_card" id="openCardUpdate">
	<div>
		<a href="#close"><i class="icon-close icons"></i></a>
		<form action="/createWork" method="post" id="workForm1" name="workfrm1" enctype="multipart/form-data" >
            <div class="workContainerInput" style="margin-top:40px;">
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
                <div class="workVisibility" style="height:85px;">
                	<h3>첨부파일 등록</h3>
                    <input type="file" name="file" class="projectCreateFileInput" />
                    <input type="file" name="file" class="projectCreateFileInput" />
                </div>
                <div class="workSubmit">
                    <input type="button" class="tabssTextAreaSubmit" value="수정" id="workPopUpdate" style="float:left;" />
                    <input type="button" class="tabssTextAreaSubmit" value="삭제" id="workPopDelete"  />
                </div>
            </div>
        </form>
	</div>
</div>