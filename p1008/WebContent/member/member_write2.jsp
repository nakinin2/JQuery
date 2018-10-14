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
    		String id = request.getParameter("id");
    		String name = request.getParameter("name");
    		String passwd = request.getParameter("passwd");
    		String nickname= request.getParameter("nickname");
    		String tel = request.getParameter("tel");
    		String email = request.getParameter("email1")+"@"+request.getParameter("email2");
    		
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
			<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
			<html>
			<head>
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
			<title>결과 창</title>
			</head>
			<body>
				<div data-role="page" id="page">
				<div data-role="header">
					<h1>회원가입 확인</h1>
				</div>
			    <div data-role="content">
			    	<h4 align="center">회원가입이 되었습니다.</h4>
			    	<a href="member2.html" data-role="button" data-mini="true" data-icon="home">쇼핑 하기</a>
			    </div>
			    <div data-role="footer" data-position="fixed">
					<h4>footer 영역</h4>
				</div>
			    </div>
			</body>
			</html>
    		<% 
    			
    		//로그인 후, 사용자 홈으로 이동
    		rst="success";
    	}catch(SQLException e){
    		msg=e.getMessage();
    		out.print("결과: "+rst+"<br>");
    		out.print("내용: "+rst+"<br>");
    	}
   %>

  
