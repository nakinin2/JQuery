<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import = "java.sql.*"%>
<% request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 삭제</title>
<%
		int idx = Integer.parseInt(request.getParameter("idx"));
%>
<link href="jquery/jquery.mobile-1.4.5.min.css" rel="stylesheet" type="text/css"/>
<link href="css/delete_style.css" rel="stylesheet" type="text/css"/>

<script src="jquery/jquery.min.js" type="text/javascript"></script>
<script src="jquery/jquery.mobile-1.4.5.min.js" type="text/javascript"></script>
<script src="function/delete-function.js" type="text/javascript"></script>
</head>
<body>
<div data-role="page" id="del-page">
	<div data-role="header" id="del-header" data-position="fixed">
		<a href="#" OnClick="javascript:history.back(-1);" id="btn-a" class="ui-btn-left" data-iconpos="notext" data-role="none" data-ajax="false"><img src="images/back-btn.png" id="back-Icon" alt="뒤로 가기"></a>
		<h1 align="center" id="del-header-text">고객 센터</h1>
	</div><!-- del-header -->
	<div data-role="content" style="height:100%;">
		<form name = deleteform method=post action="delete_ok.jsp?idx=<%=idx%>">
		<table id="del-table" align="center" width="100%">
			<tr style="font-size:18px; height:40px;">
				<td>
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
						<tr style="background:url('images/table_mid.gif') repeat-x; text-align:center;">
							<td width="5"><img src = "images/table_left.gif" width="5" height="30"></td>
							<td>삭제</td>
							<td width="5"><img src ="images/table_right.gif" width="5" height="30"></td>
						</tr>
					</table>
				<table width="100%">
					<tr style="font-size:18px; height:40px;">
						<td>&nbsp;</td>
						<td align="center"><strong>비밀번호</strong></td>
						<td><input name = "password" type = "password" size="50" maxlength="100"></td>
						<td>&nbsp;</td>
					</tr>
					<tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
					<tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
					<tr align="center">
						<td>&nbsp;</td>
						<td colspan="2">
						<div class = "submit-btn-div">
							<div style="padding:5px; "><a href="#" id="submit-btn" OnClick ="javascript:deleteCheck();"data-inline="true" class="ui-btn" data-ajax="false">삭제</a></div>
							<div style="padding:5px;"><a href="#" id="reset-btn" OnClick="javascript:history.back(-1)"data-inline="true" class="ui-btn" >취소</a></div>
						</div>
						</td>
						<td>&nbsp;</td>
					</tr>
				</table>
				</td>
			</tr>
		</table><!-- end table -->
		</form><!-- end form-->
	</div><!-- del-content -->
	<div data-role="footer" id="del-footer" data-position="fixed">
		<div id="del-copyright" >
			Copyright (c) 2018 yangjeong All rights reserved
		<div id="del-SNS">
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
	</div><!-- del-footer-page -->
</div><!-- del-page -->
</body>
</html>