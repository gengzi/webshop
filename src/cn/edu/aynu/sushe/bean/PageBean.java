package cn.edu.aynu.sushe.bean;

import java.util.List;

import javax.mail.search.OrTerm;

/**
 * 这个bean用于分页显示
 * 
 * @author 子
 * 
 */
public class PageBean {
	private int pageCode; // 当前页码，由jsp页面传回
	private int totalPage; // 总页数，查询数据库的总条目 /每一页显示的条数
	private int pageSize; // 每一页显示的记录数 为一个固定值
	private List<Product> datas;// 每一页商品的数量
	private List<Order> orderdatas; // 每一页订单的数量
	private int totalRecord;  //总记录数
	
	public int getTotalPage() {
		int totalPage = this.totalRecord /this.pageSize;
		return this.totalRecord % this.pageSize == 0 ? totalPage : totalPage + 1;
	}

	public List<Product> getDatas() {
		return datas;
	}

	public void setDatas(List<Product> datas) {
		this.datas = datas;
	}
	

	public List<Order> getOrderdatas() {
		return orderdatas;
	}

	public void setOrderdatas(List<Order> orderdatas) {
		this.orderdatas = orderdatas;
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}

	// 构造方法设置参数变量
	
	/**
	 * @param pageCode 第几页
	 * @param totalRecord  总页数
	 */
	public PageBean(int pageCode, int totalRecord) {
		super();
		this.pageCode = pageCode; // 当前是第几页
		this.totalRecord = totalRecord; // 从数据库种总共的记录数
		this.pageSize = 8; // 每一页显示的个数固定为 20
	}

	public PageBean() {

	}

	public int getPageCode() {
		return pageCode;
	}

	public void setPageCode(int pageCode) {
		this.pageCode = pageCode;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

}
