<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>购物车</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link href="css/myCart.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="js/myCart.js"></script>


</head>


<body>
	<div id="header">
		<img src="images/logo.png" alt="logo" />
	</div>
	<div id="nav">
		您的位置：<a href="/webshop/index.jsp">首页</a> > <a href="/webshop/jsp/myorder.jsp">个人中心</a> >
		我的购物车
	</div>
	<div id="navlist">
		<ul>
			<li class="navlist_red_left"></li>
			<li class="navlist_red">1. 查看购物车</li>
			<li class="navlist_red_arrow"></li>
			<li class="navlist_gray">2. 确认订单信息</li>
			<li class="navlist_gray_arrow"></li>
			<li class="navlist_gray">3. 付款到支付宝</li>
			<li class="navlist_gray_arrow"></li>
			<li class="navlist_gray">4. 确认收货</li>
			<li class="navlist_gray_arrow"></li>
			<li class="navlist_gray">5. 评价</li>
			<li class="navlist_gray_right"></li>
		</ul>
	</div>

	<div id="content">
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			id="shopping">
			<form action="" method="post" name="myform">
				<tr>
					<td class="title_1"><input id="allCheckBox" type="checkbox"
						value="" onclick="selectAll()" />全选</td>
					<td class="title_2" colspan="2">店铺宝贝</td>
					<td class="title_3">获积分</td>
					<td class="title_4">单价（元）</td>
					<td class="title_5">数量</td>
					<td class="title_6">小计（元）</td>
					<td class="title_7">操作</td>
				</tr>
				<tr>
					<td colspan="8" class="line"></td>
				</tr>
				<tr>
					<td colspan="8" class="shopInfo">店铺：<a href="#">雷蛇专卖店</a> 卖家：<a
						href="#">gengzi</a>
				</tr>



				<c:forEach items="${cart}" var="entry" varStatus="status">


					<tr id="product1">
						<td class="cart_td_1"><input name="cartCheckBox"
							type="checkbox" value="product1" onclick="selectSingle()" /></td>
						<td class="cart_td_2"><img width="80px" height="80px"
							src="${entry.key.imgurl }" alt="shopping" /></td>

						<!--商品名  -->
						<td class="cart_td_3"><a href="#">${entry.key.name }</a>
						</td>
						<td class="cart_td_4">5</td>
						<td class="cart_td_5">${entry.key.price }</td>

						<td class="cart_td_6"><img src="images/cartimg/taobao_minus.jpg"
							alt="minus" onclick="changeNum('count${status.count}','minus')"
							class="hand" /> <input id="count${status.count}" type="text"
							value="${entry.value  }" class="num_input" /> <img
							src="images/cartimg/taobao_adding.jpg" alt="add"
							onclick="changeNum('count${status.count}','add')" class="hand" />
							<input type="button"
							onclick="location.href='/webshop/ProductServlet?method=3&id=${entry.key.id}&count='+document.getElementById('count${status.count }').value;"
							style="width:35px" value="确认" /></td>
						<td class="cart_td_7"></td>
						<td class="cart_td_8"><a
							href="<c:url value='/ProductServlet?method=3&id=${entry.key.id}&count=0' />">删除</a>
						</td>
					</tr>

				</c:forEach>

				<tr>
					<td colspan="3"><a href="javascript:deleteSelectRow()"><img
							src="images/cartimg/taobao_del.jpg" alt="delete" /> </a>
					</td>
					<td colspan="5" class="shopend">商品总价（不含运费）：<label id="total"
						class="yellow"></label> 元<br /> 可获积分 <label class="yellow"
						id="integral"></label> 点<br /> <a href="/webshop/jsp/order.jsp"> <img
							src="images/cartimg/taobao_subtn.jpg" /> </a></td>
				</tr>
			</form>
		</table>
	</div>


</body>
</html>
