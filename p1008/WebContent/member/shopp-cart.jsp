<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>장바구니 창</title>
<script>
</script>
	<link href='http://fonts.googleapis.com/css?family=Work+Sans:400,600,700' rel='stylesheet' type='text/css'>

	<link rel="stylesheet" href="css/reset.css"> <!-- CSS reset -->
	<link rel="stylesheet" href="css/style.css"> <!-- Resource style -->
	<script src="jquery/modernizr.js"></script> <!-- Modernizr -->
	<script src="jquery/jquery-2.1.4.js"></script>
	<script src="jquery/main.js"></script> <!-- Resource jQuery -->
<style>
.cart{
height:100%;
background:#ccc;
padding:0px 10px;
}
.total{
	margin:0;
	text-align:right;
	padding-right:20px;
}		
h1{
	text-align:center;
	color:#555;
}
h2{
	font-size:16px;
	left:10px;
	bottom:20px;
	color:#555;
}
</style>
</head>
<body>
<div class="cart">
	<h1>Shopping Cart</h1>
	<div style="background:#fff">
	<table id="cartcontent" fitColumns="true">
		<thead>
			<tr>
				<th field="name" width=140>Name</th>
				<th field="quantity" width=60 align="right">Quantity</th>
				<th field="price" width=60 align="right">Price</th>
			</tr>
		</thead>
	</table>
	</div>
	<p class="total">Total: $0</p>
	<input type="submit" value="홈"  id="s_insert"  data-mini="true" data-inline="true" data-theme="a" onclick="location.href='main.html' ">
</div>
</body>
</html>