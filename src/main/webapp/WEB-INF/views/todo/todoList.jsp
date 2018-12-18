<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="currentCardContentViewRight">
    <table>
        <thead>
        <tr>
            <th><input type="checkbox"/></th>
            <th>TODO</th>
            <th>담당자</th>
            <th>시작</th>
            <th>마감</th>
            <th>이슈</th>
        </tr>
        </thead>
        <tbody>
        <!-- todoInsertAjax.jsp -->
  <c:forEach items="${workToDoSelectList}" var="todoSelect">
     <c:if test="${todoSelect.todo_work eq work.work_id}">
        <tr>
           <td><input type="checkbox" /></td>
           <td>
              <a href="#open" class="issueTitlePopup">${todoSelect.todo_title}</a>
              <div class="white_content" id="open">
                 <div>
                    <a href="#close"><i class="icon-close icons"></i></a>
                    <div class="issueSelectPage">
                       <div class="issueSelectPageLeft">
                          <form action="#" method="post">
                             <div class="issueProfile">
                                <img src="http://placehold.it/150x200" />
                             </div>
                             <div class="issues">
                                <div class="issuesLeft">
                                   <ul>
                                      <li>담당자</li>
                                      <li>시작</li>
                                      <li>예상마감</li>
                                      <li>마감</li>
                                   </ul>
                                </div>
                                <div class="issuesRight">
                                   <ul>
                                      <li><input type="text"/>${todoSelect.todo_title}</li>
                                      <li><input type="text"/>${todoSelect.todo_sdate}</li>
                                      <li><input type="text"/>${todoSelect.todo_eedate}</li>
                                      <li><input type="text"/>${todoSelect.todo_complet}</li>
                                   </ul>
                                </div>
                             </div>
                             <textarea>${todoSelect.todo_content}</textarea>
                          </form>
                       </div>
                       <div class="issueSelectPageRight">
                          <h2>발생이슈</h2>
                          <input type="button" value="등록" class="issueCreateBtn" />
                          <input type="button" value="수정" class="insueUpdateBtn" />
                          <form action="#" mehtod="post">
                             <textarea>이슈에 대한 내용,,,,,</textarea>
                          </form>
                       </div>
                    </div>
                 </div>
              </div>
           </td>
           <td>${todoSelect.todo_pmember}</td>
           <td>${todoSelect.todo_sdate}</td>
           <td>${todoSelect.todo_eedate}</td>
           <td>${todoSelect.todo_issue}</td>
        </tr>
     </c:if>
  </c:forEach>
        </tbody>
    </table>
    <div class="pagination">
        <ul>
            <li><i class="icon-arrow-left icons"></i></li>
            <li><span>1</span></li>
            <li><span>2</span></li>
            <li><span>3</span></li>
            <li><span>4</span></li>
            <li><span>5</span></li>
            <li><i class="icon-arrow-right icons"></i></li>
        </ul>
    </div>
</div>

<script>
$(document).ready(function(){
	//todo 등록시 시작일자는 현재시간으로 기본값(default) 설정  ==문의: jerry==
    var date = new Date();
    date.setHours(date.getHours() + 9);
    //console.log(date.toISOString());
    document.getElementById('non_todo_sdate').value = date.toISOString().slice(0, 16);

    var param = $('#todo_work').val();
    todoSelect(param);
});

//할일등록의 등록버튼에 마우스올리면 커서 변경 ==문의: jerry==
$(".issueInfoCreate").mouseover(function () {
   $(this).css("cursor", "pointer");
});

//to-di list 등록 ==문의: jerry==
function insertTodo() {
   var sdate = $('input[name=non_todo_sdate]').val(); //UTC형식 Date를 sdate에 담는다.
   var eedate = $('input[name=non_todo_eedate]').val(); //UTC형식 Date를 eedate에 담는다.
   var repSdate = sdate.replace("T", " "); //Parsing('T' 제거)
   var repEedate = eedate.replace("T", " "); //Parsing('T' 제거)
   $("#todo_sdate").attr('value', repSdate); //Controller에 보낼 hidden에 값을 세팅
   $("#todo_eedate").attr('value', repEedate); //Controller에 보낼 hidden에 값을 세팅

   var param = $('#todoInsert').serialize();

   $.ajax({
      method: "POST",
      url: "/todoInsert",
      data: param,
      success: function(data) {
         alert("success");
         //$('#todoInsertHtmlAjax').html("");
         //$('#todoInsertHtmlAjax').html(data);
      },
      error:function(data) {
         alert("error");
      }
   });
}

//페이지 접속시 to-do list 조회(Ajax) ==문의: jerry==
function todoSelect() {
   var project_id = $('#todo_project_id').val();
   console.log("project_id : " + project_id);


   function todoSelect(todo_work) {
      console.log("todo_work : " + todo_work);

      $.ajax({
         method: "POST",
         url: "/todoSelect",
         data: project_id,
         success: function (data) {
            alert("success");
            $('#todoInsertHtmlAjax').html("");
            $('#todoInsertHtmlAjax').html(data);
         },
         error: function (data) {
            alert("error");
         }
      });
   }      
}

//to-do 등록시 시작일자는 현재시간으로 기본값(default) 설정  ==문의: jerry==
var date = new Date();
date.setHours(date.getHours() + 9);
//console.log(date.toISOString());
document.getElementById('non_todo_sdate').value = date.toISOString().slice(0, 16);

//페이지 접속시 to-do list 조회 ==문의: jerry==
todoSelect();
</script>