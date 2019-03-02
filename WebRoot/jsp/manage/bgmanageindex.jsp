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

<title>管理主页面</title>

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
#top1 {
	width: 100%;
	height: 650px;
	background-attachment: fixed; /*将背景图片固定*/
	background-image: url("images/gif/f3.gif");
	background-repeat: repeat-x;
	background-position: top center;
}

#top_bg {
	width: 100%;
	height: 100%;
}

#top {
	width: 100%;
	height: 41px;
	background-color: #1F1F1F;
}

.top ul li a {
	color: #999;
	padding: 0px 8px;
}

.top ul li {
	margin-top: 10px;
	margin-right: 10px;
	float: right;
	text-align: center;
}

#top li {
	list-style-type: none;
}

#top>ul>li ul {
	color: #00ff00;
	display: none;
}

#top>ul>li a {
	color: #00ff00;
	text-decoration: none;
}

#top>ul>li a:hover {
	color: gray;
}

#top>ul>li:hover ul {
	display: block;
	position: absolute;
}

#top>ul>li>ul li {
	border: 1px solid #00ff00;
	width: 120px;
	background-color: #111;
	text-align: center;
}
</style>

</head>

<body>
	<!-- 头部包含登陆注册 -->
	<div id="top" class="top">
		<ul>
			<li><c:choose>

					<c:when test="${empty user}">
						<a href="jsp/login.jsp" style="border-right: 1px solid #333;">登录
						</a>
					</c:when>
					<c:otherwise>
						<h4 style="color:#00ff00">欢迎您,${user.username }管理员</h4>
						<ul>
							<li><a href="<c:url value='UserServlet?method=4' />">退出登陆</a>
							</li>

						</ul>
					</c:otherwise>
				</c:choose></li>
		</ul>
	</div>
	<center>
		<div class="AreaC">
			<div class="AreaL">
				<div class="box">
					<div class="box_1">
						<div class="head">
							&nbsp; <img src="images/logo.jpg"
								style="width: 180px; height: 180px">
						</div>


						<div class="userCenterBox" style="width:200px;padding:20px 0 0 0;">

							<div class="userMenu">
								<a> 管理中心 </a> <a class="titles">■&nbsp;交易管理</a>
								<div style="padding-left: 10px">

									<a href="<c:url value='/OrderServlet?method=4&flag=1' />">
										查看订单 </a> <a
										href="<c:url value='/OrderServlet?method=4&flag=2' />">
										处理订单 </a>
								</div>
								<a class="titles" href="">■&nbsp;商品管理</a>
								<div style="padding-left: 10px">
									<a href="<c:url value='/ProductServlet?method=1&flag=3' />">查看所有商品</a>
									<!-- 查看商品页面包含 编辑 和 删除  -->
									<a href="<c:url value='/ProductServlet?method=7&flag=4' />">添加商品信息</a>
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
							style="_height:1%; border:0px;"></div>


						<c:choose>
							<c:when test="${flag == 1 }">
								<!--  flag=1 显示全部订单页面-->
								<iframe src="jsp/manage/ordermanage.jsp" width="920px"
									height="1000px" frameborder="0"> </iframe>

							</c:when>
							<c:when test="${flag == 2 }">
								<!-- flag=2 显示处理订单页面-->
								<iframe src="jsp/manage/disposeorder.jsp" width="920px"
									height="1000px" frameborder="0"> </iframe>

							</c:when>
							<c:when test="${flag == 3 }">
								<!-- flag=3 显示查看所有商品页面（包含编辑 和 删除功能）-->
								<iframe src="jsp/manage/allproduct.jsp" width="920px"
									height="1000px" frameborder="0"> </iframe>

							</c:when>
							<c:when test="${flag == 4 }">
								<!--  flag=4 显示添加商品页面-->
								<iframe src="jsp/manage/insertproduct.jsp" width="920px"
									height="1000px" frameborder="0"> </iframe>

							</c:when>
						</c:choose>


					</div>
				</div>
			</div>

		</div>
	</center>
</html>
