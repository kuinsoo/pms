<%@page import="kr.or.ddit.commons.util.KISA_SHA256"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp" %>

	<style>
		.error{
			color: red;
		}
		.telerror{
			color: red;
		}
		.inputerror{
			color: red;
		}
		#passError{
			color: red;
		}
		.passNot{
			color: red;
		}
	
	</style>
	<script type="text/javascript">
		$(document).ready(function() {
			
			// 회원 탈퇴부분 - 비밀번호 에러 메시지 숨기기
			$("#passError").hide();

			getMyPageList(1);
			getmybookMarkProjectList(1);
			getmyTodoProjectList(1);
			getMyEndPageList(1);
			getmyProjectFileList(1);
			
			
			// 참여중인 프로젝트 클릭
			$("#projectList").on("click", ".projectClick" ,function(){
				console.log("projectClick");
				var project_title = $(this).children()[1].innerHTML;
				var project_id = $(this).children()[2].innerHTML;
				$("#project_title").val(project_title);
				$("#project_id").val(project_id);
				  $("#frm").submit();
			});
			
			// 즐겨찾기 클릭 
			$("#projectBookList").on("click", ".projectBookClick" ,function(){
				console.log("projectClick");
				
				var project_title = $(this).children()[1].innerHTML;
				var project_id = $(this).children()[2].innerHTML;
				
				$("#project_title2").val(project_title);
				$("#project_id2").val(project_id);
				console.log(project_title);
				console.log(project_id);
				$("#frm2").submit();
			});
			
	        //#############################################################################################		
	        //#############################################################################################		
	        //#############################################################################################		
	        //#############################################################################################		
			// 나의일감 클릭 
			
			
			$("#projectTodoList").on("click",".todoClick", function(){
				console.log("todoClick");
				
				var project_id = $(this).children()[1].innerHTML;
				var todo_id = $(this).children()[2].innerHTML;
				var project_title = $(this).children()[4].innerHTML;
				var work_id = $(this).children()[3].innerHTML;
				console.log(todo_id);
				console.log(project_id);
				console.log(project_title);
				console.log(work_id);
				
				location.href="/subMain?todo_id="+todo_id+"&project_id="+project_id+"&project_title="+project_title+"&work_id="+work_id+"#myWorkGo";
				
			});
		
	        //#############################################################################################		
	        //#############################################################################################		
	        //#############################################################################################		
	        //#############################################################################################		
			
			$(".passNot").hide();
			$(".phoneBtns").hide();
			$(".saveBtn").hide();
			$("#pass1").hide();				
			$("#inpupass1").hide();				
			$("#inpupass2").hide();				
			$("#inpupass3").hide();				
			$("#pass2input").hide();				
			$("#pass1input").hide();				
			$("#telnum").hide();				
			$("#telnumLi").hide();		
			$('#member_name').prop('readonly', true);
			$('#member_tel').prop('readonly', true);
			$('#pass1').prop('readonly', true);
			$(".error").hide();
			$(".telerror").hide();
			$(".inputerror").hide();
			
			$(".updateBtn").click(function(){	
				$(".errorpass").hide();
				$(".profileUploadImg").show();
				$(".phoneBtns").show();
				$(".saveBtn").show();
				$("#pass1").show();				
				$("#inpupass1").show();				
				$("#inpupass2").show();				
				$("#inpupass3").show();				
				$("#pass2input").show();				
				$("#pass1input").show();				
				$("#telnum").show();				
				$("#telnumLi").show();		
				$(".updateBtn").hide();
				$('#member_name').prop('readonly', false);
				$('#member_tel').prop('readonly', false);
				$('#pass1').prop('readonly', false);
			});
			
			$('.saveBtn').prop('disabled', true);
			$(".phoneBtns").click(function(){	
				$('.saveBtn').prop('disabled', true);
				$(".inputerror").show();
			});
			
			
			var certificationNumber;
			
			
			//커서의 위치가 다른곳을 선택했을 때의 이벤트 발생
			//blur()이벤트 사용
		 	$("#pass2input").blur(function() {
				if($("#pass1input").val() != $("#pass2input").val()){
					$(".error").show();
					$('.saveBtn').prop('disabled', true);
				}else{
					$(".error").hide();
					$(".errorpass").hide();
					$('.saveBtn').prop('disabled', false);
				}
			}); 
			
			/* var pass1input1 = $("#pass1input").val();
			var pass2input2 = $("#pass2input").val();
			
			function onkeyup_event3(){
				if(pass1input1 != pass2input2){
					$(".error").show();
					$('.saveBtn').prop('disabled', true);
				}else{
					$(".error").hide();
					$(".errorpass").hide();
					$('.saveBtn').prop('disabled', false);
				}
			} */
			
			$('.saveBtn').prop('disabled', false);
			//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 파 일 부 분 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
			
			$("#fileElem").change(function(){
				console.log("fileChange");
				//var files = e.originalEvent.dataTransfer.files;
				var file = $(this)[0].files[0];
		    	var reader = new FileReader();
		        reader.readAsDataURL(file);
		        reader.onload = function(readEvent) {
		        	
	        	//$("#fileList").css("background-image", readEvent.target.result);
	        	 //$("#fileList").css("src", window.URL.createObjectURL(file));
	        	 $("#fileList").css("background-image", window.URL.createObjectURL(file));
	        	/*var img = $("<img/>", {
	    			src : readEvent.target.result,
	    			width : 120,
	    			height : 120
	    		});
	        	$("#test").prepend(img.clone());*/
	        	//$("#pic").hide();
		       	}
			    
			});
		});
		
		//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 프로필 사진 부분 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		
		// 핸드폰 번호 입력 후 인증 버튼
		function telAjax(){
			var member_tel = $("#member_tel").val();
			$.ajax({
				type :"GET",
				url :"/myPageAjax",
				data : "member_tel="+member_tel,
				success : function(data){
					certificationNumber = data;
				}
			});
		}

		var kisa;
		function kisaaa(){
			if( kisa === '${memberVo.member_pass}'){ 
				$('.saveBtn').prop('disabled', true);
				$(".passNot").hide();
			}else{
				$('.saveBtn').prop('disabled', true);
				$(".passNot").show();
			}				
		}
		
		
		function onkeyup_event2(){
			$.ajax({
				type: "GET",
				url : "/myPageSHA256Ajax",
				data : "pass1="+ $("#pass1").val(),
				success : function(data){
					 kisa = data.kisa256;
					 console.log(kisa);
					 console.log(data.kisa256);
					 
					 kisaaa();
				}
		});
			
	}	
		
		// 회원 탈퇴 부분 
		function onkeyup_eventEND(){
			$.ajax({
				type: "GET",
				url : "/myPageMemberENDSHA256Ajax",
				data : "passwordEnd="+ $("#passwordEnd").val(),
				success : function(data){
					memberEnd = data.kisa256;
					 console.log(memberEnd);
					 console.log(data.kisa256);
					 
					 memberEndPassWard();
				}
		});
			
	}	
	
	// @@@@@@@@@@@@@@@@@@@ 회원탈퇴 비밀번호 확인 부분 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		//커서의 위치가 다른곳을 선택했을 때의 이벤트 발생
		//blur()이벤트 사용
		var memberEnd; 
		function memberEndPassWard(){
			if(memberEnd === '${memberVo.member_pass}' ){
				$("#passError").hide();
				$('.goodbyeBtn').prop('disabled', false);

				$(".goodbyeBtn").click(function(){
					if(window.confirm("정말 탈퇴 하시겠습니까??")) {
						location.href="/userwithDrawal";
					}
				});
			}else{
				$("#passError").show();
				$('.goodbyeBtn').prop('disabled', true);
			}
		}
		
	/* 			$("#member_pass").keyup(function() {
				if($("#member_pass").val() != "${memberVo.member_pass}"){
					$("#passError").show();
					$('.goodbyeBtn').prop('disabled', true);
				} else{
					$("#passError").hide();
					$('.goodbyeBtn').prop('disabled', false);

					$(".goodbyeBtn").click(function(){
						if(window.confirm("정말 탈퇴 하시겠습니까??")) {
							location.href="/userwithDrawal";
						}
					});
				}
			}); */
			
		
		
		// 휴대번호 인증 부분 이벤트
		function onkeyup_event(){
			if(certificationNumber == $("#telnum").val()){
				$(".telerror").hide();
				$(".inputerror").hide();
				$('.saveBtn').prop('disabled', false);
			}else{
				$(".telerror").show();
				$(".inputerror").hide();
				$('.saveBtn').prop('disabled', true);
			}
		}
		
		// 마이페이지 : 참여중인 프로젝트 목록 / 페이징 처리 Ajax	
		function getMyPageList(page){
			var pageSize = 10;
			$.ajax({
				type: "GET",
				url : "/myPageProjectAjax",
				data: {"page":page, "pageSize":pageSize},
				success : function(data){
					var html ="";
					$.each(data.projectList, function (idx,my){
						html += "<tr class = projectClick>";
						html += "	<td>"+ my.rnum +"</td>";
						html += "	<td>"+ my.project_title +"</td>";
						html += "	<td>"+ my.project_id +"</td>";
						html += "	<td>"+ my.pmember_member +"</td>";
						html += "</tr>";
					});
					$("#projectList").html("");
					$("#projectList").html(html);
					var i  = 1;
					var paging ="";
						paging +="<li><a href='javascript:getMyPageList("+ i +");'aria-label='Previous'><span aria-hidden='true'>&laquo;</span>";
						for(var i= 1; i<=data.pageCnt; i++) {
							paging += "<li><a href='javascript:getMyPageList("+ i +");'>"+ i+ "</a></li>";
						}
							paging +="<li><a href='javascript:getMyPageList("+ data.pageCnt +");'aria-label='Next'><span aria-hidden='true'>&raquo;</span>";
					$(".pagination").html(paging);
				},
				fail : function(xhr){
					console.log(xhr);
				}
			});
		}
			
	// 마이페이지 : 참여중인 프로젝트 목록 검색 Ajax	
	function getSearchProject(page){
			
		$("#projectSearchPage").attr("value",page);	
		var param = $('form[name=searchProject]').serialize();
			
			$.ajax({
				type: "POST",
				url : "/searchProjectAjax",
				data: param,
				success : function(data){
					var html ="";
					$.each(data.projectList, function (idx,my){
						html += "<tr class = projectClick >";
						html += "	<td>"+ my.rnum +"</td>";
						html += "	<td>"+ my.project_title +"</td>";
						html += "	<td>"+ my.project_id +"</td>";
						html += "	<td>"+ my.pmember_member +"</td>";
						html += "</tr>";
					});
					$("#projectList").html("");
					$("#projectList").html(html);
					var i  = 1;
					var paging ="";
						paging +="<li><a href='javascript:getSearchProject("+ i +");'aria-label='Previous'><span aria-hidden='true'>&laquo;</span>";
						for(var i= 1; i<=data.pageCnt; i++) {
							paging += "<li><a href='javascript:getSearchProject("+ i +");'>"+ i+ "</a></li>";
						}
							paging +="<li><a href='javascript:getSearchProject("+ data.pageCnt +");'aria-label='Next'><span aria-hidden='true'>&raquo;</span>";
					$(".pagination").html(paging);
				},
				// 실패시 
				fail : function(xhr){
					console.log(xhr);
				}
			});
		}
		// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		
		
		// 마이페이지 : 참여 했던 프로젝트 목록 / 페이징 처리 Ajax	
		function getMyEndPageList(page){
			var pageSize = 10;
			$.ajax({
				type: "GET",
				url : "/myPageEndProjectAjax",
				data: {"page":page, "pageSize":pageSize},
				success : function(data){
					var html ="";
					$.each(data.projectEndList, function (idx,my){
						html += "<tr>";
						html += "	<td>"+ my.rnum +"</td>";
						html += "	<td>"+ my.project_title +"</td>";
						html += "	<td>"+ my.project_id +"</td>";
						html += "	<td>"+ my.pmember_member +"</td>";
						html += "</tr>";
					});
					$("#projectEndList").html("");
					$("#projectEndList").html(html);
					var i  = 1;
					var paging ="";
						paging +="<li><a href='javascript:getMyEndPageList("+ i +");'aria-label='Previous'><span aria-hidden='true'>&laquo;</span>";
						for(var i= 1; i<=data.pageCnt; i++) {
							paging += "<li><a href='javascript:getMyEndPageList("+ i +");'>"+ i+ "</a></li>";
						}
							paging +="<li><a href='javascript:getMyEndPageList("+ data.pageCnt +");'aria-label='Next'><span aria-hidden='true'>&raquo;</span>";
					$(".pagination1").html(paging);
				},
				fail : function(xhr){
					console.log(xhr);
				}
			});
		}
			
		// 마이페이지 : 참여했던 프로젝트 목록 검색 Ajax	
		function getSearchEndProject(page){
			
			$("#projectEndSearchPage").attr("value",page);	
			var param = $('form[name=searchEndProject]').serialize();
			
			$.ajax({
				type: "POST",
				url : "/searchEndProjectAjax",
				data: param,
				success : function(data){
					console.log("data : " + data);
					var html ="";
					$.each(data.projectEndList, function (idx,my){
						html += "<tr>";
						html += "	<td>"+ my.rnum +"</td>";
						html += "	<td>"+ my.project_title +"</td>";
						html += "	<td>"+ my.project_id +"</td>";
						html += "	<td>"+ my.pmember_member +"</td>";
						html += "</tr>";
					});
					$("#projectEndList").html("");
					$("#projectEndList").html(html);
					var i  = 1;
					var paging ="";
						paging +="<li><a href='javascript:getSearchEndProject("+ i +");'aria-label='Previous'><span aria-hidden='true'>&laquo;</span>";
						for(var i= 1; i<=data.pageCnt; i++) {
							paging += "<li><a href='javascript:getSearchEndProject("+ i +");'>"+ i+ "</a></li>";
						}
							paging +="<li><a href='javascript:getSearchEndProject("+ data.pageCnt +");'aria-label='Next'><span aria-hidden='true'>&raquo;</span>";
					$(".pagination1").html(paging);
				},
				// 실패시 
				fail : function(xhr){
					console.log(xhr);
				}
			});
		}
		//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 즐겨찾기 목록 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		function getmybookMarkProjectList(page){
			var pageSize = 10;
			$.ajax({
				type: "GET",
				url : "/mybookMarkProjectList",
				data: {"page":page, "pageSize":pageSize},
				success : function(data){
					var html = "";
					$.each(data.projectBookList, function(idx,mm){
						html += "<tr class = projectBookClick >";
						html += "	<td>"+ mm.rnum +"</td>";
						html += "	<td>"+ mm.project_title +"</td>";
						html += "	<td>"+ mm.project_id +"</td>";
						html += "	<td>"+ mm.pmember_member +"</td>";
						html += "</tr>";
					});
					$("#projectBookList").html("");
					$("#projectBookList").html(html);
					var i  = 1;
					var paging ="";
						paging +="<li><a href='javascript:getmybookMarkProjectList("+ i +");'aria-label='Previous'><span aria-hidden='true'>&laquo;</span>";
						for(var i= 1; i<=data.pageCnt; i++) {
							paging += "<li><a href='javascript:getmybookMarkProjectList("+ i +");'>"+ i+ "</a></li>";
						}
							paging +="<li><a href='javascript:getmybookMarkProjectList("+ data.pageCnt +");'aria-label='Next'><span aria-hidden='true'>&raquo;</span>";
						$(".pagination2").html(paging);
					},	
					fail : function(data){
						console.log(data);
					}
				});
			}
		// 마이페이지 : 즐겨찾기 프로젝트 목록 검색 Ajax	
		function getSearchBookProject(page){
			
		$("#searchBookProjectPage").attr("value",page);	
		var param = $('form[name=searchBookProject]').serialize();
			$.ajax({
				type: "POST",
				url : "/searchBookProjectAjax",
				data: param,
				success : function(data){
					console.log("data : " + data);
					var html = "";
					$.each(data.projectBookList, function(idx,mm){
						html += "<tr class = projectBookClick >";
						html += "	<td>"+ mm.rnum +"</td>";
						html += "	<td>"+ mm.project_title +"</td>";
						html += "	<td>"+ mm.project_id +"</td>";
						html += "	<td>"+ mm.pmember_member +"</td>";
						html += "</tr>";
					});
					$("#projectBookList").html("");
					$("#projectBookList").html(html);
					var i  = 1;
					var paging ="";
					paging +="<li><a href='javascript:getSearchBookProject("+ i +");'aria-label='Previous'><span aria-hidden='true'>&laquo;</span>";
					for(var i= 1; i<=data.pageCnt; i++) {
						paging += "<li><a href='javascript:getSearchBookProject("+ i +");'>"+ i+ "</a></li>";
					}
						paging +="<li><a href='javascript:getSearchBookProject("+ data.pageCnt +");'aria-label='Next'><span aria-hidden='true'>&raquo;</span>";
					$(".pagination2").html(paging);
				},	
				fail : function(xhr){
					console.log(xhr);
				}
			});
		}
			
		//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	    // 파일 보관함 
		function getmyProjectFileList(page){
			var pageSize = 10;
			$.ajax({
				type: "GET",
				url : "/myProjectFileListAjax",
				data: {"page":page, "pageSize":pageSize},
				success : function(data){
					var html = "";
					
					$.each(data.myFileList, function(idx,mm){
						html += "<tr>";
						html += "	<td>"+ mm.rnum +"</td>";
						html += "	<td>"+ mm.att_id +"</td>";
						html += "	<td>"+ mm.project_title +"</td>";
						html += "	<td>"+ mm.att_name +"</td>";
						html += "	<td>"+ "<input type='button' onclick ='getmyProjectFileAttachId("+mm.att_id+");' value='파일 다운로드' class='fileDownLoads' />"+"</td>";
						html += "</tr>";
					});
					$("#myFileList").html("");
					$("#myFileList").html(html);
					var i  = 1;
					var paging ="";
						paging +="<li><a href='javascript:getmyProjectFileList("+ i +");'aria-label='Previous'><span aria-hidden='true'>&laquo;</span>";
						for(var i= 1; i<=data.pageCnt; i++) {
							paging += "<li><a href='javascript:getmyProjectFileList("+ i +");'>"+ i+ "</a></li>";
						}
							paging +="<li><a href='javascript:getmyProjectFileList("+ data.pageCnt +");'aria-label='Next'><span aria-hidden='true'>&raquo;</span>";
						$(".paginationfile").html(paging);
					},	
					fail : function(data){
						console.log(data);
					}
				});
			}
		
		/* // select 프로젝트 선택한값으로 리스트의값이 변경되는  
	 	function getmyProjectFileSelect(project_id){
	 		var pageSize = 10;
			$.ajax({
				type: "GET",
				url : "/selectProjectFileListAjax",
				data :"project_id="+ project_id,
				success: function(data){
					console.log(data);
					getmyProjectFileList(1);
				}
			});
		}  */
		
		// select 프로젝트 선택한값으로 리스트의값이 변경되는  
	 	function getmyProjectFileAttachId(att_id){
	 	    location.href = '/selectProjectFileAttachIdDownload?att_id='+att_id;
		} 
		
		// 마이페이지 : 파일첨부  프로젝트 목록 검색 Ajax	
		function getFileSearchProject(page){
		
		$("#projectsearchFileListPage").attr("value",page);	

		var param = $('form[name=searchFileList]').serialize();
			$.ajax({
				type: "POST",
				url : "/searchFileListAjax",
				data: param,
				success : function(data){
					console.log("data : " + data);
					var html = "";
					$.each(data.myFileList, function(idx,mm){
						html += "<tr>";
						html += "	<td>"+ mm.rnum +"</td>";
						html += "	<td>"+ mm.att_id +"</td>";
						html += "	<td>"+ mm.project_title +"</td>";
						html += "	<td>"+ mm.att_name +"</td>";
						html += "	<td>"+ "<input type='button' value='파일 다운로드' class='fileDownLoads' />"+"</td>";
						html += "</tr>";
					});
					$("#myFileList").html("");
					$("#myFileList").html(html);
					var i  = 1;
					var paging ="";
					paging +="<li><a href='javascript:getFileSearchProject("+ i +");'aria-label='Previous'><span aria-hidden='true'>&laquo;</span>";
					for(var i= 1; i<=data.pageCnt; i++) {
						paging += "<li><a href='javascript:getFileSearchProject("+ i +");'>"+ i+ "</a></li>";
					}
						paging +="<li><a href='javascript:getFileSearchProject("+ data.pageCnt +");'aria-label='Next'><span aria-hidden='true'>&raquo;</span>";
					$(".paginationfile").html(paging);
				},	
				fail : function(xhr){
					console.log(xhr);
				}
			});
		}
		//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 나의 일감 목록 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		function getmyTodoProjectList(page){
			var pageSize = 10;
			$.ajax({
				type: "GET",
				url : "/myTodoProjectListAjax",
				data: {"page":page, "pageSize":pageSize},
				success : function(data){
					var html = "";
					$.each(data.projectTodoList, function(idx,mt){
						console.log(data.projectTodoList);
						html += "<tr class = 'todoClick'>";
						html += "	<td>"+ mt.rnum +"</td>";
						html += "	<td>"+ mt.project_id +"</td>";
						html += "	<td id='todoIdTD' style='display:none;'>"+ mt.todo_id +"</td>";
						html += "	<td id='workIdTD' style='display:none;'>"+ mt.work_id +"</td>";
						html += "	<td>"+ mt.project_title +"</td>";
						html += "	<td>"+ mt.todo_content +"</td>";
						if(mt.todo_complet==('N')){
							html += "	<td>"+ '미완료' +"</td>";
						}else{
							html += "	<td>"+ '완료' +"</td>";							
						}
						html += "</tr>";
					});
					console.log(data.projectTodoList);
					$("#projectTodoList").html("");
					$("#projectTodoList").html(html);
					//$("#todoIdTD").hide();
					//$("#workIdTD").hide();
			        
					var i  = 1;
					var paging ="";
						paging +="<li><a href='javascript:getmyTodoProjectList("+ i +");'aria-label='Previous'><span aria-hidden='true'>&laquo;</span>";
						for(var i= 1; i<=data.pageCnt; i++) {
							paging += "<li><a href='javascript:getmyTodoProjectList("+ i +");'>"+ i + "</a></li>";
						}
							paging +="<li><a href='javascript:getmyTodoProjectList("+ data.pageCnt +");'aria-label='Next'><span aria-hidden='true'>&raquo;</span>";
						$(".pagination3").html(paging);
				},	
				fail : function(data){
					console.log(data);
				}
			});
		}
		function getSearchTodoProject(page){
			
			$("#searchTodoProjectPage").attr("value",page);	
			var param = $('#searchTodoProject').serialize();
				$.ajax({
					type: "POST",
					url : "/searchTodoProjectAjax",
					data: param,
					success : function(data){
						var html = "";
						$.each(data.projectTodoList, function(idx,mt){
							html += "	<td>"+ mt.rnum +"</td>";
							html += "	<td>"+ mt.project_id +"</td>";
							html += "	<td id ='todoIdTD' style='display:none;'>"+ mt.todo_id +"</td>";
							html += "	<td id ='workIdTD' style='display:none;'>"+ mt.work_id +"</td>";
							html += "	<td>"+ mt.project_title +"</td>";
							html += "	<td>"+ mt.todo_content +"</td>";
							if(mt.todo_complet==('N')){
								html += "	<td>"+ '미완료' +"</td>";
							}else{
								html += "	<td>"+ '완료' +"</td>";							
							}
							html += "</tr>";
						});
						console.log(data.projectTodoList);
						$("#projectTodoList").html("");
						$("#projectTodoList").html(html);
						//$("#todoIdTD").hide();
						//$("#workIdTD").hide();
				        
						var i  = 1;
						var paging ="";
						paging +="<li><a href='javascript:getSearchTodoProject("+ i +");'aria-label='Previous'><span aria-hidden='true'>&laquo;</span>";
						for(var i= 1; i<=data.pageCnt; i++) {
							paging += "<li><a href='javascript:getSearchTodoProject("+ i +");'>"+ i+ "</a></li>";
						}
							paging +="<li><a href='javascript:getSearchTodoProject("+ data.pageCnt +");'aria-label='Next'><span aria-hidden='true'>&raquo;</span>";
						$(".pagination3").html(paging);
					},	
					fail : function(data){
						console.log(data);
					}
				});
			}
	</script>


<form  id = "frm" action="/projectClickDetail" method = "get">
	<input type = "hidden" id = "project_title" name = "project_title"/>
	<input type = "hidden" id = "project_id" name = "project_id"/>
</form>

<form  id = "frm2" action="/projectBookClickDetail" method = "get">
	<input type = "hidden" id = "project_title2" name = "project_title"/>
	<input type = "hidden" id = "project_id2" name = "project_id"/>
</form>
	<!-- CURRENT SECTION(MAIN) -->	
	<section class="currentMain">
		<div class="currentMainContainer">
			<div class="myPageContainerTitle">
				<h2>사용자 기본 정보</h2>
			</div>
				
			<div class="myPageContainer">
				<!-- 마이페이지 사용자 정보 수정 부분  -->
				<form action="/myPageUpdate" method="post" enctype="multipart/form-data">
				<div class="myPageContainerLeft">
					<div class="myPageContainerLeftUser">
						<h2>${memberVo.member_name}님의 프로필</h2>
						<div class="profileImg">
							<div id="fileList" style="background-image:url('${memberVo.member_profile}');background-repeat:no-repeat;background-position:50% 50%;background-size:cover;">
								<c:choose>
									<c:when test="${memberVo.member_profile != null}">
										<input type="file" name="member_profile" id="fileElem" class="fileInputCSS" multiple accept="image/*" style="display:none">								
									</c:when>
									<c:otherwise>
										<div>
										<input type="file" name="member_profile" id="fileElem" class="fileInputCSS" multiple accept="image/*" style="display:none" onchange="handleFiles(this.files)">
										</div>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="profileUploadImg">
								<a href="#" id="fileSelect"></a>
							</div>
						</div>
					</div>
					<div class="myPageContainerRightUser">
						<div class="userContentsInfoRight_1">
							<ul id="test">
								<li>사용자 이메일</li>
								<li>사용자 이름 </li>
								<li>휴대폰 번호</li>
								<li id="telnumLi">인증번호 입력</li>
								<li id="inpupass1">현재 비밀번호</li>
								<li id="inpupass2">새 비밀번호</li>
								<li id="inpupass3">새 비밀번호 확인</li>
							</ul>
						</div>
						<div class="userContentsInfoRight_2">
							<ul>
								<li><input type="text" value= "${memberVo.member_mail}" disabled="disabled" id = "member_mail"  name = "member_mail"/></li>
								<li><input type="text" value= "${memberVo.member_name}" name ="member_name" id ="member_name"/></li>
								<li><input type="text"  value= "${memberVo.member_tel}" name ="member_tel"  id ="member_tel"/>
									<input type="button" onclick="telAjax();" value="인증" class="phoneBtns"/>
								<li><input type="text" id ="telnum" placeholder="인증번호 4자리를 입력해주세요.." onkeyup="onkeyup_event();" required/>
									<span class = "inputerror"> 인증번호를 입력해 주세요..</span>
									<span class= "telerror"> 인증번호가 일치하지 않습니다.</span>
								</li>
								<li><input type="password" id = "pass1" onkeyup="onkeyup_event2(); " required/>
									<span class="passNot"> 비밀번호가 일치하지 않습니다.. </span>
								</li>
								<li>
									<input type="password" id = "pass1input" name = "member_pass"required/>
								</li>
								<li>
									<input type="password" id = "pass2input"  onkeyup="onkeyup_event3();"required/>
									<span class="error"> 입력하신 비밀번호가 일치하지 않습니다.</span>
								</li>
								<li>
									<input type="button" value="변경" class = "updateBtn"/>
									<input type="submit" value="확인" class = "saveBtn"/>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</form>				
				<div class="myPageContainerRight">
					<div class="myPageContainerRightLeftChart">
						<canvas id="myChart" width="349" height="560"></canvas>
					</div>
					<div class="myPageContainerRightRightChart">
						<canvas id="myChart2" width="349" height="560"></canvas>
					</div>
				</div>
			</div>
			<div class="myPageBottomContainer">
					<div id="tabs2">
						<ul>							
							<li><a href="#tabs2-1">참여중인 프로젝트</a></li>
							<li><a href="#tabs2-1-1">참여했던 프로젝트</a></li>
							<li><a href="#tabs2-2">즐겨찾기한 프로젝트</a></li>
							<li><a href="#tabs2-3">일감 조회</a></li>
							<li><a href="#tabs2-4">파일보관함</a></li>
							<li><a href="#tabs2-5">회원탈퇴</a></li>
						</ul>

						<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 참여중인 목록  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
						<div id="tabs2-1">
							<div class="projectTable">
								<div class="projectSearchDiv">
									<form name ="searchProject" method="POST" onsubmit="return false;">
										<input type="text" id="searchText" name="searchText" value="${searchText}" placeholder="검색어를 입력해주세요"/>
										<input type="hidden" name="page" id="projectSearchPage" value='1' />
										<input type="hidden" name="pageSize" value='10' />
										<i class="icon-magnifier icons searchBtn" onclick="javascript:getSearchProject();"></i>  
									</form>
									<button onclick="getMyPageList(1);" class="getMyPageList">목록으로</button>
								</div>
								<table>
									<colgroup width="10%" />
									<colgroup width="45%" />
									<colgroup width="15%" />
									<colgroup width="30%" />
									<thead>
										<tr class="projectClick">
											<th><span>번호</span></th>
											<th><span>참여중인 프로젝트 명</span></th>
											<th><span>프로젝트 아이디 </span></th>
											<th><span>프로젝트 팀장</span></th>
										</tr>
									</thead>
									<tbody id ="projectList">
									</tbody>
								</table>
								<div class="text-center">
									 <ul class="pagination"></ul>
								</div>
							</div>
						</div>
						<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 참여했던 목록  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
						<div id="tabs2-1-1">
							<div class="projectTable">
								<div class="projectSearchDiv">　　
									<form name ="searchEndProject" method="POST" onsubmit="return false;">
										<input type="text" id="searchEndText" name="searchEndText" value="${searchEndText}" placeholder="검색어를 입력해주세요"/>
										<input type="hidden" name="page" id="projectEndSearchPage" value='1' />
										<input type="hidden" name="pageSize" value='10' />
										<i class="icon-magnifier icons searchBtn" onclick="javascript:getSearchEndProject();"></i>  
									</form>
									<button onclick="getMyEndPageList(1);" class="getMyPageList">목록으로</button>
								</div>
								<table>
									<colgroup width="10%" />
									<colgroup width="45%" />
									<colgroup width="15%" />
									<colgroup width="30%" />
									<thead>
										<tr>
											<th><span>번호</span></th>
											<th><span>참여했던 프로젝트 명</span></th>
											<th><span>프로젝트 아이디 </span></th>
											<th><span>프로젝트 팀장</span></th>
										</tr>
									</thead>
									<tbody  id ="projectEndList">
									</tbody>
									</table>
								<div class="text-center">
									 <ul class="pagination1"></ul>
								</div>
							</div>
						</div>
						<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 즐겨찾기 목록 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
						<div id="tabs2-2">
							<div class="projectTable">
								<div class="projectSearchDiv">　　
									<form name ="searchBookProject" method="POST" onsubmit="return false;">
										<input type="text" id="searchBookText" name ="searchBookText" value='${searchBookText}' placeholder="검색어를 입력해주세요"/>
										<input type="hidden" name="page" id="searchBookProjectPage" value='1' />
										<input type="hidden" name="pageSize" value='10' />
										<i class="icon-magnifier icons searchBtn" onclick="javascript:getSearchBookProject();"></i>  
									</form>
									<button onclick="getmybookMarkProjectList(1);" class="getMyPageList">목록으로</button>
								</div>
								<table>
									<colgroup width="10%" />
									<colgroup width="45%" />
									<colgroup width="15%" />
									<colgroup width="30%" />
									<thead>
										<tr class = "projectBookClick" >
											<th><span>번호</span></th>
											<th><span>즐겨찾기한 프로젝트 명</span></th>
											<th><span> 프로젝트 아이디</span></th>
											<th><span>프로젝트 팀장</span></th>
										</tr>
									</thead>
									<tbody id ="projectBookList">
									</tbody>
								</table>
								<div class="text-center">
									 <ul class="pagination2"></ul>
								</div>
							</div>
						</div>
						<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 일감 보관 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
						<div id="tabs2-3">
							<div class="projectTable">
								<div class="projectSearchDiv">　　
								 <form name ="searchTodoProject" id ="searchTodoProject" method="POST" onsubmit="return false;">
										<input type="text" id="searchTodoText" name ="searchTodoText" value='${searchTodoText}'  placeholder="검색어를 입력해주세요"/>
										<input type="hidden" name="page" id="searchTodoProjectPage" value='1' />
										<input type="hidden" name="pageSize" value='10' />
										<i class="icon-magnifier icons" onclick="javascript:getSearchTodoProject();"></i>  
									</form> 
								<button onclick="getmyTodoProjectList(1);" class="getMyPageList">목록으로</button>
								</div>
								<table>
									<colgroup width="10%" />
									<colgroup width="10%" />
									<colgroup width="20%" />
									<colgroup width="40%" />
									<colgroup width="10%" />
									<thead>
										<tr class="todoClick">
											<th><span>번호</span></th>
											<th><span>프로젝트 번호 </span></th>
											<!-- <th><span>할일 번호 </span></th>
											<th><span>일감 번호 </span></th> -->
											<th><span>프로젝트 명 </span></th>
											<th><span>나의 일감 보관</span></th>
											<th><span>완료 여부</span></th>
										</tr>
									</thead>
									<tbody id ="projectTodoList">
									</tbody>
								</table>
								<div class="text-center">
									 <ul class="pagination3"></ul>
								</div>
							</div>
						</div>
						<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 파일 보관함 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
						<div id="tabs2-4">
							<div class="projectTable">
							<%-- 	<select name="selectBox"class="recipientSelect">
									<option> 프로젝트 명 </option>
 									<c:forEach items="${selectProjectMember}" var="mf">
										<option onchange="javascript:getmyProjectFileSelect(${mf.project_id});">${mf.project_title}</option>
									</c:forEach> 
								</select> --%>
								<div class="projectSearchDiv">
									<form name ="searchFileList" method="POST" onsubmit="return false;">
										 <input type="text" id="searchFileList" name ="searchFileList" value='${searchFileList}' placeholder="검색어를 입력해주세요"/>
										<input type="hidden" name="page" id ="projectsearchFileListPage" value='1' />
										<input type="hidden" name="pageSize" value='10' />
										<i class="icon-magnifier icons" onclick="javascript:getFileSearchProject();"></i>  
									</form> 
								<button onclick="getmyProjectFileList(1);" class="getMyPageList">목록으로</button>
								</div>
								<table>
									<colgroup width="10%" />
									<colgroup width="10%" />
									<colgroup width="20%" />
									<colgroup width="30%" />
									<colgroup width="20%" />
									<thead>
										<tr>
											<th><span>번호</span></th>
											<th><span>파일 아이디</span></th>
											<th><span>프로젝트 명</span></th>
											<th><span>파일 명</span></th>
											<th><span>파일 다운로드</span></th>
										</tr>
									</thead>
									<tbody id ="myFileList">
									</tbody>
								</table>
								<div class="text-center">
									 <ul class="paginationfile"></ul>
								</div>
							</div>
						</div>
						<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
						<div id="tabs2-5">
							<div class="tabs2-5center">
							<h2>회원 탈퇴 </h2>
								<p> 회원 확인을 위하여 비밀번호를 입력해주세요. </p>
								<input id = "passwordEnd" onkeyup="onkeyup_eventEND();" placeholder ="비밀번호를 입력해주세요.." type="password" style="font-family:'Malgun Gothic';"/>
								<input type="button" class="goodbyeBtn" value= "확인"/>
								<span id = "passError"> 비밀번호가 일치하지 않습니다. </span>
							</div>
						</div>
						<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
					</div>
				</div>
		</div>
	</section>
	<footer class="currentFooter">
		<div class="footerContent">
			<p>
				대전광역시 중구 중앙로 76 영민빌딩 2층 203호<br>
				기관명: (재)대덕인재개발원, 최종프로젝트 PMS(Project Management System)<br>
				Copyright 2018 <span>DDIT 203 Class, CURRENT</span> All rights reserved. 
			</p>
		</div>
	</footer>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.2/js/swiper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.js"></script>
<script type="text/javascript" src="js/classie.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<script>
// DIM POPUP - 팀원초대
$('.projectCreatePopUps').click(function(){
    var $hrefs = $(this).attr('href');
    layer_popups($hrefs);
});
function layer_popups(els){
    var $els = $(els);        //레이어의 id를 $el 변수에 저장
    var isDims = $els.prev().hasClass('dimBgs');   //dimmed 레이어를 감지하기 위한 boolean 변수

    isDims ? $('.dim-layers').fadeIn() : $els.fadeIn();

    var $elWidths = ~~($els.outerWidth()),
        $elHeights = ~~($els.outerHeight()),
        docWidths = $(document).width(),
        docHeights = $(document).height();

    // 화면의 중앙에 레이어를 띄운다.
    if ($elHeights < docHeights || $elWidths < docWidths) {
        $els.css({
            marginTop: -$elHeights /2,
            marginLeft: -$elWidths/2
        })
    } else {
        $els.css({top: 0, left: 0});
    }

    $els.find('a.btn-layerCloses').click(function(){
        isDims ? $('.dim-layers').fadeOut() : $els.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
        return false;
    });

    $('.layer .dimBgs').click(function(){
        $('.dim-layers').fadeOut();
        return false;
    });
}

var menuLeft = document.getElementById('cbp-spmenu-s1'),
	 showLeftPush = document.getElementById('showLeftPush'),
	 body = document.body;

$("#showLeftPush").click(function(){
	classie.toggle( this, 'active' );
	classie.toggle( body, 'cbp-spmenu-push-toright' );
	classie.toggle( menuLeft, 'cbp-spmenu-open' );
});

function dialog(){
	var dialogBox = $('.dialog'),
		 dialogTrigger = $('.dialog__trigger'),
		 dialogAction = $('.dialog__action');
		 
		 // Open the dialog
		 dialogTrigger.on('click', function(e){
			 dialogBox.toggleClass('dialog--active');
			 e.stopPropagation()
		 });

		 $(".dialog").click(function(){
			 dialogBox.toggleClass('dialog--active');
		 });

		 $(".dialog__triggers").click(function(){
			 dialogBox.removeClass('dialog--active');
		 });

		 // Close the dialog - press escape key // key#27
		 $(document).keyup(function(e){
			 if(e.keyCode === 27){
				 dialogBox.removeClass('dialog--active');
			 }
		 });
};
// Run function when the document has loaded
$(function(){
	dialog();
});
function dialogs(){
	var dialogBoxs = $('.dialogs'),
		 dialogTriggers = $('.dialog__triggers'),
		 dialogActions = $('.dialog__actions');
		 
		 // Open the dialog
		 dialogTriggers.on('click', function(e){
			 dialogBoxs.toggleClass('dialog--actives');
			 e.stopPropagation()
		 });

		 $(".dialogs").click(function(){
			 dialogBoxs.toggleClass('dialog--actives');
		 });

		 $(".dialog__trigger").click(function(){
			 dialogBoxs.removeClass('dialog--actives');
		 });

		 // Close the dialog - press escape key // key#27
		 $(document).keyup(function(e){
			 if(e.keyCode === 27){
				 dialogBoxs.removeClass('dialog--actives');
			 }
		 });
};
// Run function when the document has loaded
$(function(){
	dialogs();
});

// 알람 탭 메뉴
$("#tabs").tabs();

// 마이페이지 하단 탭 메뉴
$("#tabs2").tabs();

window.URL = window.URL || window.webkitURL;

var fileSelect = document.getElementById("fileSelect"),
    fileElem = document.getElementById("fileElem"),
    fileList = document.getElementById("fileList");

fileSelect.addEventListener("click", function (e) {
  if (fileElem) {
    fileElem.click();
  }
  e.preventDefault(); // prevent navigation to "#"
}, false);

function handleFiles(files) {
  if (!files.length) {
    fileList.innerHTML = "";
  } else {
    fileList.innerHTML = "";
    var list = document.createElement("div");
    fileList.appendChild(list);
    for (var i = 0; i < files.length; i++) {
            
      var img = document.createElement("img");
      img.src = window.URL.createObjectURL(files[i]);
      img.height = 150;
      img.onload = function() {
        window.URL.revokeObjectURL(this.src);
      }
      list.appendChild(img);
    }
  }
}

var ctx = document.getElementById("myChart").getContext('2d');
var myChart = new Chart(ctx, {
    type: 'line',
    data: {	
        labels: ["참여중" , "참여했던" , "즐겨찾기", "일감"],
        datasets: [{
        	  label: '${memberVo.member_name} 님의 CURRENT',
            data: [${totalProjectCnt}, ${totalEndProjectCnt}, ${selectProjectCnt}, ${selectTodoCnt}],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)'
            ],
            borderColor: [
                'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero:true
                }
            }]
        }
    }
});

var ctx2 = document.getElementById("myChart2").getContext('2d');
var myChart2 = new Chart(ctx2, {
    type: 'horizontalBar',
    data: {
    	labels: ["참여중" , "참여했던" , "즐겨찾기", "일감"],
        datasets: [{
            label: '${memberVo.member_name} 님의 CURRENT',
            data: [${totalProjectCnt}, ${totalEndProjectCnt}, ${selectProjectCnt}, ${selectTodoCnt}],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)'
            ],
            borderColor: [
                'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero:true
                }
            }]
        }
    }
});




</script>
</body>
</html>