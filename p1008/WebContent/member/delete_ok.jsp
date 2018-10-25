<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*"%>
 <% request.setCharacterEncoding("utf-8"); %>
 
 <%
 	Connection conn = null;
 	PreparedStatement pstmt = null;
 	ResultSet rs = null;
 	String sql = "";
 	String rst = "";
 	String msg = "";
 	String password = null;
 	int ref = 0;
 	int idx = Integer.parseInt(request.getParameter("idx"));
 	String passwd = request.getParameter("password");
 	
 	String jdbcDriver = "com.mysql.cj.jdbc.Driver";
 	String jdbcUrl = "jdbc:mysql://localhost/jquery?serverTimezone=UTC&characterEncoding=UTF-8";
 	
 	try {
 		Class.forName(jdbcDriver);
 		conn = DriverManager.getConnection(jdbcUrl,"testuser", "1234");
 		
 		Statement stmt = conn.createStatement();
 		
 		sql = "select password from list where num=" + idx;
 		rs = stmt.executeQuery(sql);
 		
 		if(rs.next()) {
 			password = rs.getString("password");
 			if(passwd.equals(password)) {
 				sql = "delete from list where num =" + idx;
 				stmt.executeUpdate(sql);
 				 %>
 				 	<script language = javascript>
 				 		self.window.alert("해당 글을 삭제하였습니다.");
 				 		location.href = "javascript:history.back()";
 				 		location.href = "list.jsp";
 				 	</script>	
 				 <%
 				 	rs.close();
 				 	stmt.close();
 				 	conn.close();
 			}else {
 			%>
 				 <script language = "javascript">
 				 	self.window.alert("비밀번호를 틀렸습니다.");
 				 	location.href = "javascript:history.back()";
 				 </script>
 			<%
 			}
 		}else {
 		 %>
 		 <script language ="javascript">
 		 	self.window.alert("없는 num입니다.");
 		 	location.href="javascript:history.back()";
 		 </script>
 		<%
 		}
 	}catch (SQLException e) {
 		out.println(e.toString());
 	}
 		 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>삭제 확인</title>
</head>
<body>

</body>
</html>