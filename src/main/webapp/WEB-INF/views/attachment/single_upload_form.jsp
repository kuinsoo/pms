<%--
  Created by IntelliJ IDEA.
  User: Mr.KKu
  Date: 2018-12-19
  Time: 오전 10:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>${message}</title>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<body>
<form method="post" enctype="multipart/form-data" action="/single_upload?work_id=14">
    Upload File : <input type="file" name="file" id="input"/> <br/>
    Name: <input type="text" name="downUrl" value="tmppath" id="disp_path" /> <br/>
    <br /><br /><input type="submit" value="Upload" />
    <div id="disp_tmp_path"></div>
</form>
<script type="text/javascript">
	$('#input').change( function(event) {
		var tmppath = URL.createObjectURL(event.target.files[0]);
		$("img").fadeIn("fast").attr('src',URL.createObjectURL(event.target.files[0]));

		$("#disp_tmp_path").html("Temporary Path(Copy it and try pasting it in browser address bar) --> <strong>["+tmppath+"]</strong>");
		$("#disp_path").val(tmppath);
	});


</script>
</div>
</body>

</html>