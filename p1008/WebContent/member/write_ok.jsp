<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="java.util.Date"%>
<%
	request.setCharacterEncoding("utf-8"); 
	//데이터 베이스 연결 관련 정보 변수
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";
	String rst = "";
	String msg = "";
	
	//데이터 베이스 연결 관련 정보를 문자열로 선언
	String jdbcDriver = "com.mysql.cj.jdbc.Driver";
	String jdbcUrl = "jdbc:mysql://localhost/jquery?serverTimezone=UTC&characterEncoding=UTF-8";
	int max = 0;
	try{
		Class.forName(jdbcDriver);
		conn = DriverManager.getConnection(jdbcUrl, "testuser", "1234");
		
		String title = request.getParameter("title");
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String standard = request.getParameter("standard");
		String memo = request.getParameter("memo");
		sql = "SELECT MAX(NUM) FROM list";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			max = rs.getInt(1);
		}else{
			max=0;
		}
		sql = "INSERT INTO list(name, password, title, memo, ref, time) VALUES(?, ?, ?, ?, ?, sysdate())";
		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, name);
		pstmt.setString(2, password);
		pstmt.setString(3, title);
		pstmt.setString(4, memo);
		pstmt.setInt(5, max + 1);
		pstmt.execute();
		pstmt.close();
		conn.close();
	}catch(SQLException e){
		out.println(e.toString());
	}
%>
<script language = javascript>
	self.window.alert("입력한 글을 저장하였습니다.");
	location.href = "list.jsp";
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>