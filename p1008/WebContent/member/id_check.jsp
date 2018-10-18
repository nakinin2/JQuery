<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
   
<%request.setCharacterEncoding("utf-8"); %>

<%
	//변수 선언
	Connection conn=null;
	PreparedStatement pstmt=null;
	String sql="";
	ResultSet rs=null;
	String rst="";
	String msg="";
	
	//데이터베이스 연결 관련 정보를 문자열로 선언
	String jdbc_driver="com.mysql.cj.jdbc.Driver";
	String jdbc_url="jdbc:mysql://localhost/jquery?serverTimezone=UTC&characterEncoding=UTF-8";
	
	try{
		//JDBC 드라이버 로드
		Class.forName(jdbc_driver);
		
		//connection 인스턴스 확보
		conn=DriverManager.getConnection(jdbc_url,"testuser","1234");
		
		//connection클래스의 인스턴스로부터 SQL문 작성을 위한 statement 준비
		String id=request.getParameter("id");
		
		// ID 중복 검사
		sql="select*from member where id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,id);
		rs=pstmt.executeQuery();
		
		//ID가 중복일 경우
		if(rs.next()){
			%>
				<span>이미 등록된 아이디입니다.</span>
			<%
		}else{
			%>
				<span>사용 가능한 아이디입니다.</span>
			<%
		}
	}catch(SQLException e){
		e.getMessage();
	}
%>
<script>
function add(){
history.back();
}
</script>