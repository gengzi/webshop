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

<title>添加商品信息</title>

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
#ac{
color:#00ff00;
}

</style>
<script Language="JavaScript" Type="text/javascript">
	function onSubmit() {
		var form1 = document.forms[0];
		var file = document.forms[0].file.value;
		var AllImgExt = ".jpg|.jpeg|.gif|.bmp|.png|";
		var extName = file.substring(file.lastIndexOf(".")).toLowerCase();
		if (AllImgExt.indexOf(extName + "|") == -1) {
			ErrMsg = "该文件类型不允许上传。请上传 " + AllImgExt + " 类型的文件，当前文件类型为" + extName;
			alert(ErrMsg);
			return false;
		}
		document.forms[0].submit();
		return true;

	}
</script>
</head>

<body>
	<div class="AreaR">
		<div class="box">
			<div class="box_1">
				<div class="userCenterBox boxCenterList clearfix"
					style="_height:1%; border:0px;">
					<h5>
						<span>添加商品</span>
					</h5>
					</br> </br>
					<div class="blank"></div>
					<table class="biaoge" width="100%" border="0" cellpadding="5"
						cellspacing="1" bgcolor="#dddddd">
						<tbody>

							<form enctype="multipart/form-data"
								action="<c:url  value='/ProductServlet?method=9'/>"
								method="post" onsubmit="return onSubmit()">
								<input  type="hidden" value="${ Mproduct.imgurl}" name="productimg">
								<input  type="hidden" value="${ Mproduct.id}" name="productid">
								<tr class="bg_head" align="center">
							<tr>
								<th width="40%">商品名称：</th>
								<th width="40%"><input type="text" name="name" size="30"
									value="${Mproduct.name}" />
								</th>


								<tr>
							<th width="40%">价钱：</th>
								<th width="40%"><input type="text" name="price" size="26"
									value="${Mproduct.price}" />元</th>
							</tr>
							<tr>
								<th width="40%">分类：</th>

								<th width="40%"><select name="category">
										<c:if test="${Mproduct.category == 1 }">
											<option value="1" selected="selected">鼠标</option>
											<option value="2">键盘</option>
											<option value="3">电脑</option>
											<option value="4">周边商品</option>
										</c:if>
										<c:if test="${Mproduct.category == 2 }">
											<option value="1">鼠标</option>
											<option value="2" selected="selected">键盘</option>
											<option value="3">电脑</option>
											<option value="4">周边商品</option>
										</c:if>
										<c:if test="${Mproduct.category == 3 }">
											<option value="1">鼠标</option>
											<option value="2">键盘</option>
											<option value="3" selected="selected">电脑</option>
											<option value="4">周边商品</option>
										</c:if>
										<c:if test="${Mproduct.category == 4 }">
											<option value="1">鼠标</option>
											<option value="2">键盘</option>
											<option value="3">电脑</option>
											<option value="4" selected="selected">周边商品</option>
										</c:if>

								</select></th>
							</tr>
							<tr>
								<th width="40%">库存：</th>
								<th width="40%"><input type="text" name="pnum" size="26"
									value="${Mproduct.pnum}" />个</th>
							</tr>
							<tr>
								<th width="40%">图片：</th>
								<th width="40%"><c:if test="${not empty  Mproduct.imgurl}">
										<img width="140px" height="140px" src="${Mproduct.imgurl}" />
									</c:if> <br> <input type="file" name="file" size="26"  /></th>
							</tr>
							<tr>
								<th width="40%">商品描述：</th>
								<th width="40%"><input type="text" name="description"
									size="30" value="${Mproduct.description}" /></th>
							</tr>
							<th width="40%"><a id="ac" href="javascript:history.back(-1)">返回</a></th>
							<th width="40%"><input type="submit" value="提交" />
							</th>
							</tr>

							</tr>



								</form>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<img src="${product.imgurl}" />

	</div>






</body>
</html>
