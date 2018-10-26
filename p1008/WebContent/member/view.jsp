<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%
	String checkName = "";
	checkName = (String)session.getAttribute("s_name");
	if(checkName == null) {
		%>
		<script>
			self.window.alert("먼저 로그인 하세요.");

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
<!DOCTYPE html>
<link href="jquery/jquery.mobile-1.4.5.min.css" rel="stylesheet" type="text/css"/>
<link href="css/view-style.css" rel="stylesheet" type="text/css"/>
<link href="css/list-style.css" rel="stylesheet" type="text/css"/>
<link href="css/modify-style.css" rel="stylesheet" type="text/css"/>
<link href="css/write-style.css" rel="stylesheet" type="text/css"/>
<link href="css/reply-style.css" rel="stylesheet" type="text/css"/>
<link href="css/delete-style.css" rel="stylesheet" type="text/css"/>
<link href="css/main-form_style.css" rel="stylesheet" type="text/css"/>

<script src="jquery/jquery.js" type="text/javascript"></script>
<script src="jquery/jquery.mobile-1.4.5.min.js" type="text/javascript"></script>
<script src="jquery/jquery.min.js"></script>
<script src="function/reply-function.js" type="text/javascript"></script>
<script src="function/write-function.js" type="text/javascript"></script>
<script src="function/delete-function.js" type="text/javascript"></script>
<script src="function/modify-function.js" type="text/javascript"></script>
<body>
<div data-role="page" id="view-page">
<div data-role="header" id="view-header" data-position="fixed">
		<a href="list.jsp"  id="btn-a" class="ui-btn-left" data-iconpos="notext" data-role="none"><img src="images/back-btn.png" id="back-Icon" alt="뒤로 가기"></a>
		<h1 align="center" style="font-size:25px;">고객 센터</h1>
</div><!-- view-page-header -->
	<div data-role="content" >
		<table border="0" height="100vh" align="center">
			<tr>
				<td>
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
						<tr id="img-td" style="background:url('images/table_mid.gif');  text-align:center;">
							<td><img src = "images/table_left.gif" width="100%" height="30"></td>
							<td>내용</td>
							<td><img src = "images/table_right.gif"  width="100%" height="30"></td>
						</tr>
					</table>
				</td>
			</tr>
			
			<tr>
				<td>
					<table width="100%">
						<tr>
							<td width="0%">&nbsp;</td>
							<td align="center">글번호</td>
							<td align="center"><%=idx%></td>
							<td width="0%">&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4" ></td>
						</tr>
						<tr>
							<td width="0%">&nbsp;</td>
							<td align="center">조회수</td>
							<td align="center"><%=hit%></td>
							<td width="0%">&nbsp;</td>
						</tr>
						<tr height="1" bgcolor=#dddddd>
							<td colspan="4" ></td>
						</tr>
						<tr>
							<td width="0%">&nbsp;</td>
							<td align="center" >이름</td>
							<td align="center"><%=name%></td>
							<td width="0%">&nbsp;</td>		
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4" ></td>
						</tr>
						<tr>
							<td width="0%">&nbsp;</td>
							<td align="center" >작성일</td>
							<td align="center"><%=time%></td>
							<td width="0%">&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4" width="600"></td>
						</tr>
						<tr>
							<td width="0%">&nbsp;</td>
							<td align="center" >제목</td>
							<td align="center"><%=title%></td>
							<td width="0%">&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4" ></td>
						</tr>
						<tr>
						<td width="0%"></td>
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
							<td width="0%">&nbsp;</td>
							<td colspan="2" width="100%">
							<div id="view-div">
								<div class="view-btns" ><a href="write.jsp" >글쓰기</a></div>
								<div class="view-btns" ><a href="reply.jsp?idx=<%=idx %>" >답글</a></div>
								<div class="view-btns" ><a href="list.jsp" >목록</a></div>
								<div class="view-btns" ><a href="modify.jsp?idx=<%=idx%>" >수정</a></div>
								<div class="view-btns" ><a href="delete.jsp?idx=<%=idx%>" >삭제</a></div>			
							</div>
							</td>
							<td width="0%">&nbsp;</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div><!-- view-page-content -->
	<div data-role="footer" id="view-footer" data-position="fixed">
		<div id="view-copyright" >
			Copyright (c) 2018 yangjeong All rights reserved
		<div id="view-SNS">
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
