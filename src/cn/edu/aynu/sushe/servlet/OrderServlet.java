package cn.edu.aynu.sushe.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.aynu.sushe.bean.Order;
import cn.edu.aynu.sushe.bean.OrderItem;
import cn.edu.aynu.sushe.bean.PageBean;
import cn.edu.aynu.sushe.bean.Product;
import cn.edu.aynu.sushe.bean.User;
import cn.edu.aynu.sushe.service.OrderService;
import cn.edu.aynu.sushe.service.PageService;
import cn.edu.aynu.sushe.utils.CommonsUtils;

public class OrderServlet extends HttpServlet {
	private OrderService orderService = new OrderService();
	private PageService pageService = new PageService();

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int method = Integer.parseInt(request.getParameter("method"));
		switch (method) {
		case 1:
			this.addOrder(request, response);
			break;
		case 2:
			this.findMyOrder(request, response);
			break;
		case 3:
			this.findOrderItem(request, response);
			break;
		case 4:
			this.findAllOrder(request, response);
			break;
		case 5:
			this.editOrder(request, response);
			break;
		}
	}

	/**
	 * 管理员查找所有的订单
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ServletException
	 */
	private void findAllOrder(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		/**
		 * 将订单表中的数据全部拿出来。
		 * 
		 */
		int pagecode = 1;
		int flag = 0;
		String s = request.getParameter("pagecode");
		String f = request.getParameter("flag");
		if (s != null) {
			pagecode = Integer.parseInt(s);
		}
		if (f != null) {
			flag = Integer.parseInt(f);
		}
		PageBean pageBean;
		try {
			pageBean = pageService.getPageBeanOrder(pagecode);
			int totalPage = pageBean.getTotalPage();
			// 将list存放到request域中
			request.getSession().setAttribute("orderPageBean", pageBean);
			request.setAttribute("flag", flag);
			if (flag == 0) {
				request.getRequestDispatcher("/jsp/manage/ordermanage.jsp")
						.forward(request, response);
			} else if (flag == 10) {
				request.getRequestDispatcher("/jsp/manage/disposeorder.jsp")
				.forward(request, response);
				
			} else{

				request.getRequestDispatcher("/jsp/manage/bgmanageindex.jsp")
						.forward(request, response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	/**
	 * 管理员对订单进行修改
	 */
	public void editOrder(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String id = null;
		int paysate = 0;
		String receiverPhone = null;
		java.sql.Date ordertime = null;

		// 从数据库中获取必要的字段名
		List<Order> list = orderService.editOrder(id, receiverPhone, ordertime,
				paysate);
		int flag = Integer.parseInt(request.getParameter("flag"));
		// Order order = CommonsUtils.toBean(request.getParameterMap(),
		// Order.class);
		// System.out.println("order");

		request.getSession().setAttribute("allOrder", list);
		request.setAttribute("flag", flag);
		request.getRequestDispatcher("/jsp/manage/bgmanageindex.jsp").forward(
				request, response);
	}

	// 添加订单和订单项
	public void addOrder(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		/**
		 * 1、判断用户是否登陆，如果未登录就重定向到login.jsp页面 2、使用工具类将订单表单中的信息封装成Order对象，补全剩余字段，
		 * 3、从session中获取购物车，遍历购物车，创建订单项，把他们加入List集合 4、添加订单和订单项
		 */
		User user = (User) request.getSession().getAttribute("user");
		if (user == null) {
			response.sendRedirect("/webshop/jsp/login.jsp");
			return;
		}

		Order order = CommonsUtils.toBean(request.getParameterMap(),
				Order.class);
		// 补全剩余字段
		order.setId(CommonsUtils.uuid());
		order.setOrdertime(new Date());
		order.setPaysate(0);
		order.setUser_id(user.getId());

		Map<Product, Integer> cart = (Map<Product, Integer>) request
				.getSession().getAttribute("cart");
		List<OrderItem> list = new ArrayList<OrderItem>();
		for (Product p : cart.keySet()) {
			OrderItem orderItem = new OrderItem();
			orderItem.setId(CommonsUtils.uuid());
			orderItem.setOrder_id(order.getId());
			orderItem.setProduct_id(p.getId());
			orderItem.setBuynum(cart.get(p));
			orderItem.setSubtotal(p.getPrice() * orderItem.getBuynum());
			// 订单项加入list集合
			list.add(orderItem);
		}
		order.setList(list);
		// 添加订单和订单项
		String result = orderService.addOrder(order);
		request.setAttribute("orderResult", result);
		request.getRequestDispatcher("/jsp/result.jsp").forward(request,
				response);
	}

	// 查看我的订单
	public void findMyOrder(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		/**
		 * 1、用户已经登录，从session中获取用户的信息，从用户信息中得到user_id 2、调用方法的得到用户的订单的集合
		 * 3、通过请求转发将订单集合显示在myOrder.jsp页面上
		 */
		User user = (User) request.getSession().getAttribute("user");
		String user_id = user.getId();
		List<Order> list = orderService.findMyOrder(user_id);
		request.setAttribute("myOrderList", list);
		request.getRequestDispatcher("/jsp/myorder.jsp").forward(request,
				response);
	}

	// 查看我的订单的详情
	public void findOrderItem(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		/**
		 * 1、从请求中获取订单的id 2、调用方法得到订单详情的集合 3、通过请求转发将订单详情在orderItem.jsp页面上显示
		 */
		String order_id = request.getParameter("order_id");
		int flag = Integer.parseInt(request.getParameter("flag"));
		List<OrderItem> list = orderService.findOrderItem(order_id);
		request.setAttribute("orderItemList", list);

		// 判断flag 是否等于1
		if (flag == 1) {
			// 等于1 就是管理员查看的订单项
			request.getRequestDispatcher("jsp/manage/orderitem.jsp").forward(
					request, response);

		} else {
			// flag 不存在或者是其它值，就是用户查看订单

			request.getRequestDispatcher("/jsp/myorderitem.jsp").forward(
					request, response);
		}

	}

}
