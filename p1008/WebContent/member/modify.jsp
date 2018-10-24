<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%
	request.setCharacterEncoding("utf-8");
	Connection conn = null;
	PreparedStatement pstmt = null;
	String sql = "";
	ResultSet rs = null;
	String rst = ""; //정보 조회를 위한 문자 변수
	String msg = "";
	String name = null;
	String password = null;
	String title = null;
	String memo = null;
	int idx = Integer.parseInt(request.getParameter("idx"));
	
	String jdbcDriver = "com.mysql.cj.jdbc.Driver";
	String jdbcUrl = "jdbc:mysql://localhost/yangjung?serverTimezone=UTC&characterEncoding=UTF-8";
	
	try{
		Class.forName(jdbcDriver);
		conn = DriverManager.getConnection(jdbcUrl, "testuser", "1234");
		Statement stmt = conn.createStatement();
		
		sql = "SELECT NAME, PASSWORD, TITLE, MEMO FROM board WHERE NUM=" + idx;
		rs = stmt.executeQuery(sql);
		
		if(rs.next()){
			name = rs.getString(1);
			password = rs.getString(2);
			title = rs.getString(3);
			memo = rs.getString(4);
		}
		rs.close();
		stmt.close();
		conn.close();
	}catch(SQLException e){
		out.println(e.toString());
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
<script type="text/javascript">
function modifyCheck(){
	var form = document.modifyform;   // if 안에 document.modifyform을 써야 되는데 form이라는 변수를 줘서 간략하게 쓰기 위해서 설정했다.
	
	if( !form.password.value) {
		alert("비밀번호를 적어주세요.");
		form.password.focus();
		return;
	}
	if( !form.title.value) {
		alert("제목을 적어주세요.");
		form.title.focus();
		return;
	}
	if( !form.memo.value) {
		alert("내용을 적어주세요.");
		form.memo.focus();
		return;
	}
	form.submit();
}
</script>
</head>
<body>
<table>
<form name = modifyform method=post action="modify_ok.jsp?idx=<%=idx %>">
<tr>
	<td>
		<table width="100%" cellpadding="0" cellspacing="0" border="0">
			<tr style="background:url('images/table_mid.gif') repeat-x; text-align:center;">
				<td width="5"><img src = "images/table_left.gif" width="5" height="30"></td>
				<td>수정</td>
				<td width="5"><img src = "images/table_right.gif" width="5" height="30"></td>
			</tr>
			</table>
			<table>
				<tr>
					<td>&nbsp;</td>
					<td align="center">제목</td>
					<td><input type=text name=title size=50 maxlength=50 value="<%=title %>"></td>
					<td>&nbsp;</td>
				</tr>
				<tr height="1" bgcolor=#dddddd>
					<td colspan="4"></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td align="center">이름</td>
					<td><%=name %><input type=hidden nam=name size=50 maxlength=50 value="<%=name %>"></td>
					<td>&nbsp;</td>
				</tr>
				<tr height="1" bgcolor="#dddddd">
					<td colspan="4"></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td align="center">비밀번호</td>
					<td><input type=password name="password" id="pass" size=50 maxlength=50></td>
					<td>&nbsp;</td>
				</tr>
				<tr height="1" bgcolor="#dddddd">
					<td colspan="4"></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td align="center">내용</td>
					<td><textarea name=memo cols=50 rows=13><%=memo %></textarea></td>
					<td>&nbsp;</td>
				</tr>
				<tr height="1" bgcolor="#dddddd">
					<td colspan="4"></td>
				</tr>
				<tr height="1" bgcolor="#82B5DF">
					<td colspan="4"></td>
				</tr>
				<tr align="center">
					<td>&nbsp;</td>
					<td colspan="2">
					<input type="button" value="수정" OnClick="javascript:modifyCheck();">
					<input type=button value="취소" OnClick="javascript:history.back(-1)">
					</td>
					<td>&nbsp;</td>
					</tr>
					</table>
					</td>
				</tr>
			</form>
		</table>
</body>
</html>