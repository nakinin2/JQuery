<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="jquery/jquery.mobile-1.4.5.min.css" rel="stylesheet" type="text/css"/>
<link href="css/customer_style.css" rel="stylesheet" type="text/css"/>

<script src="jquery/jquery.min.js" type="text/javascript"></script>
<script src="jquery/jquery.mobile-1.4.5.min.js" type="text/javascript"></script>
</head>
<body>
<%
	String checkName= "";
	String checkId = "";
	String checkNickname="";
	String checkTel="";
	String checkEmail="";
	String checkPasswd="";
	checkName = (String)session.getAttribute("check_name");
	checkId = (String)session.getAttribute("check_id");
	checkNickname = (String)session.getAttribute("check_nickname");
	checkTel = (String)session.getAttribute("check_tel");
	checkEmail = (String)session.getAttribute("check_email");
%><%
	checkPasswd = (String)session.getAttribute("s_passwd");
%>
<div data-role="page" id="custom-page">
<div data-role="header" id="custom-header"data-position="fixed">
	<a href="#" OnClick="javascript:history.back(-1);" data-role="none" data-iconpos="notext" class="ui-btn-left" data-ajax="false"><img src="images/home-button.png" id="custom-main-home-Icon" alt="메인으로"></a>
	<h1 align="center" id="custom-header-text">내 정보</h1>
</div><!-- custom-header -->
<div data-role="content" id="custom-content">
<table id="custom-table" widht="100vw" height="100vh">
	<tr  class= "field" align="center">
		<td rowspan="2"><strong>내 정보</strong></td>
		<td><strong>아이디</strong></td>
		<td><strong>이  름</strong></td>
		<td><strong>닉네임</strong></td>
		<td><strong>전화번호</strong></td>
		<td><strong>이메일</strong></td>
	</tr>
	<tr>
		<td><strong><%= checkId %></strong></td>
		<td><strong><%= checkName %></strong></td>
		<td><strong><%= checkNickname %></strong></td>
		<td><strong><%= checkTel %></strong></td>
		<td><strong><%= checkEmail %></strong></td>
	</tr>
</table>
</div><!-- custom-content -->
<div data-role="footer" id="custom-footer" data-position="fixed">
	<div id="custom-copyright" >
			<h3>Copyright (c) 2018 yangjeong All rights reserved</h3>
		<div id="custom-SNS">
			<a href="http://facebook.com" target="_blank">
				<img src="images/facebook.gif" height="32" alt="Facebook">
			</a>
			<a href="http://twitter.com" target="_blank">
				<img src="images/twitter.gif" height="32" alt="Twitter">
			</a>
			<a href="http://plus.google.com" target="_blank">
				<img src="images/googleplus-icon.png" height="32" alt="Google Plus">
			</a>
		</div>
		</div>	
</div><!-- custom-footer -->
</div><!-- custom-page -->


</body>
</html>