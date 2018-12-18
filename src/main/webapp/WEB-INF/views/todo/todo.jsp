<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="white_contents" id="opens">
	<div>
	    <a href="#close"><i class="icon-close icons"></i></a>
	    <div class="issueCreateInputField">
	        <div class="issueCreateInputFieldLeft">
	            <ul>
	                <li>담당자</li>
	                <li>할일내용</li>
	                <li>시작일자</li>
	                <li>마감일자</li>
	            </ul>
	        </div>
	        <div class="issueCreateInputFieldRight">
	            <form method="POST" name="todoInsert" id="todoInsert">
	                <ul>
	                    <li><input type="text" name="todo_pmember"
	                               placeholder="담당자를 입력하세요."/></li>
	                    <li><textarea name="todo_content"
	                                  placeholder="내용을 입력하세요."></textarea></li>
	                    <li><input type="datetime-local" name="non_todo_sdate"
	                               id="non_todo_sdate" value=""/></li>
	                    <li><input type="hidden" name="todo_sdate" id="todo_sdate"
	                               value=""/></li>
	                    <li><input type="datetime-local" name="non_todo_eedate"></li>
	                    <li><input type="hidden" name="todo_eedate" id="todo_eedate"
	                               value=""/></li>
	                    <li><input type="hidden" name="project_id"
	                               value="${projectVo.project_id}"/></li>
	                    <li><input type="hidden" name="todo_work" id="todo_work"
	                               value="${work.work_id}"/></li>
	                </ul>
	            </form>
	        </div>
	    </div>
	    <input type="button" value="등록" class="issueInfoCreate" onClick="insertTodo();"/>
	    <a href="#close" class="issueInfoClose">취소</a>
	</div>
</div>