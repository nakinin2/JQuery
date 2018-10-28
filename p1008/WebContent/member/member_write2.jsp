<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%request.setCharacterEncoding("utf-8"); %>
    
    <%
    	//변수 선언
    	Connection conn=null;
    	PreparedStatement pstmt=null;
    	String sql="";
    	ResultSet rs = null;
    	String rst="";
    	String msg="";
    	
    	//데이터베이스 연결 관련 정보를 문자열로 선언
    	String jdbc_driver="com.mysql.cj.jdbc.Driver";
    	String jdbc_url="jdbc:mysql://localhost/jquery?serverTimezone=UTC&characterEncoding=UTF-8";
    	
    	try{
    		//JDBC 드라이버 로드
    		Class.forName(jdbc_driver);
    		
    		//데이터베이스 연결 정보를 이용해 connection 인스턴스 확보
    		conn=DriverManager.getConnection(jdbc_url,"testuser","1234");
    		
    		//정보를 받을 것을 get으로 나타낸다
    		String id = request.getParameter("Id");
    		String name = request.getParameter("Name");
    		String passwd = request.getParameter("Passwd");
    		String nickname= request.getParameter("NickName");
    		String tel = request.getParameter("Tels");
    		String email = request.getParameter("email1");
    		
    		sql="insert into member values(?, ?, ?, ?, ?, ?)";
    		pstmt=conn.prepareStatement(sql);
    		pstmt.setString(1,id);
    		pstmt.setString(2,name);
    		pstmt.setString(3,passwd);
    		pstmt.setString(4,nickname);
    		pstmt.setString(5,tel);
    		pstmt.setString(6,email);
    		
    		pstmt.executeUpdate();
    		%>
			
			<html>
			<head>
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
			<title>결과 창</title>
			<script src="http://code.jquery.com/jquery-latest.js"></script>
			<link href="jquery/jquery.mobile-1.4.5.min.css" rel="stylesheet" type="text/css"/>
			<link href="css/member_form_style.css" rel="stylesheet" type="text/css"/>
			<link href="css/main_form_style.css" rel="stylesheet" type="text/css"/>

			<script src="jquery/jquery.min.js" type="text/javascript"></script>
			<script src="jquery/jquery.mobile-1.4.5.min.js" type="text/javascript"></script>
			<script src="function/member_write_functions.js"  type="text/javascript"></script>
			</head>
			<body>
				<div data-role="page" id="page">
				<div data-role="header" data-theme="b" data-position="fixed">
					<h1>회원가입 확인</h1>
				</div>
			    <div data-role="content">
			    	<h4 align="center">회원가입이 되었습니다.</h4>
			    	<h4 align="center">즐거운 쇼핑이 되시길 바랍니다.</h4>
			    	<a href="main.html" data-role="button" data-mini="true" data-icon="home">쇼핑 하기</a>
			    </div>
			    <div data-role="footer" data-position="fixed" data-theme="b">
					<div id="copyright">
						<h5 align="center">Copyright (c) 2018 yangjeong All rights reserved</h5>
					</div>
				</div>
			    </div>
		
    		<% 
    			
    		//로그인 후, 사용자 홈으로 이동
    		rst="success";
    	}catch(SQLException e){
    		msg=e.getMessage();
    		out.print("결과: "+rst+"<br>");
    		out.print("내용: "+rst+"<br>");
    		System.out.print(rst);
    	}
   %>

  		</body>
		</html>
