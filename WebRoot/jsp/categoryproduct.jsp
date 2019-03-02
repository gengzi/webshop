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

<title>键鼠特卖</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css" href="css/commoditylist.css">
<link rel="stylesheet" type="text/css"
	href="css/commoditylist_daohang.css">

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


	<div id="topimg">
		<img alt="top" src="images/logo.png">
	</div>
	<center>
		<div id="title">
			<h1>键鼠特卖官网</h1>
		</div>
	</center>


	<div>
		<div id="daohang" class="daohang">
			<ul id="dao_list">
				<li id="li_sy"><a href="<%=path%>/ProductServlet?method=1">推荐单品</a>
				</li>
				<li><a href="<%=path%>/ProductServlet?method=11&category=1">鼠标</a>
				</li>
				<li><a href="<%=path%>/ProductServlet?method=11&category=2">键盘</a>
				</li>
				<li><a href="<%=path%>/ProductServlet?method=11&category=4">周边配件</a>
				</li>
				<li><a href="<%=path%>/ProductServlet?method=11&category=3">笔记本电脑</a>
				</li>
			</ul>
		</div>

		<center>
			<div class="product-div">
				<ul class="product-list">
					<c:forEach items="${categoryP}" var="c">

						<li><a
							href="<c:url value='/ProductServlet?method=4&productid=${c.id}' />"
							target="_blank"> <img src="${c.imgurl}">
								<div class="price-box">
									<h4 color="#00A000">${c.name }</h4>

									<span style="display:none;">${c.price }</span> <span
										class="discount">￥${c.price }</span>

								</div> </a></li>

					</c:forEach>
				</ul>
			</div>
		</center>
</body>
</html>
