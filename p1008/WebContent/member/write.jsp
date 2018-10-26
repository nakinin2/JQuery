<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
<% String checkName = "";
	checkName = (String)session.getAttribute("s_name");
	if(checkName == null) { //checkName에 값이 없다면
	%>  
	<script>
	self.window.alert("먼저 로그인을 하세요.");
	location.href = "javascript:history.back()";
	</script>
	<%
	}
	%>

<link href="jquery/jquery.mobile-1.4.5.min.css" rel="stylesheet" type="text/css"/>
<link href="css/write-style.css" rel="stylesheet" type="text/css">
<link href="css/main-form_style.css" rel="stylesheet" type="text/css"/>
<link href="css/list-style.css" rel="stylesheet" type="text/css"/>
<link href="css/reply-style.css" rel="stylesheet" type="text/css"/>
<link href="css/view-style.css" rel="stylesheet" type="text/css"/>
<link href="css/delete-style.css" rel="stylesheet" type="text/css"/>
<link href="css/modify-style.css" rel="stylesheet" type="text/css"/>
<link href="css/main-form_style.css" rel="stylesheet" type="text/css"/>

<script src="jquery/jquery.js" type="text/javascript"></script>
<script src="jquery/jquery.mobile-1.4.5.min.js" type="text/javascript"></script>
<script src="jquery/jquery.min.js" type="text/javascript"></script>
<script src="function/write-function.js" type="text/javascript"></script>
<script src="function/reply-function.js" type="text/javascript"></script>
<script src="function/delete-function.js" type="text/javascript"></script>
<script src="function/modify-function.js" type="text/javascript"></script>
</head>
<body>
<div data-role="page" id="write-page">
	<div data-role="header" id="write-header" data-position="fixed">
		<h1 align="center" id="write-header-text">고객 센터</h1>
	</div><!-- write-header-page -->
		<div data-role="content" style="height:100%;">
			<form name= writeform method=post action="write_ok.jsp" >
				<table id="table" align="center" style="width:100%;">
					<tr>
						<td>
						<table width="100%" cellpadding="0" cellspacing="0" border="0">
					<tr style= "background:url('images/table_mid.gif') repeat-x; text-align:center;">
						<td width= "5"><img src="images/table_left.gif" width="5" height="30"></td>
						<td><strong>글쓰기</strong></td>
						<td width="5"><img src= "images/table_right.gif" width="5" height="30"></td>
					</tr>
						</table>
					<table width="100%">
						<tr>
							<td> &nbsp;</td>
							<td align="center"><strong>제목</strong></td>
							<td><input name="title" size="50" maxlength="100"></td>
							<td>&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4"></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td align="center"><strong>이름</strong></td>
							<td><input name="name" size="50" maxlength="50" value=<%=checkName %>></td>
							<td>&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4"></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td align="center"><strong>비밀번호</strong></td>
							<td><input type="password" name="password" size="50" maxlength="50"></td>
							<td>&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4"></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td align="center"><strong>내용</strong></td>
							<td><textarea name="memo" cols="50" rows="13"></textarea></td>
							<td>&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4"></td>
						</tr>
						<tr height="1" bgcolor="#82B5DF">
							<td colspan="4"></td>
						</tr>
						<tr>
							<td>&nbsp;</td><!-- <a href="#" OnClick="javascript:writeCheck();">등록</a> <input type=button value="등록" OnClick="javascript:writeCheck();"> -->
							<td colspan="2" >
								<div  class="write-btn-tr" >
									<a href="#" OnClick="javascript:writeCheck();" style="color:black;" >등록</a>
									<a href="#" OnClick="javascript:history.back(-1)" style="color:black;">취소</a>
								</div>
							<td>&nbsp;</td>
						</tr>
					</table>
					</td>
					</tr>
				</table><!-- end table -->
			</form><!-- end form -->
		</div><!-- write-content-page -->
		<div data-role="footer" id="write-footer" data-position="fixed">
			<div id="write-copyright" >
				Copyright (c) 2018 yangjeong All rights reserved
				<div id="write-SNS">
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
		</div><!-- write-footer-page -->
</div><!-- write-page -->
</body>
</html>