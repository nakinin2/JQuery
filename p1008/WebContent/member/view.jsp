<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%
	String checkName = "";
	checkName = (String)session.getAttribute("s_name");
	if(checkName == null) {
		%>
		<script>
			self.window.alert("먼저 로그인 하세요.");
			location.href = "javascript:history.back()";
		</script>
		<%
    }
    Connection conn = null;
    PreparedStatement pstmt = null;
    String sql = "";
    ResultSet rs = null;
    String rst = "";
    String msg = "";
  	int idx = Integer.parseInt(request.getParameter("idx") );

	String jdbcDriver = "com.mysql.cj.jdbc.Driver";
	String jdbcUrl = "jdbc:mysql://localhost/jquery?serverTimezone=UTC&characterEncoding=UTF-8";
    
    try{
    	Class.forName(jdbcDriver);
    	conn = DriverManager.getConnection(jdbcUrl, "testuser", "1234");
    	
    	Statement stmt = conn.createStatement();
    	
    	sql = "SELECT name, TITLE, MEMO, TIME, HIT FROM list WHERE NUM =" + idx;
    	rs = stmt.executeQuery(sql);
    	
    	if(rs.next()){
    		String name = rs.getString(1);
    		String title = rs.getString(2);
    		String memo = rs.getString(3);
    		String time = rs.getString(4);
    		int hit = rs.getInt(5);
    		hit++;
    	    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
<link href="jquery/jquery.mobile-1.4.5.min.css?ver=1" rel="stylesheet" type="text/css"/>
<script src="jquery/jquery.js?ver=1" type="text/javascript"></script>
<script src="jquery/jquery.mobile-1.4.5.min.js?ver=1" type="text/javascript"></script>
<script src="jquery/jquery.min.js?ver=1"></script>
<style>
body{
	line-height:1.2em;
	font-size:0.75em;
	background-color:#e9e9e9;
}

.view-btns{
	display:block;
	float:left;
}
</style>
</head>
<body>
<div data-role="page" id="view-page" data-ajax="false">
<div data-role="header" id="view-header" data-position="fixed">
		<h1 align="center">고객 센터</h1>
</div><!-- view-page-header -->
	<div data-role="content" data-ajax="false">
		<table>
			<tr>
				<td>
					<table  cellpadding="0" cellspacing="0" border="0">
						<tr style="background:url('images/table_mid.gif') repeat-x; text-align:center;">
							<td><img src = "images/table_left.gif" width="5" height="30"></td>
							<td>내용</td>
							<td><img src = "images/table_right.gif" width="5" height="30"></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
			<td>
			<table>
				<tr>
					<td width="0">&nbsp;</td>
					<td align="center">글번호</td>
					<td align="center"><%=idx%></td>
					<td width="0">&nbsp;</td>
				</tr>
				<tr height="1" bgcolor="#dddddd">
					<td colspan="4" ></td>
				</tr>
				<tr>
					<td width="0">&nbsp;</td>
					<td align="center">조회수</td>
					<td align="center"><%=hit%></td>
					<td width="0">&nbsp;</td>
				</tr>
				<tr height="1" bgcolor=#dddddd>
					<td colspan="4" ></td>
				</tr>
				<tr>
					<td width="0">&nbsp;</td>
					<td align="center" >이름</td>
					<td align="center"><%=name%></td>
					<td width="0">&nbsp;</td>		
				</tr>
				<tr height="1" bgcolor="#dddddd">
					<td colspan="4" ></td>
				</tr>
				<tr>
					<td width="0">&nbsp;</td>
					<td align="center" >작성일</td>
					<td align="center"><%=time%></td>
					<td width="0">&nbsp;</td>
				</tr>
				<tr height="1" bgcolor="#dddddd">
					<td colspan="4" width="600"></td>
				</tr>
				<tr>
					<td width="0">&nbsp;</td>
					<td align="center" >제목</td>
					<td align="center"><%=title%></td>
					<td width="0">&nbsp;</td>
				</tr>
				<tr height="1" bgcolor="#dddddd">
					<td colspan="4" ></td>
				</tr>
				<tr>
				<td width="0"></td>
				<td colspan="2" height="200"><%=memo %></td>
				</tr>
				<%
		   		sql = "UPDATE list SET HIT=" + hit + " where NUM=" + idx;
				stmt.executeUpdate(sql);
				rs.close();
				stmt.close();
				conn.close();
					}
				}catch(SQLException e){	
					e.printStackTrace();
				}
				%>
				<tr height="1" bgcolor="#dddddd">
					<td colspan="4" ></td>
				</tr>
				<tr height="1" bgcolor="#82B5DF">
					<td colspan="4" ></td>
				</tr>
				<tr>
					<td width="0">&nbsp;</td>
					<td colspan="2" align="center">
						<div class="view-btns" style="width:90px; " data-inline="true"><input type=button value="글쓰기" OnClick="window.location='write.jsp'"data-inline="true"></div>
						<div class="view-btns" style="width:90px; " data-inline="true"><input type=button value="답글" OnClick="window.location='reply.jsp?idx=<%=idx%>'"data-inline="true"></div>
						<div class="view-btns" style="width:90px; " data-inline="true"><input type=button value="목록" OnClick="window.location='list.jsp'"data-inline="true"></div>
						<div class="view-btns" style="width:90px; " data-inline="true"><input type=button value="수정" OnClick="window.location='modify.jsp?idx=<%=idx%>'"data-inline="true"></div>
						<div class="view-btns" style="width:90px; " data-inline="true"><input type=button value="삭제" OnClick="window.location='delete.jsp?idx=<%=idx%>'"data-inline="true"></div>
						<div class="view-btns" style="width:90px; " data-inline="true"><a href="main.html" target="_self">뒤로</a></div>
					</td>
					<td width="0">&nbsp;</td>
				</tr>
			</table>
			</td>
			</tr>
		</table>
	</div><!-- view-page-content -->
	<div data-role="footer" data-position="fixed">
		<div id="copyright" >
			Copyright (c) 2018 yangjeong All rights reserved
		<div id="SNS">
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
	</div><!-- view-page-footer -->
</div><!-- view-page -->
</body>
</html>