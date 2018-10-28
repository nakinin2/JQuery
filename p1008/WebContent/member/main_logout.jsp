<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰</title>
<link href="jquery/jquery.mobile-1.4.5.min.css" rel="stylesheet" type="text/css"/>
<link href="css/main_form_style.css" rel="stylesheet" type="text/css"/>
<link href="css/main_form_style2.css" rel="stylesheet" type="text/css"/>
<link href="css/member_form_style.css" rel="stylesheet" type="text/css"/>
<link href="css/intro_style.css" rel="stylesheet" type="text/css"/>
<link href="css/list_style.css" rel="stylesheet" type="text/css"/>
<link href="css/write_style.css" rel="stylesheet" type="text/css"/>
<link href="css/view_style.css" rel="stylesheet" type="text/css"/>
<link href="css/reply_style.css" rel="stylesheet" type="text/css"/>
<link href="css/modify_style.css" rel="stylesheet" type="text/css"/>
<link href="css/delete_style.css" rel="stylesheet" type="text/css"/>
<link href="css/customer_style.css" rel="stylesheet" type="text/css"/>
<link href="css/product_style.css" rel="stylesheet" type="text/css"/>


<script src="jquery/jquery.min.js" type="text/javascript"></script>
<script src="jquery/jquery.mobile-1.4.5.min.js" type="text/javascript"></script>
<script src="function/member_write_functions.js"  type="text/javascript"></script>
<script src="function/write-function.js" type="text/javascript"></script>
<script src="function/modify-function.js" type="text/javascript"></script>
<script src="function/reply-function.js" type="text/javascript"></script>
<script src="function/delete-function.js" type="text/javascript"></script>
<script src="function/product_function.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).on("ready",function(){
	$(".right").fadeOut(2000);
});
</script>
</head>
<body>
<div data-role="page" id="page" >
	<div id="header" data-role="header" data-theme="a" data-position="fixed">
		<div align="center"><a id="logo" href="main_logout.jsp" target="_self">Pooh쇼핑몰</a></div>
		<span class="right"  style="float:right; marign-bottom:1em; padding:3px; margin-top:30px;">
			<%String checkName= "";
		 	 String checkId = "";
		  	checkName = (String)session.getAttribute("s_name"); %>
		  	<%=checkName %>님 반갑습니다.
		</span>
		<a href = "logout.jsp" style="margin-right:30px;" class="ui-btn-right" data-role="none"><img src="images/logout.png" id="exit-Icon" alt="로그아웃"></a>
		<a href="#nav-panel2" data-iconpos="notext" class="ui-btn-right" data-role="none"><img src="images/menu-btn.png" id="right-top-menu-Icon" alt="오른쪽 메뉴 목록"></a>
		
	</div>
		
	<div data-role="content" style="background:#e9e9e9;">
		<div data-role="navbar" id="nav-bar" >
			<ul>
				<li><a href="#nav-panel"><img src="images/menu-btn.png" id="menu-Icon" alt="전체 메뉴 보기"></a></li>
			 	<li><a href="product.html" target="display_area">상품</a></li>
			 	<li><a href="list.jsp" >고객센터</a></li>
			 </ul>
		</div><!-- /navbar -->
		<hr>	<!-- 줄 긋기 -->
		<article class="left" id="article">
		     <div align="center"><iframe name="display_area" src="product.html" id="iframe-form">></iframe></div>
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
		<li data-icon="delete" data-theme="b"><a href="#" data-rel="close" >메뉴 닫기</a></li>
		<li><a href="#customer_form">내정보</a></li>
		<li><a href="list.jsp">고객센터</a></li>	
	</ul>
</div><!-- /right-menu-panel -->

<div data-role="panel" data-position-fixed="true" data-display="push" data-theme="a" id="nav-panel">
		<ul data-role="listview">
		<li data-icon="delete" data-theme="b"><a href="#" data-rel="close" >메뉴 닫기</a></li>
		<li><a href="intro.html" target="display_area">회사 소개</a></li>
		<li><a href="product.html" target="display_area">상품</a></li>
	</ul>
</div><!-- /left-menu-panel -->

<div data-role="panel" data-position="right" data-position-fixed="true" data-display="push" data-theme="a" id="customer_form" data-swipe-close="false">
	<form method="post" class="userform" id="user-form" name="loginform" action="customer.jsp" >
	   <h2 align="center">내 정보</h2>
	   <label for="password">Password:</label>
	   <input type="password" name="custom_passwd" id="login-password" value="" data-clear-btn="true" autocomplete="off" data-mini="true" required="required">
	   <span id="login-text"></span>
       <div class="ui-grid-a">
	   <div class="ui-block-a"><a href="#" data-rel="close" class="ui-btn ui-shadow ui-corner-all ui-btn-b ui-mini">Cancel</a></div>
	   <div class="ui-block-b"><button class="ui-btn ui-shadow ui-corner-all ui-btn-a ui-mini" id="login-Btns" >Save</button></div>	
	  </div>
	</form>
</div><!-- /customer-list panel -->

</div><!-- /main page -->
</body>
</html>