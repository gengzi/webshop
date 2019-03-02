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

<title>订单详情</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css" href="css/myorder.css">
<style type="text/css">
body {
	background-color: #111;
}

.userMenu a {
	margin-left: 0px;
}

.message-tab {
	height: 40px;
	background-color: #222;
}

.message-tab .tab {
	margin: 6px 0px 0 10px;
	padding: 2px 15px;
	float: left;
	line-height: 30px;
	font-size: 14px;
	color: #FFF;
	cursor: pointer;
}

.message-tab .tab a {
	color: #fff;
}

.message-tab .focus {
	background-color: #000;
	color: #01ff00
}

.message-tab .focus a {
	color: #01ff00
}

.message-tab .tab a:HOVER {
	color: #01ff00
}

.message-box div {
	text-align: left;
}

.message-box {
	border: 1px solid #222;
	border-top: 0;
	margin: 0;
	padding: 10px 0 0 0;
}

.message-box:HOVER {
	background-color: #111;
}

.message-box .avatar-box {
	width: 50px;
	height: 50px;
	margin: 0px 10px 0 0;
}

.message-box .avatar-box img {
	width: 30px;
	height: 30px;
	margin: 10px;
}

.message-box .message {
	margin: -55px 0 0 50px;
}

.message-box .message p {
	font-size: 14px;
	color: #efefef;
	padding: 10px 10px;
}

.message-box .message-time {
	
}

.send-message-box {
	border: 1px solid #222;
	border-top: 0;
	margin: 0;
	padding: 10px 0 0 0;
}

.send-message-box div {
	margin: 0;
}

.send-message-box .send-box {
	margin: 10px;
	border: 0px solid #222;
}

.send-message-box .send-box .message-textarea {
	width: 828px;
	padding: 10px;
	background-color: #111;
	outline: none;
	color: #FFF;
	font-size: 15px;
	font-family: '微软雅黑', '宋体', Verdana, Arial;
	border: 1px solid #222;
	margin: 0;
}

.send-message-box .user-select-box {
	
}

.send-message-box .user-select-box .select-box {
	width: 200px;
	height: 50px;
	border: 1px solid #222;
	float: left;
	margin: 10px 0 10px 10px;
}

.send-message-box .user-select-box .select-box .avatar {
	width: 30px;
	height: 30px;
	margin: 10px;
}

.send-message-box .user-select-box .select-box .name {
	height: 30px;
	margin: -40px 0 0 50px;
	color: #fff;
}

.send-message-box .user-select-box .select-box .userid {
	margin: -4px 0 0 186px;
	width: 15px;
	height: 15px;
	border: 1px solid #FFF;
	background-color: #222;
}
</style>
<style type="text/css">
.neirong {
	width: 400px;
	height: 20px;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}

.pinglun {
	border-collapse: collapse;
	border: 1px solid #222;
}

.pinglun {
	border-collapse: collapse;
}

.pinglun .cptp {
	padding-left: 80px;
	float: left;
}

.pinglun .shanchu {
	float: right;
	padding-top: 40px;
	padding-right: 10px;
}

.pl {
	padding-left: 2px;
	float: left;
}
.mingzi {
	margin-left: 10px;
	float: left;
	width: 196px;
	height: 60px;
	line-height: 60px;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}

.huifu {
	padding-left: 30px;
}

.pagebottom {
	float: right;
	padding-top: 10px;
}
</style>
<style type="text/css">
.biaoge .shoucang img {
	padding-left: 20px;
}

.biaoge .shoucang a {
	padding-left: 15px;
	width: 170px;
	height: 60px;
	line-height: 60px;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}

.tp {
	padding-left: 10px;
	float: left;
}

.mz {
	margin-left: 10px;
	width: 170px;
	height: 60px;
	line-height: 60px;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}
</style>

</head>

<body>
	<div class="AreaC">
		<div class="AreaL">
			<div class="box">
				<div class="box_1">
					<div class="head">
						<img src="images/logo.jpg" style="width: 180px; height: 180px">
					</div>


					<div class="userCenterBox" style="width:200px;padding:20px 0 0 0;">

						<div class="userMenu">
							<a href="/webshop/index.jsp"> 返回首页 </a> <a class="titles" href="">■&nbsp;交易管理</a>
							<div style="padding-left: 10px">
								<!-- class="curs" -->

								<a href="<c:url value='/OrderServlet?method=2' />"> 我的订单 </a> <a
									href=""> 收货地址 </a>
							</div>
							<a class="titles" href="">■&nbsp;优惠中心</a>
							<div style="padding-left: 10px">

								<a href="user.php?act=bonus"> 我的代金券 </a>
							</div>
							<a class="titles" href="">■&nbsp;账号中心</a>
							<div style="padding-left: 10px">
								<a href="user.php?act=profile"> 个人资料 </a> <a
									href="user.php?act=eit_password"> 修改密码 </a>

							</div>
							<a class="titles" href="">■&nbsp;消息中心</a>
							<div style="padding-left: 10px">
								<a href="user.php?act=message_list"> 我的留言 </a> <a
									href="user.php?act=comment_list"> 商品评论 </a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


		<div class="AreaR">
			<div class="box">
				<div class="box_1">
					<div class="userCenterBox boxCenterList clearfix"
						style="_height:1%; border:0px;">
						<h5>
							<span>订单详情</span>
						</h5>
						<div class="blank"></div>
						<table class="biaoge" width="100%" border="0" cellpadding="5"
							cellspacing="1" bgcolor="#dddddd">
							<tbody>
								<tr class="bg_head" align="center">
									<th width="10%">序号</th>
									<th width="30%">商品名</th>
									<th width="10%">价格</th>
									<th width="10%">数量</th>
									<th width="10%">小计</th>
								</tr>

								<%-- 	<c:forEach begin="1" end="40" step="1"> --%>
								<c:forEach items="${orderItemList}" var="oi" varStatus="status">
									<tr class="bg_head" align="center">
										<th width="10%">${status.count }</th>
										<th width="30%">${oi.product.name }</th>
										<th width="10%">${oi.product.price }</th>
										<th width="15%">${oi.buynum}</th>
										<th width="10%">${oi.subtotal}</th>
								</c:forEach>


							</tbody>
						</table>


					</div>
				</div>
			</div>
		</div>

	</div>




</body>
</html>
