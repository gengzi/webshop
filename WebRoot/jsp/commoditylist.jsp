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
					<c:forEach items="${pageBean.datas}" var="c">

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
		<center>
<div style="clear:both;">
	第${pageBean.pageCode}页/共${pageBean.totalPage}页
	<!-- 首页 -->
	<a href='<c:url value='/ProductServlet?method=1&pagecode=1'></c:url>'>首页</a>
	<!-- 上一页 -->
	<c:if test="${pageBean.pageCode>1 }">
		<!-- 当页码大于第一页 -->
		<a
			href='<c:url value='/ProductServlet?method=1&pagecode=${pageBean.pageCode-1}'></c:url>'>上一页</a>
	</c:if>

	<!--【1】 【2】 页码显示  -->
	<!-- 初始化页码 -->
	<c:set var="begin" value="1"></c:set>
	<c:set var="end" value="10"></c:set>

	<!-- 在页码显示的当中会出现几种情况  -->
	<!--第一种，如果总页码就小于10 那么只显示从开始到总页码就可以了  -->
	<c:choose>
		<c:when test="${pageBean.totalPage <=10}">
			<c:set var="begin" value="1"></c:set>
			<c:set var="end" value="${pageBean.totalPage}"></c:set>
		</c:when>

		<c:otherwise>
			<!--第二种，页码大于10，但是在1-5页是不需要让页码发生变化的 -->
			                                             <!--第三种 页码大于10，但是在当前页码 +5 就大于了总页码，那么页码也不要变化了  -->
			<c:choose>
				<c:when test="${pageBean.pageCode - 4 <=1}">
					<c:set var="begin" value="1"></c:set>
					<c:set var="end" value="10"></c:set>
				</c:when>

				<c:when test="${pageBean.pageCode +5>=pageBean.totalPage }">
					<c:set var="begin" value="${pageBean.totalPage -9 }"></c:set>
					<!-- 起始页码就直接是 总页码-9  -->
					<c:set var="end" value="${pageBean.totalPage }"></c:set>
				</c:when>

				<c:otherwise>
					<!--第四种，是正常情况。 比如现在页码是第六页 ,起始页就是 第二页，最终页就是 第11页 -->
					<c:set var="begin" value="${pageBean.pageCode-4}"></c:set>
					<c:set var="end" value="${pageBean.pageCode+5 }"></c:set>
				</c:otherwise>
			</c:choose>
		</c:otherwise>
	</c:choose>




	<c:forEach var="i" begin="${begin}" end="${end}">
		<!-- 判断当前该页码是不是本页 -->
		<c:choose>
			<c:when test="${pageBean.pageCode == i}">${i}</c:when>
			<c:otherwise>
				<a
					href='<c:url value='/ProductServlet?method=1&pagecode=${i}'></c:url>'>${i}</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>



	<!--下一页  -->
	<c:if test="${pageBean.pageCode< pageBean.totalPage }">
		<!-- 当前页码不大于最大的页码 -->
		<a
			href='<c:url value='/ProductServlet?method=1&pagecode=${pageBean.pageCode+1 }'></c:url>'>下一页</a>
	</c:if>
	<a
		href='<c:url value='/ProductServlet?method=1&pagecode=${pageBean.totalPage}'></c:url>'>尾页</a>
	
	</div>	
	</center>
</body>
</html>
