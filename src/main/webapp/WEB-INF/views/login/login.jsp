<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login.jsp</title>
</head>
	 <form action="/user/loginProcess" method="post">
	        <h2> 로그인 </h2>
		        <label for="inputEmail">Id(Email)</label><br>
		       	 	<input type="text" name="userId" id = "userId" placeholder="userId"><br>
		        <label for="inputPassword">Password</label><br>
		        	<input type="password"  name="pass" id ="password" placeholder="Password"><br>
	        <button type="submit"> 로그인 </button>
      </form>
      <form action="/user/signView" method="post">
     		<button type="submit"> 회원가입  </button>
	   </form>
</body>
</html>