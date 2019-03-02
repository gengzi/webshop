package cn.edu.aynu.sushe.servlet;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadBase;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import cn.edu.aynu.sushe.bean.PageBean;
import cn.edu.aynu.sushe.bean.Product;
import cn.edu.aynu.sushe.service.PageService;
import cn.edu.aynu.sushe.service.ProductService;
import cn.edu.aynu.sushe.utils.CommonsUtils;

public class ProductServlet extends HttpServlet {
	private ProductService ps = new ProductService();
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
			this.findAll(request, response);
			break;
		case 2:
			this.addCart(request, response);
			break;
		case 3:
			this.changeCart(request, response);
			break;
		case 4:
			this.findById(request, response);
			break;
		case 5:
			this.addProductInfo(request, response);
			break;
		case 6:
			this.editCart(request, response);
			break;
		case 7:
			this.goToInstertProduct(request, response);
			break;
		case 8:
			this.findByIdProductInfo(request, response);
			break;
		case 9:
			this.editProductById(request, response);
			break;
		case 10:
			this.deleteById(request, response);
			break;
		case 11:
			this.findByCategoryProduct(request, response);
			break;
		}
	}

	/**  根据商品的分类查看商品
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void findByCategoryProduct(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		int categoryInt = Integer.parseInt(request.getParameter("category"));    
		
		//执行分类查找的方法
		List<Product> list = ps.findBycategory(categoryInt);
		
		request.setAttribute("categoryP", list);
		request.getRequestDispatcher("/jsp/categoryproduct.jsp").forward(request, response);
		
		
		
	}

	/**
	 * 根据id 删除该商品
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ServletException
	 */
	private void deleteById(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String pid = request.getParameter("productid");
		ps.deleteById(pid);
		request.getRequestDispatcher("/ProductServlet?method=1&flag=3&ap=4").forward(
				request, response);

	}

	/**
	 * 根据商品id修改信息
	 * 
	 * @param request
	 * @param response
	 */
	private void editProductById(HttpServletRequest request,
			HttpServletResponse response) {
		/**
		 * 【1】 限制文件上传的类型 只能是 jpg 和 png 类型的 解决 【2】限制文件上传的大小 小于2MB 的图片 解决
		 * 【3】创建一个images 目录 作为图片的路径。
		 * 
		 */
		String imgurl = null;
		// 处理响应的中文乱码
		response.setContentType("text/html;charset=UTF-8");
		// 创建工厂对象
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// 使用工厂对象创建ServletFileUpload对象（解析器）
		ServletFileUpload fileUpload = new ServletFileUpload(factory);
		// 解决文件名中文乱码
		fileUpload.setHeaderEncoding("UTF-8");
		// 设置上传的单个文件的大小,不能超过2048kB（2MB）
		fileUpload.setFileSizeMax(1024 * 2 * 1024);
		Product product = new Product();

		try {
			// 使用解析器解析request,得到包含fileItem对象的链表
			List<FileItem> list = fileUpload.parseRequest(request);
			// 遍历list，得到每一个fileItem（也就是每一个表单项）
			for (FileItem fileItem : list) {
				// 如果当前表单项为普通文本字段
				if (fileItem.isFormField()) {
					// 获取当前表单项的字段名称
					String filedName = fileItem.getFieldName();
					if (filedName.equals("name")) {
						product.setName(fileItem.getString("UTF-8"));

					} else if (filedName.equals("price")) {

						String p = fileItem.getString("UTF-8");
						double parseDouble = Double.parseDouble(p);
						product.setPrice(parseDouble);

					} else if (filedName.equals("category")) {
						product.setCategory(fileItem.getString("UTF-8"));

					} else if (filedName.equals("pnum")) {
						product.setPnum(Integer.parseInt(fileItem
								.getString("UTF-8")));

					} else if (filedName.equals("description")) {
						product.setDescription(fileItem.getString("UTF-8"));

					} else if (filedName.equals("productid")) {
						product.setId(fileItem.getString("UTF-8"));

					} else if (filedName.equals("productimg")) {
						imgurl = fileItem.getString("UTF-8");

					}

				} else {// 文件上传字段
					// 获取上传的文件名(原始文件名)
					String name = null;
					name = fileItem.getName();
					System.out.println(name);
					// 如果上传的文件名为空（没有指定上传文件）
					if (name == null || name.isEmpty()) {
						product.setImgurl(imgurl);
						continue;
					}
					if (name != null) {
						// 修改了图片
						// 我们先得到最后一个 \ 字符的位置，那么需要用到转义字符 \\ 转义就是 \
						int lastIndexOf = name.lastIndexOf(".");
						// 切割字符串
						String substring = name.substring(lastIndexOf);
						name = substring;

						// 获取上传文件保存的真实路径（绝对路径），上传的文件保存的目录

						String savepath = this.getServletContext().getRealPath(
								"/images/product");
						// 使用UUID对上传的文件进行重命名，保证文件名是唯一的
						String uuid = UUID.randomUUID().toString();
						// 新的文件名，格式：uuid_原始文件名

						String filename = uuid + "_1" + name;

						// 通过文件保存目录和文件名创建File对象
						File file = new File(savepath, filename);
						// 将上传文件保存到指定位置，上传结束
						fileItem.write(file);
						// 设置 img 路径
						product.setImgurl("images/product" + "/" + filename);
					}
				}
			}

			ps.editProductById(product);

		} catch (Exception e) {
			// 判断抛出的异常是否为超出了单个文件大小的上限
			if (e instanceof FileUploadBase.FileSizeLimitExceededException) {
			}
			throw new RuntimeException(e);

		}
	}

	/**
	 * 查看这个商品的具体信息,跳转到管理员的页面上
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ServletException
	 */
	private void findByIdProductInfo(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String id = request.getParameter("productid");
		int flag = Integer.parseInt(request.getParameter("flag"));
		Product product = ps.findById(id);
		request.setAttribute("flag", flag);
		request.getSession().setAttribute("Mproduct", product);
		request.getRequestDispatcher("/jsp/manage/editproduct.jsp").forward(
				request, response);

	}

	private void goToInstertProduct(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		int flag = Integer.parseInt(request.getParameter("flag"));
		request.setAttribute("flag", flag);
		request.getRequestDispatcher("/jsp/manage/bgmanageindex.jsp").forward(
				request, response);

	}

	/**
	 * 添加一个商品（信息）
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ServletException
	 */
	private void addProductInfo(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		// 上传图片
		try {
			// 设置图片的路径
			Product product = uploadImg(request, response);
			product.setId(CommonsUtils.uuid());
			ps.addProduct(product);

			Product findById = ps.findById("02BD6C9A7E48438F874078164D2A155F");
			request.setAttribute("product", findById);

			request.getRequestDispatcher("/jsp/manage/insertproduct.jsp").forward(
					request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	private Product uploadImg(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		/**
		 * 【1】 限制文件上传的类型 只能是 jpg 和 png 类型的 解决 【2】限制文件上传的大小 小于2MB 的图片 解决
		 * 【3】创建一个images 目录 作为图片的路径。
		 * 
		 */
		// 处理响应的中文乱码
		response.setContentType("text/html;charset=UTF-8");
		// 创建工厂对象
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// 使用工厂对象创建ServletFileUpload对象（解析器）
		ServletFileUpload fileUpload = new ServletFileUpload(factory);
		// 解决文件名中文乱码
		fileUpload.setHeaderEncoding("UTF-8");
		// 设置上传的单个文件的大小,不能超过2048kB（2MB）
		fileUpload.setFileSizeMax(1024 * 2 * 1024);
		Product product = new Product();

		try {
			// 使用解析器解析request,得到包含fileItem对象的链表
			List<FileItem> list = fileUpload.parseRequest(request);
			// 遍历list，得到每一个fileItem（也就是每一个表单项）
			for (FileItem fileItem : list) {
				// 如果当前表单项为普通文本字段
				if (fileItem.isFormField()) {
					// 获取当前表单项的字段名称

					String filedName = fileItem.getFieldName();
					if (filedName.equals("name")) {
						product.setName(fileItem.getString("UTF-8"));
					} else if (filedName.equals("price")) {
						product.setPrice(Integer.parseInt(fileItem
								.getString("UTF-8")));

					} else if (filedName.equals("category")) {
						product.setCategory(fileItem.getString("UTF-8"));

					} else if (filedName.equals("pnum")) {
						product.setPnum(Integer.parseInt(fileItem
								.getString("UTF-8")));

					} else if (filedName.equals("description")) {
						product.setDescription(fileItem.getString("UTF-8"));

					}

				} else {// 文件上传字段
					// 获取上传的文件名(原始文件名)
					String name = fileItem.getName();

					// 我们先得到最后一个 \ 字符的位置，那么需要用到转义字符 \\ 转义就是 \
					int lastIndexOf = name.lastIndexOf(".");
					// 切割字符串
					String substring = name.substring(lastIndexOf);
					name = substring;

					// 如果上传的文件名为空（没有指定上传文件）
					if (name == null || name.isEmpty()) {
						continue;
					}
					// 获取上传文件保存的真实路径（绝对路径），上传的文件保存的目录

					String savepath = this.getServletContext().getRealPath(
							"/images/product");
					// 使用UUID对上传的文件进行重命名，保证文件名是唯一的
					String uuid = UUID.randomUUID().toString();
					// 新的文件名，格式：uuid_原始文件名

					String filename = uuid + "_1" + name;

					// 通过文件保存目录和文件名创建File对象
					File file = new File(savepath, filename);
					// 将上传文件保存到指定位置，上传结束
					fileItem.write(file);
					// 设置 img 路径
					product.setImgurl("images/product" + "/" + filename);

				}

			}
			return product;
		} catch (Exception e) {
			// 判断抛出的异常是否为超出了单个文件大小的上限
			if (e instanceof FileUploadBase.FileSizeLimitExceededException) {

			}

			throw new RuntimeException(e);

		}
	}

	/**
	 * 根据id查找到该 商品的具体信息
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ServletException
	 * 
	 */
	private void findById(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String id = request.getParameter("productid");
		Product product = ps.findById(id);
		request.setAttribute("product", product);

		request.getRequestDispatcher("/jsp/productdetails.jsp").forward(
				request, response);

	}

	// 处理查询所有商品的请求
	public void findAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int pagecode = 1;
		int flag = 0;
		int ap = 0;
		String s = request.getParameter("pagecode");
		// 回传的flag 来判断是管理员操作的 并回调到不同的页面
		String f = request.getParameter("flag");
		String a = request.getParameter("ap");
		if (s != null) {
			pagecode = Integer.parseInt(s);
		}
		if (f != null) {
			flag = Integer.parseInt(f);
		}
		if (a != null) {
			ap = Integer.parseInt(a);
		}
		PageBean pageBean;
		try {
			pageBean = pageService.getPageBean(pagecode);
			int totalPage = pageBean.getTotalPage();
			// 将list存放到request域中
			request.setAttribute("pageBean", pageBean);

			// 通过请求转发将查询结果带到list.jsp页面上显示
			if (flag == 0) {
				request.getRequestDispatcher("/jsp/commoditylist.jsp").forward(
						request, response);
			} else if (flag == 3) {
				if (ap == 4) {
					request.getSession().setAttribute("spageBean", pageBean);
					request.getRequestDispatcher("/jsp/manage/allproduct.jsp")
							.forward(request, response);

				} else {
					request.setAttribute("flag", flag);
					request.getSession().setAttribute("spageBean", pageBean);
					request.getRequestDispatcher(
							"/jsp/manage/bgmanageindex.jsp").forward(request,
							response);
				}

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void addCart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 获取商品id
		String id = request.getParameter("id");
		// 得到商品
		Product p = ps.findById(id);

		// 购物车是保存在session中
		HttpSession session = request.getSession();
		// 从session中拿到购物车
		Map<Product, Integer> cart = (Map<Product, Integer>) session
				.getAttribute("cart");
		// 如果cart不存在,就创建购物车
		if (cart == null) {
			cart = new HashMap<Product, Integer>();
		}

		// 购物，就是向cart集合中加入商品和数量,如果有相同的商品，返回值为原有的数量
		// Integer count = cart.put(p, 1);
		// if(count != null){
		// cart.put(p, count+1);
		// }

		// 遍历Map中的所有key也就是商品对象，如果发现有商品的id和即将加入购物车的id相同，就在已有商品原来的数量基础上加1
		Iterator<Product> it = cart.keySet().iterator();
		boolean f = true;
		while (it.hasNext()) {
			Product pp = (Product) it.next();
			if (pp.getId().equals(p.getId())) {
				cart.put(pp, cart.get(pp) + 1);
				f = false;
			}
		}
		// 如果没有发现购物车原来有相同的商品，就直接加入
		if (f) {
			cart.put(p, 1);
		}

		// 将cart放入session
		session.setAttribute("cart", cart);
		// 重定向
		response.sendRedirect("/webshop/jsp/mycart.jsp");
	}

	public void changeCart(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		int count = Integer.parseInt(request.getParameter("count").trim());
		HttpSession session = request.getSession();
		Map<Product, Integer> cart = (Map<Product, Integer>) session
				.getAttribute("cart");

		Iterator<Product> it = cart.keySet().iterator();
		while (it.hasNext()) {
			Product pp = (Product) it.next();
			if (pp.getId().equals(id)) {
				if (count == 0) {// 删除当前商品
					// cart.remove(pp);
					it.remove();
				} else {// 修改当前商品数量
					cart.put(pp, count);
				}
			}
		}

		response.sendRedirect("/webshop/jsp/mycart.jsp");
	}

	/**
	 * 管理员处理商品
	 */
	public void editCart(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		int count = Integer.parseInt(request.getParameter("count").trim());
		HttpSession session = request.getSession();
		Map<Product, Integer> cart = (Map<Product, Integer>) session
				.getAttribute("cart");

		Iterator<Product> it = cart.keySet().iterator();
		while (it.hasNext()) {
			Product pp = (Product) it.next();
			if (pp.getId().equals(id)) {
				if (count == 0) {// 删除当前商品
					// cart.remove(pp);
					it.remove();
				} else {// 修改当前商品数量
					cart.put(pp, count);
				}
			}
		}

		response.sendRedirect("/webshop/jsp/bgmanageindex.jsp");
	}
}
