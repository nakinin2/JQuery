<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
<script src="jquery/jquery.js" type="text/javascript"></script>
<script src="jquery/jquery.mobile-1.4.5.min.js" type="text/javascript"></script>
<script src="jquery/jquery.min.js"></script>
<link href="jquery/jquery.mobile-1.4.5.min.css" rel="stylesheet" type="text/css"/>

</head>
<body>
<% //데이터 베이스 연결 관련 정보를 변수 선언
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs= null;
	String rst = "";
	String msg = "";
	int total = 0;
	
	//데이터 베이스 연결 관련 정보를 문자열로 선언
	String jdbc_driver = "com.mysql.cj.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://localhost/jquery?serverTimezone=UTC";
	
	try{
		//JDBC 드라이버 로드
		Class.forName(jdbc_driver);
		
		conn = DriverManager.getConnection(jdbc_url, "testuser", "1234");
		
		Statement stmt = conn.createStatement(); //Connection 클래스의 인스턴스로부터 SQL문 작성을 위한 Statement 준비
		String sqlCount = "SELECT COUNT(*) FROM list"; //횟수를 세서 몇 개인지 알아보기 위한 것
		rs = stmt.executeQuery(sqlCount);
		if(rs.next()){
			total = rs.getInt(1);
		}
		rs.close();
		out.print("총 게시물: " + total + "개");
		String sql = "SELECT NUM, NAME, TITLE, TIME, HIT, indent from list order by ref DESC"; //order by는 정렬하겠다는 말
		rs = stmt.executeQuery(sql);
		
		%>
		<div data-role="page" id="view-page" >
		<div id="view-header" data-role="header" data-theme="a" data-position="fixed" ></div>
		<div data-role="content" style="background:#e9e9e9;">
		<table width = "100%" cellpadding = "0" cellspacing = "0" border = "0">
			<tr height= "5">
				<td width= "5"></td>
			</tr>
			<tr style="background:url('images/table_mid.gif') repeat-x; text-align:center;">
				<td width= "5"><img src = "images/table_left.gif" width= "5" height= "30"></td>
				<td width="73">번호</td>
				<td width="379">제목</td>
				<td width="73">작성자</td>
				<td width="164">작성일</td>
				<td width="58">조회수</td>
				<td width="7"><img src = "images/table_right.gif" width= "5" height= "30"></td>
			</tr>
			<%
			if(total == 0){
			%>
			<tr align= "center" bgcolor = "#FFFFFF" height= "30">
				<td colspan= "6">등록된 글이 없습니다.</td>
			</tr>
			<%
			}else{
					
				while(rs.next()){
					int idx = rs.getInt(1);
					String name = rs.getString(2);
					String title = rs.getString(3);
					String time = rs.getString(4);
					int hit = rs.getInt(5); //게시판을 읽은 건수를 세는 것
					int indent = rs.getInt(6); //댓글 달 때 사용한다.
			%>
			<tr height= "25" align= "center">
				<td>&nbsp;</td>
				<td><%=idx %></td>
				<td align= "left">
			<%
			for(int j=0; j<indent; j++){ //답글 들여쓰기 설정을 위한 것
			%>			   &nbsp;&nbsp;&nbsp;<%
			}if(indent != 0){
			%>
			<img src = "images/reply_icon.gif">
			<%
			}
			%>
			<a href = "view.jsp?idx=<%=idx %>"><%=title %></a></td>
			<td align= "center"><%=name %></td>
			<td align= "center"><%=time %></td>
			<td align= "center"><%=hit %></td>
			<td>&nbsp;</td>
			</tr>
			<tr height= "1" bgcolor="#D2D2D2">
				<td colspan= "6"></td>
			</tr>
			<%
					}
				}
			rs.close();
			stmt.close();
			conn.close();
			
	}catch(SQLException e){
		out.println(e.toString());
	}
	%>
	<tr height= "1" bgcolor=  "#82B5DF">
		<td colspan= "6" width= "752"></td>
	</tr>
	</table>
	<table width= "100%" cellpadding= "0" cellspacing= "0" border= "0">
		<tr>
			<td colspan= "4" height= "5"></td>
		</tr>
		<tr align= "center">
			<td><input type="button" value= "글쓰기" OnClick = "window.location='write.jsp'"></td>
			<td><a href="#" onclick="javascript:history.back();">가자</a></td>
		</tr>
	</table>
	</div>
	<div id="footer" data-role="footer" data-position="fixed" data-theme="a">
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
	</div><!-- /footer -->
	</div>
</body>
</html>