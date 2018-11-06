<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*"%> 

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
		String sql = "SELECT NUM, NAME, TITLE, TIME, HIT, indent from list order by ref DESC"; //order by는 정렬하겠다는 말
		rs = stmt.executeQuery(sql);
		
		%>
	<!DOCTYPE html>
	<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>게시판</title>
	<link href="jquery/jquery.mobile-1.4.5.min.css" rel="stylesheet" type="text/css"/>
	<link href="css/list_style.css" rel="stylesheet" type="text/css"/>
	
	<script src="jquery/jquery.min.js" type="text/javascript"></script>
	<script src="jquery/jquery.mobile-1.4.5.min.js" type="text/javascript"></script>
	
	</head>
	<body>
		<div data-role="page" id="list-page" >
		<div data-role="header" id="list-header"  data-position="fixed" >
			<a href="#" OnClick="javascript:history.back(-1);"data-role="none" data-iconpos="notext" class="ui-btn-left" data-ajax="false"><img src="images/home-button.png" id="main-home-Icon" alt="메인으로"></a>
			<h1 align="center" id="list-header-text">고객 센터</h1>
		</div><!-- list-header-page -->
		<div data-role="content" >
		<td width= "5" ><strong style="font-size:18px;">총 게시물 : <%=total %>개</strong></td>
			<table width = "100%" cellpadding = "0" cellspacing = "0" border = "0" >
				<tr height= "5">
					<td width= "5"></td>
				</tr>
				<tr style="background:url('images/table_mid.gif') repeat-x; text-align:center;">
					<td width= "5"><img src = "images/table_left.gif" height= "30"></td>
					<td width="73"><strong>번호</strong></td>
					<td width="360"><strong>제목</strong></td>
					<td width="73"><strong>작성자</strong></td>
					<td width="164"><strong>작성일</strong></td>
					<td width="58"><strong>조회수</strong></td>
					<td width="7"><img src = "images/table_right.gif" height= "30"></td>
				</tr>
				<%
				if(total == 0){
				%>
				<tr align= "center" height= "30">
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
				<tr height= "40" align= "center" style="font-size:17px;">
					<td>&nbsp;</td>
					<td><strong><%=idx %></strong></td>
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
				<a href = "view.jsp?idx=<%=idx %>"  data-ajax="false" style="color:black;"><strong><%=title %></strong></a></td>
				<td align= "center" style="padding:20px;"><strong><%=name %></strong></td>
				<td align= "center"><strong><%=time %></strong></td>
				<td align= "center"><strong><%=hit %></strong></td>
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
			<tr align= "right" style="font-size:20px;">
				<td><a href ="write.jsp" data-role="button" style="color:black; margin-right:10px; font-size:18px; font-weight:bold;" data-inline="true" data-ajax="false">글쓰기</a></td>
			</tr>
		</table><!-- end table -->
	</div><!-- list-content-page -->
	<div data-role="footer" id="list-footer" data-position="fixed">
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
	</div><!-- list-footer-page -->
	</div>
</body>
</html>