<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
<script language = "javascript"> //자바 스크립트 시작
function writeCheck(){
	var form = document.writeform;
	if( !form.name.value){  //form에 있는 name 값이 없을 때
		alert("이름을 적어주세요");
		//경고 창을 띄운다. form.name.focus();
		//form에 있는 name 위치로 이동
		return; //다시 돌아간다
	}
	if( !form.password.value){ //form에 있는 password 값이 없을 때
		alert("비밀번호를 적어주세요");
		form.password.focus();
		return; 
		//경고 창을 띄운다. form.password.focus();
		//form에 있는 password 위치로 이동
	}
	if( !form.title.value){ //form에 있는 title 값이 없을 때
		alert("제목을 적어주세요");
		form.title.focus();
		return; 
		//경고 창을 띄운다. form.title.focus();
		//form에 있는 title 위치로 이동
	}
	if( !form.memo.value){ //form에 있는 memo 값이 없을 때
		alert("내용을 적어주세요");
		form.memo.focus();
		return; 
		//경고 창을 띄운다. form.memo.focus();
		//form에 있는 memo 위치로 이동
	}
	form.submit();
}
</script>
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
<script src="jquery/jquery.js" type="text/javascript"></script>
<script src="jquery/jquery.mobile-1.4.5.min.js" type="text/javascript"></script>
<script src="jquery/jquery.min.js" type="text/javascript"></script>
<style>
body{
	line-height:1.2em;
	font-size:0.75em;
	background-color:#e9e9e9;
}

#write-page{
	background-color:#e9e9e9;
}

#write-header-text{
	font-size:25px;
}

#table{
	background-color:#D5D5D5;
}
.write-btn-tr{
	font-size:15px;
	text-align:center;
	margin:10px;
}

a{
text-decoration:none;
}

#write-footer{
height:80px;
}

#write-footer #write-copyright{
	margin:20px 0 0 10px;
	text-align:center;
	font-family: consolas;
	font-weight: bold;
}

#write-footer #write-SNS{
	margin:10px 20px 0 0;
	text-align:right;
}

</style>
</head>
<body>
<div data-role="page" id="write-page">
	<div data-role="header" id="write-header" data-position="fixed">
		<h1 align="center" id="write-header-text">고객 센터</h1>
	</div><!-- write-header-page -->
		<div data-role="content" style="height:100vh;">
			<form name= writeform method=post action="write_ok.jsp" >
				<table id="table" align="center" style="height:100%;">
					<tr>
						<td>
						<table width="100%" cellpadding="0" cellspacing="0" border="0">
					<tr style= "background:url('images/table_mid.gif') repeat-x; text-align:center;">
						<td width= "5"><img src="images/table_left.gif" width="5" height="30"></td>
						<td><strong>글쓰기</strong></td>
						<td width="5"><img src= "images/table_right.gif" width="5" height="30"></td>
					</tr>
						</table>
					<table>
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
									<a href="#" OnClick="javascript:writeCheck();"style="color:black;" >등록</a>
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