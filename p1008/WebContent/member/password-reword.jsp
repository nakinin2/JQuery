<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>

<%request.setCharacterEncoding("utf-8"); %>

	<%//입력 정보 추출
	  String id = request.getParameter("id");
	  String passwd = request.getParameter("passwd");
	  String name = "";
	  //변수 선언
	  Connection conn = null;
	  PreparedStatement pstmt = null;
	  ResultSet rs = null;
	  String sql = "";
	  String rst = "success";
	  String msg = "";
	  int cnt = 0;
	  
	  //데이터베이스 연결 관련 정보를 문자열로 선언
	  String jdbc_driver = "com.mysql.cj.jdbc.Driver";
	  String jdbc_url = "jdbc:mysql://localhost/jquery?serverTimezone=UTC";
	  
	  try{
		  //JDBC 드라이버 로드
		  Class.forName(jdbc_driver);
		  
		  //connection 인스턴스 확보
		  conn = DriverManager.getConnection(jdbc_url, "testuser", "1234");
		  
		  //아이디 중복 검사
		  sql = "select id, name, nickname, tel, email from member where id = ?";
		  pstmt = conn.prepareStatement(sql);
		  pstmt.setString(1, id);
		  rs = pstmt.executeQuery();
		  
		  //등록된 아이디이면 이름 추출
		  if(rs.next()){//로그인 정보 설정
			  String userID = rs.getString("id"); //데이터베이스에 있는 id를 받는다
			  String userPWD = rs.getString("passwd"); //데이터베이스에 있는 passwd를 받는다
			  String userName = rs.getString("name"); //데이터베이스에 있는 name를 받는다
			  String userTel = rs.getString("tel");
			  String userEmail = rs.getString("email");
			  if(userID.equals(userID)) {
			  	while(rs.next()){%>
				<table>
				<tr>
					<td><%= rs.getString("id") %></td>
					<td><%= rs.getString("name") %></td>
					<td><%= rs.getString("nickname") %></td>
					<td><%= rs.getString("tel") %></td>
					<td><%= rs.getString("email") %></td>
				</tr>
				<%
				}
			  		session.setAttribute("s_name", userName);
			  		session.setAttribute("s_Id", userID);
			  		
			  		response.sendRedirect("main_logout.jsp");//main.jsp에 seesion의 정보를 보낸다.
			  	}else{
			  		%>
						<script>
			  			self.window.alert("패스워드가 맞지 않습니다.<br>패스워드를 다시 입력하세요.");
			  			</script>
			  			<%
			  			}
			}else { %>

				<script>
				alert("아이디와 비밀번호를 입력해 주세요.");
				</script>
				<% }
		  }catch(SQLException e) {
		  		rst = "시스템 에러";
		  		msg = e.getMessage();
		  		}finally{
		  			rst = "finally 시스템 에러";
		  			if(rs != null)
		  				rs.close();
		  			if(pstmt != null)
		  				pstmt.close();
		  			if(conn != null)
		  				conn.close();
		  			}
		  		%>