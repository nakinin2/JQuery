<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
</head>
<body>

<table>
<form name= writeform method=post action="write_ok.jsp">
	<tr>
		<td>
		<table width="100%" cellpadding="0" cellspacing="0" border="0">
	<tr style= "background:url('images/table_mid.gif') repeat-x; text-align:center;">
		<td width= "5"><img src="images/table_left.gif" width="5" height="30"></td>
		<td>글쓰기</td>
		<td width="5"><img src= "images/table_right.gif" width="5" height="30"></td>
	</tr>
		</table>
	<table>
		<tr>
			<td> &nbsp;</td>
			<td align="center">제목</td>
			<td><input name="title" size="50" maxlength="100"></td>
			<td>&nbsp;</td>
		</tr>
		<tr height="1" bgcolor="#dddddd">
			<td colspan="4"></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td align="center">이름</td>
			<td><input name="name" size="50" maxlength="50" value=<%=checkName %>></td>
			<td>&nbsp;</td>
		</tr>
		<tr height="1" bgcolor="#dddddd">
			<td colspan="4"></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td align="center">비밀번호</td>
			<td><input type="password" name="password" size="50" maxlength="50"></td>
			<td>&nbsp;</td>
		</tr>
		<tr height="1" bgcolor="#dddddd">
			<td colspan="4"></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td align="center">내용</td>
			<td><textarea name="memo" cols="50" rows="13"></textarea></td>
			<td>&nbsp;</td>
		</tr>
		<tr height="1" bgcolor="#dddddd">
			<td colspan="4"></td>
		</tr>
		<tr height="1" bgcolor="#82B5DF">
			<td colspan="4"></td>
		</tr>
		<tr align="center">
			<td>&nbsp;</td>
			<td colspan="2"><input type=button value="등록" OnClick="javascript:writeCheck();">
			<input type=button value="취소" OnClick="javascript:history.back(-1)">
			<td>&nbsp;</td>
		</tr>
	</table>
	</td>
	</tr>
</form>
</table>
</body>
</html>