package cn.edu.aynu.sushe.filter;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;

import cn.edu.aynu.sushe.bean.User;

public class LoginFilter implements Filter {

	public void destroy() {

	}

	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;

		User user = (User) request.getSession().getAttribute("user");
		if (user != null) {
			chain.doFilter(request, response);
			return;
		}
	    response.sendRedirect("/webshop/jsp/login.jsp");
	}

	public void init(FilterConfig arg0) throws ServletException {

	}

}
