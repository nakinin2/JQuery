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
</head>
<body>
<div data-role="page" id="page" >
	<div id="header" data-role="header" data-theme="a" data-position="fixed">
		<div align="center"><a id="logo" href="main_logout.jsp" target="_self">Pooh쇼핑몰</a>
		</div>
		<span class="right" >
			<%String checkName= "";
		 	 String checkId = "";
		  	checkName = (String)session.getAttribute("s_name"); %>
		  	<%=checkName %>님 반갑습니다.
		</span>
		<a href = "logout.jsp" style="margin-right:30px;" class="ui-btn-right" data-role="none"><img src="images/logout.png" id="exit-Icon" alt="로그아웃"></a>
		<a href="#nav-panel2" data-iconpos="notext" class="ui-btn-right" data-role="none"><img src="images/menu-btn.png" id="right-top-menu-Icon" alt="오른쪽 메뉴 목록"></a>
		
	</div>
		
	<div data-role="content" style="background:#e9e9e9;">
		<div data-role="navbar" id="nav-bar"  data-grid="d">
			<ul>
				<li><a href="#nav-panel"><img src="images/menu-btn.png" id="menu-Icon" alt="전체 메뉴 보기"></a></li>
			 	<li><a href="product.html" target="display_area">상품</a></li>
			 	<li><a href="customer.jsp" target="display_area">메뉴2</a></li>
			 	<li><a href="#" target="display_area">메뉴3</a></li>
			 	<li><a href="#" target="display_area">메뉴4</a></li>
			 </ul>
		</div><!-- /navbar -->
		<hr>	<!-- 줄 긋기 -->
		<article class="left" id="article">
		     <iframe name="display_area" src="product.html"></iframe>
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
		<li><a href="list.jsp">고객센터</a></li>	
	</ul>
</div><!-- /right-menu-panel -->

<div data-role="panel" data-position-fixed="true" data-display="push" data-theme="a" id="nav-panel">
		<ul data-role="listview">
		<li data-icon="delete" data-theme="b"><a href="#" data-rel="close" >메뉴 닫기</a></li>&nbsp;
		<li><a href="#panel-fixed-page2">회사 소개</a></li>
		<li><a href="#panel-fixed-page2">아이템2</a></li>
		<li><a href="#panel-fixed-page2">아이템3</a></li>
		<li><a href="#panel-fixed-page2">아이템4</a></li>
	</ul>
</div><!-- /left-menu-panel -->

<div data-role="panel" data-position-fixed="true" data-display="push" data-theme="a" id="nav-panel2" data-position="right" data-swipe-close="false">
		<ul data-role="listview">
		<li data-icon="delete" data-theme="b"><a href="#" data-rel="close" >메뉴 닫기</a></li>&nbsp;
		<li><a href="#panel-fixed-page2">내정보</a></li>
		<li><a href="#panel-fixed-page2">장바구니</a></li>
		<li><a href="list.jsp">고객센터</a></li>	
	</ul>
</div><!-- /right-menu-panel -->
</div><!-- /main page -->
</body>
</html>