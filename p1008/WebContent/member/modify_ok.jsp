<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("utf-8");

	Connection conn = null;
	PreparedStatement pstmt = null;   //여러번 동일 쿼리문을 사용하고, 인수값이 유동적일때 사용된다.
	ResultSet rs = null;
	String sql = "";
	String rst = "";
	String msg = "";
	String passwd = ""; //내가 입력하는 것
	
	int idx = Integer.parseInt(request.getParameter("idx"));
	
	String title = request.getParameter("title");
	String memo = request.getParameter("memo");
	String passw = request.getParameter("password"); //DB에서 받아오는 것
	
	String jdbcDriver = "com.mysql.cj.jdbc.Driver";
	String jdbcUrl = "jdbc:mysql://localhost/jquery?serverTimezone=UTC&characterEncoding=UTF-8";
	
	try{
		Class.forName(jdbcDriver);
		conn = DriverManager.getConnection(jdbcUrl, "testuser", "1234");
		
		Statement stmt = conn.createStatement();   // createStatement()는 한번 쿼리문을 사용하거나, 인수값의 변동이 없을경우 사용된다

		
		sql = "SELECT PASSWORD FROM list WHERE NUM=" + idx;
		rs = stmt.executeQuery(sql);
		
		if(rs.next()) {
			passwd = rs.getString(1);  //passwd(내가 입력한 값)과 rs.getStrint(받아 온 데이터 베이스 값)과 같다
		}
		if(passwd.equals(passw)) {  //passwd=내가 입력한 값, passw=데이터 베이스의 값
			sql = "UPDATE list SET TITLE=  '  "  +  title  +  "  ' , MEMO=  '  " + memo + "  '  WHERE NUM=  " + idx ;
			//update board set title= '      ' , memo= '      ' where num= '     '
			stmt.executeUpdate(sql);
	%>
			<script language = javascript>
				self.window.alert("글이 수정되었습니다.");
				location.href="view.jsp?idx=<%=idx%>"; <%-- 글 수정 후 수정한 정보가 이동할 경로--%>
			</script>
<%
			rs.close();
			stmt.close();
			conn.close();
		}else{
%>
		<script language=javascript>
			self.window.alert("비밀번호를 틀렸습니다.");
			location.href="javascript:history.back()";
		</script>	
<%
	}
	}catch(SQLException e) {
		System.out.println(e.toString());
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
</head>
<body>

</body>
</html>