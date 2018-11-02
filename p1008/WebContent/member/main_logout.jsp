<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰</title>
<link href="jquery/jquery.mobile-1.4.5.min.css" rel="stylesheet" type="text/css"/>
<link href="css/main_form_style.css" rel="stylesheet" type="text/css"/>
<link href="css/main-banner-style.css" rel="stylesheet" type="text/css">
<link href="css/banner_style.css" rel="stylesheet" type="text/css">
<link href="css/demo.css" rel="stylesheet" type="text/css" />
<link href="css/searchMeme.css" rel="stylesheet" type="text/css" />

<script src="jquery/jquery.min.js" type="text/javascript"></script>
<script src="jquery/jquery.mobile-1.4.5.min.js" type="text/javascript"></script>
<script src="function/main-banner-function.js" type="text/javascript"></script>
<script src="function/main_top_banner_function.js" type="text/javascript"></script>
<script src="function/jquery.searchMeme.js" type="text/javascript"></script>

<script type="text/javascript">//header 배너를 없앨 때 실행
$(document).on("ready",function(){
	$(".right").fadeOut(2000);
});
</script>

<script type="text/javascript">// search 버튼을 눌렀을 때 검색하는 input창 나오게 실행
	$(document).ready(function () {
    	var searchOrange = $('#search-orange').searchMeme({ onSearch: function (searchText) {
	        setTimeout(function () {
	        	searchOrange.searchMeme({ searchComplete: true });
	             $('#article').html("You searched for " + searchOrange.val() + "");
	             $('#iframe-form').animate({ 'height': 200 }, 500);
	        }, 3000);
        }, buttonPlacement: 'left', button: 'orange'
        });
    });
</script>
</head>
<body>
<div data-role="page" id="page" >
	<div id="header" data-role="header" data-theme="a" data-position="fixed">
		<div>
			<span id="banner_bg" style="display:flex; justify-content:center;">
				<img src="product_img/1.jpg"  class="banner-img" alt="배너 사진" height="60px" width="100%" >
				<input type="button" data-role="none" value="▲" class="up" title="메뉴" data-inline="true" style="background-color:white;">
			</span>
		</div>
		<div align="center"><a id="logo" href="main_logout.jsp" target="_self">Pooh쇼핑몰</a></div>
		<span class="right"  style="float:right; marign-bottom:1em; padding-top:8px; margin-top:-7px; color:white;">
			<%String checkName= "";
		 	 String checkId = "";
		  	checkName = (String)session.getAttribute("s_name"); %>
		  	<%=checkName %>님 반갑습니다.
		</span>
		<a href = "logout.jsp" class="ui-btn-right" id="exit-icon-a" data-role="none" data-ajax="false"><img src="images/unlock.png" id="exit-Icon" alt="로그아웃"></a>
		<a href="#nav-panel2" data-iconpos="notext" class="ui-btn-right" id="right-top-menu-div" data-role="none"><img src="images/menu.png" id="right-top-menu-Icon" alt="오른쪽 메뉴 목록"></a>
		<div class="search-wrapper" data-ajax="false">
        <div class="demo">
            <input type="text" id="search-orange" />
            <div class="clear">
            </div>
        </div>
    	</div>
	</div><!-- /header -->
		
	<div data-role="content" id="content">
		<div id="block-itunes">
			<div id="blockA"><!-- blockB에 나타난 그림을 크게 보여줄 곳 -->
				<a href="#largeimage"></a>
			</div>
			<div id="itune_images">
				<div id="blockB"> <!-- Block B for small Images-->
					<a href="#image1">
						<img src="banners/harrypotter_small.jpg" alt="" class="min"  />
					</a>
					<a href="#image2">
		                <img src="banners/prisonbreak_small.jpg" alt="" class="min"  />
					</a>
					<a href="#image3">
					    <img src="banners/transformers_small.jpg" alt="" class="min" />
					</a>
					<a href="#image4">
		                <img src="banners/xmenfirstclass_small.jpg" alt="" class="min"  />
					</a>
				</div>
				<button type="button" id="bi-button" style="background: url(images/itunes-button.png) 0% 0% no-repeat;"></button>
			</div>
		</div>
	
		<div data-role="navbar" id="nav-bar" >
			<ul>
				<li><a href="#nav-panel"><img src="images/menu-list.png" id="menu-Icon" alt="전체 메뉴 보기"></a></li>
			 	<li><a href="product.html" id="product-list" target="display_area" data-ajax="false">상품</a></li>
			 	<li><a href="list.jsp" id="custom-list" data-ajax="false">고객센터</a></li>
			 </ul>
		</div><!-- /navbar -->
		<hr>	<!-- 줄 긋기 -->
		
		<div class="simple_banner_wrap banner02" data-type="hslide" data-interval="3000" data-ajax="false">
			<ul>
				<li><a href="#"><img src="product_img/1.jpg" width="100%"></a></li>
				<li><a href="#"><img src="product_img/2.jpg" width="100%"></a></li>
				<li><a href="#"><img src="product_img/3.jpg" width="100%"></a></li>
				<li><a href="#"><img src="product_img/4.jpg" width="100%"></a></li>
				<li><a href="#"><img src="product_img/5.jpg" width="100%"></a></li>
			</ul>
		</div>
		
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
		<li><a href="#customer_form" data-ajax="false">내정보</a></li>
		<li><a href="list.jsp" data-ajax="false">고객센터</a></li>	
	</ul>
</div><!-- /right-menu-panel -->

<div data-role="panel" data-position-fixed="true" data-display="push" data-theme="a" id="nav-panel">
		<ul data-role="listview">
		<li data-icon="delete" data-theme="b"><a href="#" data-rel="close" >메뉴 닫기</a></li>
		<li><a href="intro.html" target="display_area" data-ajax="false">회사 소개</a></li>
		<li><a href="product.html" target="display_area" data-ajax="false">상품</a></li>
	</ul>
</div><!-- /left-menu-panel -->

<div data-role="panel" data-position="right" data-position-fixed="true" data-display="push" data-theme="a" id="customer_form" data-swipe-close="false">
	<form method="post" class="userform" id="user-form" name="loginform" action="customer.jsp" data-ajax="false">
	   <h2 align="center">내 정보</h2>
	   <label for="password">Password:</label>
	   <input type="password" name="custom_passwd" id="login-password" value="" data-clear-btn="true" autocomplete="off" data-mini="true" required="required">
	   <span id="login-text"></span>
       <div class="ui-grid-a">
	   <div class="ui-block-a"><a href="#" data-rel="close" class="ui-btn ui-shadow ui-corner-all ui-btn-b ui-mini">Cancel</a></div>
	   <div class="ui-block-b"><button class="ui-btn ui-shadow ui-corner-all ui-btn-a ui-mini" id="coustom-Btns" >Save</button></div>	
	  </div>
	</form>
</div><!-- /customer-list panel -->

</div><!-- /main page -->
</body>
</html>