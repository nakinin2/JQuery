<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰</title>
<link href="jquery/jquery.mobile-1.4.5.min.css" rel="stylesheet" type="text/css"/>
<script src="jquery/jquery.js" type="text/javascript"></script>
<script src="jquery/jquery.mobile-1.4.5.min.js" type="text/javascript"></script>
<script src="jquery/jquery.min.js"></script>

<!-- 함수와 CSS 파일 경로 -->
<link href="css/main-form_style.css" rel="stylesheet" type="text/css"/>
<link href="css/member-form_style.css" rel="stylesheet" type="text/css"/>
<script src="function/member_write_functions.js"  type="text/javascript"></script>
<link rel="stylesheet" href="css/demo.css?v=2">
<script type="text/javascript" src="jquery/modernizr.js"></script>
<script type="text/javascript" src="jquery/demo.js"></script>

<script type="text/javascript">
$(function(){
	$("#open").click(function() {
		$("#page3").slideUp("slow");
	});
});

</script>
</head>
<body>
<div data-role="page" id="page" >
	<div id="header" data-role="header" data-theme="a" data-position="fixed">
		<a href="#nav-panel" data-icon="bars" data-iconpos="notext" class="ui-btn-left">Menu</a>
		<div align="center"><a id="logo" href="main_logout.jsp">Pooh쇼핑몰</a>
		</div>
		<span class="right" >
			<%String checkName= "";
		 	 String checkId = "";
		  	checkName = (String)session.getAttribute("s_name"); %>
		  	<%=checkName %>님 환영합니다.
		</span>
		<a href = "logout.jsp" data-icon="user" data-iconpos="notext" class="ui-btn-right">로그 아웃</a>
	</div>
		
	<div data-role="content">
		<div data-role="navbar" id="nav-bar"  data-grid="d">
			<ul>
			 	<li><a href="intro.html" target="display_area">회사소개</a></li>
			 	<li><a href="part_list.jsp" target="display_area">메뉴1</a></li>
			 	<li><a href="customer.jsp" target="display_area">메뉴2</a></li>
			 	<li><a href="#" target="display_area">메뉴3</a></li>
			 	<li><a href="#" target="display_area">메뉴4</a></li>
			 </ul>
		</div><!-- /navbar -->
		<hr>	<!-- 줄 긋기 -->
		<article class="left" id="article">
		     <iframe name="display_area" src="images/logo.jpg" width="622px" height="466px"></iframe>
		</article><!-- /article -->	
		<hr><!-- 줄 긋기 -->
	</div><!-- /content -->
	
	<div id="footer" data-role="footer" data-position="fixed" data-theme="a">
		<div id="copyright" >
			Copyright (c) 2018 yangjeong All rights reserved
		<div id="SNS">
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
	</div><!-- /footer -->

<div data-role="panel" data-position-fixed="true" data-display="overlay" data-theme="a" id="nav-panel2" data-position="right">
		<ul data-role="listview">
		<li data-icon="delete" data-theme="b"><a href="#" data-rel="close" >메뉴 닫기</a></li>&nbsp;
		<li><a href="member-form.html" id="regist-btns">회원가입</a></li>
		<li><a href="#panel-fixed-page2">내정보</a></li>
		<li><a href="#panel-fixed-page2">장바구니</a></li>
		<li><a href="#panel-fixed-page2">고객센터</a></li>	
	</ul>
</div><!-- /right-menu-panel -->

<div data-role="panel" data-position-fixed="true" data-display="push" data-theme="a" id="nav-panel">
		<ul data-role="listview">
		<li data-icon="delete" data-theme="b"><a href="#" data-rel="close" >메뉴 닫기</a></li>&nbsp;
		<li><a href="#panel-fixed-page2">아이템1</a></li>
		<li><a href="#panel-fixed-page2">아이템2</a></li>
		<li><a href="#panel-fixed-page2">아이템3</a></li>
		<li><a href="#panel-fixed-page2">아이템4</a></li>
		<li><a href="#panel-fixed-page2">아이템5</a></li>
		<li><a href="#panel-fixed-page2">아이템6</a></li>
		<li><a href="#panel-fixed-page2">아이템7</a></li>
		<li><a href="#panel-fixed-page2">아이템8</a></li>
		<li><a href="#panel-fixed-page2">아이템9</a></li>
		<li><a href="#panel-fixed-page2">아이템10</a></li>
		<li><a href="#panel-fixed-page2">아이템11</a></li>
		<li><a href="#panel-fixed-page2">아이템12</a></li>
		<li><a href="#panel-fixed-page2">아이템13</a></li>
		<li><a href="#panel-fixed-page2">아이템14</a></li>
		<li><a href="#panel-fixed-page2">아이템15</a></li>
	</ul>
</div><!-- /panel -->

<div data-role="panel" data-position="right" data-position-fixed="true" data-display="overlay" data-theme="a" id="add-form">
	<form class="userform" id="login-form">
	   <h2>Login</h2>
	   <label for="name">Username:</label>
	   <input type="text" name="name" id="name" value="" data-clear-btn="true" data-mini="true">
	   <label for="password">Password:</label>
	   <input type="password" name="password" id="password" value="" data-clear-btn="true" autocomplete="off" data-mini="true">
	   <div class="ui-grid-a">
		<div class="ui-block-a"><a href="#" data-rel="close" class="ui-btn ui-shadow ui-corner-all ui-btn-b ui-mini">Cancel</a></div>
		<div class="ui-block-b"><a href="#" data-rel="close" class="ui-btn ui-shadow ui-corner-all ui-btn-a ui-mini">Save</a></div>
	   </div>
	</form>
</div><!-- /login panel -->

</div><!-- /main page -->



<div data-role="page" id="page3" >
	    <div data-role="header">
			<h1>header 영역</h1>
		</div>
		<div data-role="cotent">
			<form>
		        <h3 align="center">로그인</h3>
		        <label for="name">아이디:</label>
		        <input name="name" id="name" type="text" value="" data-mini="ture" data-clear-btn="true">
		        <label for="password">비밀번호:</label>
		        <input type="password" id="password" name="password" value="" data-mini="ture" data-clear-btn="true">
		        <div class="ui-grid-a">
		            <div class="ui-block-a"><a href="main.html" data-role="button" data-rel="close">취소</a></div>
		        	<div class="ui-block-b"><a href="#" data-role="button" data-rel="close">저장</a></div>
		    	</div>    
			</form>
	    </div>
	 	<div data-role="footer" data-position="fixed">
			<h4>footer 영역</h4>
		</div>
</div>
</body>
</html>