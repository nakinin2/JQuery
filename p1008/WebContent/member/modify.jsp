<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%
	request.setCharacterEncoding("utf-8");
	Connection conn = null;
	PreparedStatement pstmt = null;
	String sql = "";
	ResultSet rs = null;
	String rst = ""; //정보 조회를 위한 문자 변수
	String msg = "";
	String name = null;
	String password = null;
	String title = null;
	String memo = null;
	int idx = Integer.parseInt(request.getParameter("idx"));
	
	String jdbcDriver = "com.mysql.cj.jdbc.Driver";
	String jdbcUrl = "jdbc:mysql://localhost/jquery?serverTimezone=UTC&characterEncoding=UTF-8";
	
	try{
		Class.forName(jdbcDriver);
		conn = DriverManager.getConnection(jdbcUrl, "testuser", "1234");
		Statement stmt = conn.createStatement();
		
		sql = "SELECT NAME, PASSWORD, TITLE, MEMO FROM list WHERE NUM=" + idx;
		rs = stmt.executeQuery(sql);
		
		if(rs.next()){
			name = rs.getString(1);
			password = rs.getString(2);
			title = rs.getString(3);
			memo = rs.getString(4);
		}
		rs.close();
		stmt.close();
		conn.close();
	}catch(SQLException e){
		out.println(e.toString());
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
<link href="jquery/jquery.mobile-1.4.5.min.css" rel="stylesheet" type="text/css"/>
<link href="css/modify_style.css" rel="stylesheet" type="text/css"/>

<script src="jquery/jquery.min.js" type="text/javascript"></script>
<script src="jquery/jquery.mobile-1.4.5.min.js" type="text/javascript"></script>
<script src="function/modify-function.js" type="text/javascript"></script>
</head>
<body>
	<div data-role="page" id="modi-page">
	<div data-role="header" id="modi-header" data-position="fixed">
		<a href="#" OnClick="javascript:history.back(-1);" id="btn-a" class="ui-btn-left" data-iconpos="notext" data-role="none" data-ajax="false"><img src="images/back-btn.png" id="back-Icon" alt="뒤로 가기"></a>
		<h1 id="modi-header-text">고객센터</h1>
	</div><!-- modi-header -->
	<div data-role="content" id="modi-content" style="height:100%;">
		<form name = modifyform method=post action="modify_ok.jsp?idx=<%=idx %>">
		<table align="center" style="width:100%;" id="modi-table">
		<tr style="font-size:18px; height:40px;">
			<td>
			<table width="100%" cellpadding="0" cellspacing="0" border="0">
				<tr style="background:url('images/table_mid.gif') repeat-x; text-align:center;">
					<td width="5"><img src = "images/table_left.gif" width="5" height="30"></td>
					<td>수정</td>
					<td width="5"><img src = "images/table_right.gif" width="5" height="30"></td>
				</tr>
			</table>
			<table width="100%">
				<tr style="font-size:18px; height:40px;">
					<td>&nbsp;</td>
					<td align="center"><strong>제목</strong></td>
					<td><input type=text name=title size=50 maxlength=50 value="<%=title %>"></td>
					<td>&nbsp;</td>
				</tr>
				<tr height="1" bgcolor=#dddddd>
					<td colspan="4"></td>
				</tr>
				<tr style="font-size:18px; height:40px;">
					<td>&nbsp;</td>
					<td align="center"><strong>이름</strong></td>
					<td><%=name %><input type=hidden name=name size=50 maxlength=50 value="<%=name %>"></td>
					<td>&nbsp;</td>
				</tr>
				<tr height="1" bgcolor="#dddddd">
					<td colspan="4"></td>
				</tr>
				<tr style="font-size:18px; height:40px;">
					<td>&nbsp;</td>
					<td align="center"><strong>비밀번호</strong></td>
					<td><input type=password name="password" id="pass" size=50 maxlength=50></td>
					<td>&nbsp;</td>
				</tr>
				<tr height="1" bgcolor="#dddddd">
					<td colspan="4"></td>
				</tr>
				<tr style="font-size:18px; height:40px;">
					<td>&nbsp;</td>
					<td align="center"><strong>내용</strong></td>
					<td><textarea name=memo cols=50 rows=13><%=memo %></textarea></td>
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
					<td colspan="2" >
					<div id="sub-btn" style="display:flex; justify-content:center;">
						<div style="padding:10px;"><input type="button" value="수정" OnClick="javascript:modifyCheck();"data-ajax="false"></div>
						<div style="padding:10px;"><input type=button value="취소" OnClick="javascript:history.back(-1)"></div>
					</div>
					</td>
					<td>&nbsp;</td>
				</tr>
			</table>
			</td>
		</tr>		
		</table>
		</form>
	</div><!-- modi-content -->
	<div data-role="footer" id= "modi-footer" data-position="fixed">
		<div id="modi-copyright" >
			<h3>Copyright (c) 2018 yangjeong All rights reserved<h3>
			<div id="modi-SNS">
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
	</div><!-- modi-footer -->
	</div><!-- modi-page -->
</body>
</html>