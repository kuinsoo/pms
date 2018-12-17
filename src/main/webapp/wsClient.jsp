<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>wsClient.jsp</title>
</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
var socket;
$(document).ready(function() {
	
	
	socket = new WebSocket('ws://localhost:8081/wsServer');
	
	socket.onopen = function(){
		socket.send("hello world ");
	}
	
	socket.onmessage = function(event){
		$("#chat").append(event.data + "\n");
		//console.log("onMessage :" + event.data);
	}
	
	// 보내기 버튼 클릭시 
	$("#send").on("click",function(){
		socket.send($("#text").val());
	});
});
	
</script>
	<textarea id="chat" cols = "100" rows = "30"> </textarea><br>
	<input id = "text" type = "text" /><br>
	<button id = "send"> 보내기  </button> 
	</body>
</html>











