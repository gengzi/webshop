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

<title>注册页面</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css" href="css/register.css">
<link rel="stylesheet" type="text/css" href="css/index_a.css">
<script type="text/javascript" src="js/register.js"></script>

</head>

<body>

	<div id="top" class="top">
		<ul>
			<li><a href="jsp/login.jsp"
				style="border-right: 1px solid #333;">登陆</a> <a
				href="jsp/register.jsp">注册</a></li>
		</ul>
	</div>
	<center>
		<div class="register_right">
			<div class="regtitle">注册新用户</div>
			<div class="register_cont">
				<form action="<c:url value="/UserServlet" />" method="post" onsubmit="return checkForm()">
					<input type="hidden" name="method" value="1">
					<!-- 作为用户名重复的判断标志  -->
					<input  id="testbl" type="hidden" name="testbl" value="${testbl}">
					
					<ul>
						<li>
							<p>用户名</p> <input onfocus="usernameFocus()"
							onblur="usernameBlur()" name="username" type="text" size="25"
							id="username" class="inputBg"
							value="${user.username }${username}"> <span
							id="checkUsername"><font style="color:#00ff00;">${testmsg}</font>
						</span></li>
						<li style="clear:both;">
							<p>真实姓名</p> <input onfocus="nameFocus()" onblur="nameBlur()"
							name="name" type="text" size="25" id="name" class="inputBg"
							value="${user.name }"> <span id="checkName"></span></li>
						<li style="clear:both;">
							<p>电话</p> <input onfocus="telePhoneFocus()"
							onblur="telePhoneBlur()" name="telephone" type="text" size="25"
							id="telephone" class="inputBg" value="${user.telephone }">
							<span id="checkTelephone"></span></li>
						<li style="clear:both;">
							<p>密码</p> <input id="password" name="password" type="password"
							onfocus="passwordFocus()" onblur="passwordBlur()" class="inputBg">
							<span id="checkPassword"></span>
						</li>

						<li style="clear:both;">
							<p>确认密码</p> <input name="Rpassword" type="password"
							id="Rpassword" onblur="checkRpassword()" class="inputBg"
							style="width:260px;"> <span id="checkRPassword"></span>
						</li>
						<li style="clear:both;">
							<p>验证码</p> <input type="text" size="4" name="yzm" class="inputBg"
							style="width:260px;"> <img src="/webshop/CheckServlet"
							onclick="this.src=this.src+'?'"></li>
						<li style="clear:both;"><span
							id="conform_password_notice">${msg}</span>
							<!-- 这样写如果返回false 就禁止提交表单 -->
							<button  name="Submit" type="submit" value="" class="razer-button">立即注册</button>
							<i>我已有账号，我要<a href="jsp/login.jsp">登录</a> </i>
						</li>
					</ul>
				</form>
			</div>
		</div>
	</center>
</body>
</html>
