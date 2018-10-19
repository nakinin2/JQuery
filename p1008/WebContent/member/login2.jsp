<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="jquery/jquery.mobile-1.4.5.min.css" rel="stylesheet" type="text/css"/>
<script src="jquery/jquery.js" type="text/javascript"></script>
<script src="jquery/jquery.mobile-1.4.5.min.js" type="text/javascript"></script>
</head>
<body>
<div data-role="page" id="page">
	<div data-role="panel" id="panel3" data-display="overlay" data-theme="b" data-position="right">
		<form>
        	<h3>로그인 패널</h3>
            <label for="name">사용자명:</label>
            <input name="name" id="name" type="text" value="" data-mini="ture" data-clear-btn="true">
            <label for="password">비밀번호:</label>
            <input type="password" id="password" name="password" value="" data-mini="ture" data-clear-btn="true">
            <div class="ui-grid-a">
            	<div class="ui-block-a"><a href="#" data-role="button" data-rel="close">취소</a></div>
                <div class="ui-block-b"><a href="#" data-role="button" data-rel="close">저장</a></div>
            </div>    
        </form>
	</div>
    
    <div data-role="header">
		<h1>header 영역</h1>
		<a href="#panel3" data-role="button" data-inline="true">로그인 패널</a>
	</div>

    
	<div data-role="footer" data-position="fixed">
		<h4>footer 영역</h4>
	</div>
</div>
</body>
</html>