<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<%
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";
	String id = "";
	String pass = "";
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String title = request.getParameter("title");
	String memo = request.getParameter("memo");
	int idx = Integer.parseInt(request.getParameter("idx"));
	
	String jdbcDriver = "com.mysql.cj.jdbc.Driver";
	String jdbcUrl = "jdbc:mysql://localhost/jquery?serverTimezone=UTC&characterEncoding=UTF-8";
	
	try{
		int ref = 0;
		int indent = 0;
		int step = 0;
		Class.forName(jdbcDriver);
		conn = DriverManager.getConnection(jdbcUrl, "testuser", "1234");
		Statement stmt = conn.createStatement();
		sql = "select num, ref, indent, step from list where num=" + idx;
		rs = stmt.executeQuery(sql);
		
		if(rs.next()){
			ref = rs.getInt(1);
			indent = rs.getInt(3);
			if(indent > 0){
				ref = rs.getInt(2);
			}else{
				ref = rs.getInt(1);
				step = rs.getInt(4);
			}
		}
		sql = "update list set step = step+1 where ref =" + ref + " and step>" + step; 
		stmt.executeUpdate(sql);
		
		sql = "insert into list(name, password, title, memo, ref, indent, step, time)" + "values(?,?,?,?,?,?,?,sysdate())";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, password);
		pstmt.setString(3, title);
		pstmt.setString(4, memo);
		pstmt.setInt(5, ref);
		pstmt.setInt(6, indent+1);
		pstmt.setInt(7, step+1);
		
		pstmt.execute();
		rs.close();
		stmt.close();
		pstmt.close();
		conn.close();
	}catch(Exception e){
		
	}
%>
<script language = "javascript">
	self.window.alert("입력한 글을 저장하였습니다.");
	location.href = "list.jsp";
</script>