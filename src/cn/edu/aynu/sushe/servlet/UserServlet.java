package cn.edu.aynu.sushe.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.edu.aynu.sushe.bean.User;
import cn.edu.aynu.sushe.service.UserException;
import cn.edu.aynu.sushe.service.UserService;
import cn.edu.aynu.sushe.utils.CommonsUtils;

public class UserServlet extends HttpServlet {
	private UserService userService = new UserService();

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int method = Integer.parseInt(request.getParameter("method"));

		switch (method) {
		case 1:
			this.register(request, response);
			break;
		case 2:
			this.login(request, response);
			break;
		case 3:
			this.testUsername(request, response);
			break;
		case 4:
			this.quitUser(request, response);
			break;
		}
	}

	/**
	 * 退出登录
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ServletException
	 */
	private void quitUser(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		session.removeAttribute("user");
		session.invalidate();
		request.setAttribute("msg_back", "成功退出账号");
		request.getRequestDispatcher("/jsp/login.jsp").forward(request,
				response);

	}

	/**
	 * 测试用户是否已经存在
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ServletException
	 */
	private void testUsername(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		String username = request.getParameter("username");
		boolean test = userService.testFindByUsername(username);
		if (test) { // 为ture 就是存在用户名
			request.setAttribute("username", username);
			request.setAttribute("testmsg",
					"<font style='color:#FF0000;'>用户已经存在,请重新输入！</font>");
			request.setAttribute("testbl", 1);

			request.getRequestDispatcher("/jsp/register.jsp").forward(request,
					response);

		} else { // 不存在该用户
			request.setAttribute("username", username);
			request.setAttribute("testmsg", "用户名√");
			request.setAttribute("testbl", 0);
			request.getRequestDispatcher("/jsp/register.jsp").forward(request,
					response);

		}

	}

	public void register(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		/**
		 * 1、将注册表单中的用户信息封装到User对象中 2、将获取的UUID值作为User对象的id
		 * 3、注册，如果发生异常，就到register.jsp页面上显示：用户名已存在； 如果成功，就在index.jsp页面显示：注册成功
		 */
		User user = CommonsUtils.toBean(request.getParameterMap(), User.class);
		user.setId(CommonsUtils.uuid());
		try {

			// 获取到验证码参数
			String yzm = request.getParameter("yzm");
			if (yzm.equals(request.getSession().getAttribute("check_code"))) {
				userService.register(user);
				request.setAttribute("msg1", "注册成功");
				request.getRequestDispatcher("jsp/login.jsp").forward(request,
						response);
			} else {
				request.setAttribute("msg", "验证码错误");
				// 将用户在注册表单中输入的信息保存在request域中，请求转发的register.jsp，目的回显
				request.setAttribute("user", user);
				request.getRequestDispatcher("/jsp/register.jsp").forward(
						request, response);
			}

		} catch (UserException e) {
			request.setAttribute("msg", e.getMessage());
			// 将用户在注册表单中输入的信息保存在request域中，请求转发的register.jsp，目的回显
			request.setAttribute("user", user);
			request.getRequestDispatcher("/jsp/register.jsp").forward(request,
					response);
		}

	}

	public void login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/**
		 * 1、将用户登录表单中的信息封装成User对象 2、登录，如果发生异常：就转发到login.jsp页面,显示：异常信息
		 * 如果成功：就将查询到到的User对象u，存放到session域中， 然后转发到shopping.jsp页面,显示：欢迎用户 登录
		 */
		String remeber = "0";

		User user = CommonsUtils.toBean(request.getParameterMap(), User.class);

		try {// 判断用户类型，获取页面传来的值
			String select = request.getParameter("select");
			int tag = Integer.parseInt(select);
			// 获取到验证码参数
			String yzm = request.getParameter("yzm");

			if (yzm.equals(request.getSession().getAttribute("check_code"))) {
				User u = userService.login(user);
				// 将u存放到session域中
				request.getSession().setAttribute("user", u);
				// 判断回传的参数 tag 为 0 就是 普通用户登陆
				// 判断remeber 的值为 1 时，记住密码
				remeber = request.getParameter("remember");
				if (remeber != null && remeber.equals("1")) {
					Cookie cookie = new Cookie("userna",
							request.getParameter("username"));
					Cookie cookie1 = new Cookie("userpa",
							request.getParameter("password"));
					cookie.setMaxAge(60 * 60 * 24 * 3);
					cookie1.setMaxAge(60 * 60 * 24 * 3);
					response.addCookie(cookie);
					response.addCookie(cookie1);
				}
				if (tag == 0) {
					request.getRequestDispatcher("/ProductServlet?method=1")
							.forward(request, response);
				} else if (tag == 1) {// 判断回传的参数 tag 为 1 就是 管理员登陆
					request.getRequestDispatcher(
							"/jsp/manage/bgmanageindex.jsp").forward(request,
							response);
				}
			} else {
				request.setAttribute("msg", "验证码错误");
				request.setAttribute("user", user); // 回显
				request.getRequestDispatcher("/jsp/login.jsp").forward(request,
						response);
			}
		} catch (UserException e) {
			request.setAttribute("msg1", e.getMessage());
			request.setAttribute("user", user); // 回显
			request.getRequestDispatcher("/jsp/login.jsp").forward(request,
					response);
		}

	}

}
