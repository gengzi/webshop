<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<title>中转页面</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<style type="text/css">

body{
background-color:#111111;
color:#00ff00;
}
a{
color:#00ff00;
}

</style>

</head>

<body>

	<c:choose>
		<c:when test="${not empty orderResult}">
			<h3>
				<a href="jsp/myorder.jsp">${orderResult}点击进入个人中心</a>
			</h3>
		</c:when>
		<c:otherwise>
			<h3>服务器出现异常，请稍后再试！</h3>
		</c:otherwise>
	</c:choose>

</body>
</html>
