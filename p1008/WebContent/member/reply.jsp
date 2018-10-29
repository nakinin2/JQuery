<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
    <% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

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
<link href="css/reply_style.css" rel="stylesheet" type="text/css"/>

<script src="jquery/jquery.min.js" type="text/javascript"></script>
<script src="jquery/jquery.mobile-1.4.5.min.js" type="text/javascript"></script>
<script src="function/reply-function.js" type="text/javascript"></script>
</head>
<body>
<div data-role="page" id="reply-page">
	<div data-role="header" id="reply-header" data-position="fixed">
		<a href="#" OnClick="javascript:history.back(-1);" id="btn-a" class="ui-btn-left" data-iconpos="notext" data-role="none" data-ajax="false"><img src="images/back-btn.png" id="back-Icon" alt="뒤로 가기"></a>
		<h1 align="center" id="reply-header-text">고객 센터</h1>
	</div><!-- reply-header -->
		<div data-role="content" style="height:100%;">
			<form name = replyform method = post action = "reply_ok.jsp?idx=<%=idx %>" >
			<table align="center" width="100%" id="reply-table">
				<tr style="font-size:18px; height:40px;">
					<td>
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
						<tr style="background:url('images/table_mid.gif') repeat-x; text-align:center;">
							<td width="5"><img src = "images/table_left.gif" width="5" height="30"></td>
							<td>답글</td>
							<td width="5"><img src = "images/table_right.gif" width="5" height="30"></td>
						</tr>
						</table>
					<table width="100%" >
						<tr style="font-size:18px; height:40px;">
							<td>&nbsp;</td>
							<td align="center"><strong>제목</strong></td>
							<td><input name="title" size="50" maxlength="100" value="<%=title %>"></td>
							<td>&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4"></td>
						</tr>
						<tr style="font-size:18px; height:40px;">
							<td>&nbsp;</td>
							<td align="center"><strong>이름</strong></td>
							<td><strong><%=checkName %></strong><input type="hidden" name="name" size="50" maxlength="100" value=<%=checkName %>></td>
							<td>&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd"><td colspan="4"></td>
						</tr>
						<tr style="font-size:18px; height:40px;">
							<td>&nbsp;</td>
							<td align="center"><strong>비밀번호</strong></td>
							<td><input type="password" name="password" ></td>
							<td>&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4"></td>
						</tr>
						<tr style="font-size:18px; height:40px;">
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
								<div style="padding:10px;"><a href="#" OnClick="javascript:replyCheck()" class="ui-btn" >등록</a></div>
								<div style="padding:10px;"><a href="#" OnClick="javascript:history.back(-1)" class="ui-btn" >취소</a></div>
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
			<div id="list-copyright" >
				<h3>Copyright (c) 2018 yangjeong All rights reserved</h3>
				<div id="list-SNS">
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
	</div><!-- reply-footer-page -->
</div><!-- reply-page  -->
</body>
</html>