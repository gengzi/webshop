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

<title>${product.name }</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css" href="css/normalize.css">
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script src="js/common.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var showproduct = {
			"boxid" : "showbox",
			"sumid" : "showsum",
			"boxw" : 400,//宽度,该版本中请把宽高填写成一样
			"boxh" : 400,//高度,该版本中请把宽高填写成一样
			"sumw" : 60,//列表每个宽度,该版本中请把宽高填写成一样
			"sumh" : 60,//列表每个高度,该版本中请把宽高填写成一样
			"sumi" : 7,//列表间隔
			"sums" : 5,//列表显示个数
			"sumsel" : "sel",
			"sumborder" : 1,//列表边框，没有边框填写0，边框在css中修改
			"lastid" : "showlast",
			"nextid" : "shownext"
		};//参数定义	  
		$.ljsGlasses.pcGlasses(showproduct);//方法调用，务必在加载完后执行
	});
</script>

</head>

<body>
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
		<hr>
	</center>

	<div class="showall">
		<!--left -->
		<div class="showbot">
			<div id="showbox">
				<img src="${product.imgurl }" width="400" height="400" /> <img
					src="images/s/s1.png" width="400" height="400" /> <img
					src="${product.imgurl }" width="400" height="400" />
					<img src="images/s/s2.png" width="400" height="400" />
					<img src="${product.imgurl }" width="400" height="400" />
			</div>
			<!--展示图片盒子-->
			<div id="showsum">
				<!--展示图片里边-->
			</div>
			<p class="showpage">
				<a href="javascript:void(0);" id="showlast"> < </a> <a
					href="javascript:void(0);" id="shownext"> > </a>
			</p>
		</div>
		<!--conet -->
		<div class="tb-property">
			<div class="tr-nobdr">
				<h3 class="tr-nobdrt">${product.name }</h3>
			</div>
			<div class="txt">
				<span class="nowprice">￥<a href="">${product.price}</a> </span>
				<div class="cumulative">
					<span class="number ty1">累计售出<br /> <em
						id="add_sell_num_363">370</em> </span> <span class="number tyu">累计评价<br />
						<em id="add_sell_num_363">25</em> </span>
				</div>
			</div>
			<div class="txt-h">
				<span class="tex-o">分类</span>
				<ul class="glist" id="glist"
					data-monitor="goodsdetails_fenlei_click">
					<li><a title="标配" href="1">标配</a>
					</li>
					<li><a title="高配" href="1">高配</a>
					</li>
					<!--<li><a title="红色36g" href="">红色36g</a></li>
                        			<li><a title="蓝色16g" href="">红色36g</a></li>-->
				</ul>
			</div>
			<script>
				$(document).ready(function() {
					var t = $("#text_box");
					$('#min').attr('disabled', true);
					$("#add").click(function() {
						t.val(parseInt(t.val()) + 1)
						if (parseInt(t.val()) != 1) {
							$('#min').attr('disabled', false);
						}

					})
					$("#min").click(function() {
						t.val(parseInt(t.val()) - 1);
						if (parseInt(t.val()) == 1) {
							$('#min').attr('disabled', true);
						}

					})
				});
			</script>
			<div class="gcIpt">
				<span class="guT">数量</span> <input id="min" name="" type="button"
					value="-" /> <input id="text_box" name="" type="text" value="1"
					style="width:30px; text-align: center; color: #00ff00;" /> <input
					id="add" name="" type="button" value="+" /> <span class="Hgt">${product.pnum
					}</span>
			</div>
			<div class="nobdr-btns">
				<!-- 点击加入订单  -->
				<a
					href="<c:url value='/ProductServlet?method=2&id=${product.id}' />">
					<button class="addcart hu">
						<img src="images/pdimg/shop.png" width="25" height="25" />加入购物车
					</button> </a>
				<!-- 点击生成订单 -->
				<a href="<c:url value='/ProductServlet?method=2&id=${product.id}'/>">
					<button class="addcart yh">
						<img src="images/pdimg/ht.png" width="25" height="25" />立即购买
					</button> </a>
			</div>
			<div class="guarantee">
				<span>邮费：包邮&nbsp;&nbsp;支持货到付款 <a href=""><img
						src="images/pdimg/me.png" /> </a> </span>
			</div>
		</div>
		<!--right -->
		<div class="extInfo">
			<div class="brand-logo">
				<a href="" title="雷蛇"> <img src="images/logo.png" /> </a>
			</div>
			<div class="seller-pop-box">
				<span class="tr">商家名称：雷蛇官网旗舰店</span> <span class="tr">商家等级：钻石店铺</span>
				<span class="tr">客家电话：17630530305</span> <span class="tr hoh">
					<a title="河南安阳文峰区安阳师范学院菊一515" href="">所在地区：河南安阳文峰区安阳师范学院菊一515</a> </span>
			</div>
			<div class="seller-phone">
				<span class="pop im"> <a href="" data-name="联系卖家"><img
						src="images/pdimg/phon.png" />联系卖家</a> </span> <span class="pop in">
					<a href="" data-name="咨询卖家"><img src="images/pdimg/qq.png" />咨询卖家</a>
				</span> <span class="pop in"> <a href="" data-name="进店逛逛"><img
						src="images/pdimg/shop-line.png" />进店逛逛</a> </span> <span class="pop in">
					<a href="" data-name="关注店铺"><img src="images/pdimg/staar.png" />关注店铺</a>
				</span>
			</div>
			<div class="jd-service">
				<a href=""> <img src="images/pdimg/ho_07.png" /> </a>
			</div>
			<div class="suport-icons">
				<h4>
					扫一扫<br />手机下单更优惠
				</h4>
				<img src="images/pdimg/ho_11.jpg" />
			</div>
		</div>
	</div>
	<!-- 商品介紹 -->
	<div class="gdetail">
		<!-- left -->
		<div class="aside">
			<h3>
				看了还看<span><img src="images/pdimg/fod.png" width="22"
					height="22" />换一批</span>
			</h3>
			<dl class="ac-mod-list">
				<dt>
					<a href=""><img src="images/pdimg/pd01.png" /> </a>
				</dt>
				<dd>
					Razer/雷蛇 那伽梵蛇无极幻彩版 MMO专用 游戏鼠标<span>￥1099</span>
				</dd>
			</dl>
			<dl class="ac-mod-list">
				<dt>
					<a href=""><img src="images/pdimg/pd02.png" /> </a>
				</dt>
				<dd>
					Razer/雷蛇 那伽梵蛇六芒星V2 MMO专用 游戏鼠标<span>￥599</span>
				</dd>
			</dl>
			<dl class="ac-mod-list">
				<dt>
					<a href=""><img src="images/pdimg/pd03.png" /> </a>
				</dt>
				<dd>
					Razer/雷蛇 雨林狼蛛幻彩版<span>￥799</span>
				</dd>
			</dl>
		</div>
		<!-- right -->
		<script>
			var detail = document.querySelector('.detail');
			var origOffsetY = detail.offsetTop;
			function onScroll(e) {
				window.scrollY >= origOffsetY ? detail.classList.add('sticky')
						: detail.classList.remove('sticky');
			}
			document.addEventListener('scroll', onScroll);
		</script>
		<div class="detail">
			<div class="active_tab" id="outer">
				<ul class="act_title_left" id="tab">
					<li class="act_active"><a href="#">规格参数</a>
					</li>
					<li><a href="#">商品介绍</a>
					</li>
					<li><a href="#">商品评价</a>
					</li>
					<li><a href="#">售后保障</a>
					</li>
				</ul>
				<ul class="act_title_right">
					<li class="mui"><a id="mui-a" href="#">扫手机下单+</a>
					</li>
					<li class="mui-ac"><a href="#">加入购物车</a>
					</li>
				</ul>
				<div class="clear"></div>
			</div>
			<div id="content" class="active_list">
				<!--0-->
				<div id="ui-a" class="ui-a">
					<ul style="display:block;">
						<li><img src="images/pdimg/content_02.jpg" /></li>

					</ul>
				</div>
				</script>
			</div>
		</div>
</body>
</html>
