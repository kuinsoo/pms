<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="white_content_card" id="openCardUpdate${work.work_id}">
	<div>
		<a href="#close${work.work_id}"><i class="icon-close icons"></i></a>
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
			<input type="button" value="수정" class="cardInfoUpdate" id="updateWork"/>
			<input type="button" value="삭제" class="cardInfoDelete" onclick="deleteWork('${work.work_id}')"  />
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
</script>