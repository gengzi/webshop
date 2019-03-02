package cn.edu.aynu.sushe.service;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.jsp.tagext.PageData;

import cn.edu.aynu.sushe.bean.Order;
import cn.edu.aynu.sushe.bean.PageBean;
import cn.edu.aynu.sushe.bean.Product;
import cn.edu.aynu.sushe.dao.PageDao;

/**
 * 处理分页的业务逻辑
 * 
 * @author 子
 * 
 */
public class PageService {
	public static PageDao pageDao = new PageDao();

	/**  处理商品分页请求
	 * @param pageCode
	 * @return
	 * @throws SQLException
	 */
	public PageBean getPageBean(int pageCode) throws SQLException {
		// 总记录数
		int pageTotalRecord = pageDao.getPageTotalRecord();
		//
		PageBean bean = new PageBean(pageCode, pageTotalRecord);

		List<Product> listCustomerdatas = pageDao.getListProduct(
				(pageCode - 1) * bean.getPageSize(), bean.getPageSize());
		

		bean.setDatas(listCustomerdatas);

		return bean;
	}

	
	/**
	 * 处理订单的分页请求
	 * 
	 */
	public PageBean getPageBeanOrder(int pageCode) throws SQLException {
		// 总记录数
		int pageTotalRecord = pageDao.getPageTotalOrder();
		//
		PageBean bean = new PageBean(pageCode, pageTotalRecord);

		List<Order> listCustomerdatas = pageDao.getListOrder(
				(pageCode - 1) * bean.getPageSize(), bean.getPageSize());
		
		bean.setOrderdatas(listCustomerdatas);

		return bean;
	}
	
	
	
}
