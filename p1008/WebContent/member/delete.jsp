<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import = "java.sql.*"%>
<% request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 삭제</title>
<script>
function deleteCheck() {
	var form = document.deleteform;
	
	if( !form.password.value){
		alert("비밀번호를 적어주세요.");
		form.password.focus();
		return;
	}
			form.submit();
}
</script>
<%
		int idx = Integer.parseInt(request.getParameter("idx"));
%>
<link href="jquery/jquery.mobile-1.4.5.min.css" rel="stylesheet" type="text/css"/>
<script src="jquery/jquery.js" type="text/javascript"></script>
<script src="jquery/jquery.mobile-1.4.5.min.js" type="text/javascript"></script>
<script src="jquery/jquery.min.js" type="text/javascript"></script>
<style>
body{
	line-height:1.2em;
	font-size:0.75em;
	background-color:#e9e9e9;
}

#del-page{
	background-color:#e9e9e9;
}

#del-header-text{
	font-size:25px;
}

#del-header{
	height:55px;
}

a{
	text-decoration:none;
	color:black;
}

#del-table{
	background-color:#D5D5D5;
}

#del-footer{
height:80px;
}

#del-footer #del-copyright{
	margin:20px 0 0 10px;
	text-align:center;
	font-family: consolas;
	font-weight: bold;
}

#del-footer #del-SNS{
	margin:10px 20px 0 0;
	text-align:right;
}

.submit-btn-div{
	font-size:15px;
	text-align:center;
	margin:10px;
	width:80px;
}

</style>
</head>
<body>
<div data-role="page" id="del-page">
	<div data-role="header" id="del-header" data-position="fixed">
		<h1 align="center" id="del-header-text">고객 센터</h1>
	</div><!-- del-header -->
	<div data-role="content">
		<form name = deleteform method=post action="delete_ok.jsp?idx=<%=idx%>">
		<table id="del-table" align="center">
			<tr>
				<td>
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
						<tr style="background:url('images/table_mid.gif') repeat-x; text-align:center;">
							<td width="5"><img src = "images/table_left.gif" width="5" height="30"></td>
							<td>삭제</td>
							<td width="5"><img src ="images/table_right.gif" width="5" height="30"></td>
						</tr>
					</table>
				<table>
					<tr>
						<td>&nbsp;</td>
						<td align="center">비밀번호</td>
						<td><input name = "password" type = "password" size="50" maxlength="100"></td>
						<td>&nbsp;</td>
					</tr>
					<tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
					<tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
					<tr align="center">
						<td>&nbsp;</td>
						<td colspan="2">
						<div class = "submit-btn-div" ><a href="#" id="submit-btn" OnClick ="javascript:deleteCheck();"data-inline="true" style="color:black;">삭제</a>
						<a href="#" id="reset-btn" OnClick="javascript:history.back(-1)"data-inline="true" style="color:black; ">취소</a></div>
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