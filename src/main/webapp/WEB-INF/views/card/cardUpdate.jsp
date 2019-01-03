<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="white_content_card" id="openCardUpdate">
	<div>
		<a href="#close"><i class="icon-close icons"></i></a>
		<div class="cardCreateInputField">
			<input type="text" value="업무제목" /><br>
			<input type="datetime-local"> - <input type="datetime-local"><br><br>
			업무유형<br>
			<input type="radio">설계 <input type="radio">개발 <input type="radio">유지보수<br><br>
			업무중유도<br>
			<select>
				<option>Level 1</option>
				<option>Level 2</option>
				<option>Level 3</option>
				<option>Level 4</option>
				<option>Level 5</option>
			</select>
			<br>
			업무 공개여부<br>
			<input type="checkbox"> WORK_PUBLIC<br>
			<input type="file" /> <input type="file" />
		</div>
		<div class="btnPopupCenterCardUpdate">
			<input type="button" value="수정" class="cardInfoUpdate" />
			<input type="button" value="삭제" class="cardInfoDelete" />
		</div>
	</div>
</div>