<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
    <% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script language="javascript">
function replyCheck(){
	var form = document.replyform;
	
	if( !form.name.value){ //form에 있는 name 값이 없을 때
		alert("이름을 적어주세요");
		form.name.focus(); //form에 있는 name위치로 이동
		return;
	}
	if( !form.password.value){
		alert("비밀번호를 적어주세요");
		form.password.focus();
		return;
	}
	if( !form.title.value){
		alert("제목을 적어주세요");
		form.title.focus();
		return;
	}
	if( !form.memo.value){
		alert("내용을 적어주세요");
		form.memo.focus();
		return;
	}
	form.submit();
}
</script>
<%
	String checkName = "";
	checkName = (String)session.getAttribute("s_name");
	if(checkName == null){
	%>
	<script>
	self.window.alert("먼저 로그인 하세요");
	location.href = "javascript:history.back()";
	</script>		
	<%
	}
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		String id = "";
		String pass = "";
		String title = "";
		Statement stmt = null;
		String jdbcDriver = "com.mysql.cj.jdbc.Driver";
		String jdbcUrl = "jdbc:mysql://localhost/jquery?serverTimezone=UTC&characterEncoding=UTF-8";
		
		try {
			Class.forName(jdbcDriver);
			conn = DriverManager.getConnection(jdbcUrl, "testuser", "1234");
			stmt = conn.createStatement();
			sql = "select title from list where NUM=" + idx;
			rs = stmt.executeQuery(sql);
			
			if(rs.next()){
				title = rs.getString(1);
			}
			rs.close();
			stmt.close();
			conn.close();
		}catch(SQLException e){
			
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

#reply-page{
	background-color:#e9e9e9;
}
#reply-table{
	background-color:#D5D5D5;
}
	#btn-td{
	font-size:15px;
	text-align:center;
	margin:10px;
	width:100%;
}
</style>
</head>
<body>
<div data-role="page" id="reply-page">
	<div data-role="header" id="reply-header" data-position="fixed"></div><!-- reply-header -->
		<div data-role="content" style="height:100vh;">
			<form name = replyform method = post action = "reply_ok.jsp?idx=<%=idx %>" >
			<table align="center" width="100%" id="reply-table">
				<tr>
					<td>
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
						<tr style="background:url('images/table_mid.gif') repeat-x; text-align:center;">
							<td width="5"><img src = "images/table_left.gif" width="5" height="30"></td>
							<td>답글</td>
							<td width="5"><img src = "images/table_right.gif" width="5" height="30"></td>
						</tr>
						</table>
					<table width="100%" >
						<tr>
							<td>&nbsp;</td>
							<td align="center"><strong>제목</strong></td>
							<td><input name="title" size="50" maxlength="100" value="<%=title %>"></td>
							<td>&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4"></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td align="center"><strong>이름</strong></td>
							<td><input name="name" size="50" maxlength="100" value=<%=checkName %>></td>
							<td>&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd"><td colspan="4"></td>
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
							<td>&nbsp;</td>
							<td colspan="2" id="td" width="100%">
							<div id="btn-td"  >
								<div><a href="#" OnClick="javascript:replyCheck()" class="ui-btn">등록</a></div>
								<div><a href="#" OnClick="javascript:history.back(-1)" class="ui-btn">취소</a></div>
							</div>
							</td>
							<td>&nbsp;</td>
						</tr>
					</table>
					</td>
				</tr>
			</table><!-- end table -->
			</form><!-- end form -->
		</div><!-- reply-content -->
		<div data-role="footer" id="reply-footer" data-position="fixed">
		</div><!-- reply-footer -->
</div><!-- reply-page  -->
</body>
</html>