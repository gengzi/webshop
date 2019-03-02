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

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="icon" href="imgs/gsjic.ico" type="image/x-ico" />
<title>键鼠特卖官网</title>
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
}

body {
	background-color: #FBFBFB;
	width: 100%;
	margin: 0 auto;
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
						<a href="jsp/register.jsp">注册 </a>

					</c:when>
					<c:otherwise>
						<h4 style="color:#00ff00">欢迎您,${user.username }用户</h4>
						<ul>
							<li><a href="jsp/myorder.jsp">个人中心</a></li>
							<li><a href="jsp/mycart.jsp">我的购物车</a></li>
							<li><a href="<c:url value='UserServlet?method=4' />">退出登陆</a></li>

						</ul>
					</c:otherwise>
				</c:choose>
			</li>
		</ul>
	</div>

	<div id="top1" class="top1">
		<img id="top_bg" src="images/3.png" />
	</div>

<!-- 浮动框架显示所有的商品 -->
	<iframe height="1000px" width="100%" name="iframe1"
		src="<%=path%>/ProductServlet?method=1" frameborder="0" />




</body>
</html>
