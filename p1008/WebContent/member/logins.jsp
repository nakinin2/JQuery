<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>로그인 폼</title>
<link href="jquery/jquery.mobile-1.4.5.min.css" rel="stylesheet" type="text/css"/>
<script src="jquery/jquery.js" type="text/javascript"></script>
<script src="jquery/jquery.mobile-1.4.5.min.js" type="text/javascript"></script>
<script src="jquery/jquery.min.js"></script>
</head>
<body>
		<div class="ui-corner-all" id="page4" data-role="popup" data-theme="a">
		    <form>
		        <div style="padding: 10px 20px;">
		            <h3 align="center">로그인</h3>
		            <label class="ui-hidden-accessible" for="un">Username:</label>
		            <input name="user" id="un" type="text" placeholder="username" value="" data-theme="a">
		            <label class="ui-hidden-accessible" for="pw">Password:</label>
		            <input name="pass" id="pw" type="password" placeholder="password" value="" data-theme="a">
		            <button class="ui-btn ui-corner-all ui-shadow ui-btn-b ui-btn-icon-left ui-icon-check" type="submit">Sign in</button>
		        </div>
		    </form>
    	</div>
</body>
</html>