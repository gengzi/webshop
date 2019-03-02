package cn.edu.aynu.sushe.bean;

import java.util.Date;
import java.util.List;

public class Order {
	private String id;
	private double totalMoney;
	private String receiverAddress;
	private String receiverName;
	private String receiverPhone;
	private int paysate; //0:未付款，1：已付款
	private Date ordertime;
	private String user_id;
	private List<OrderItem> list; //一个订单中包含若干个订单项
	private int send;//0:未发货，1：已发货
	
	public List<OrderItem> getList() {
		return list;
	}
	public void setList(List<OrderItem> list) {
		this.list = list;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public double getTotalMoney() {
		return totalMoney;
	}
	public void setTotalMoney(double totalMoney) {
		this.totalMoney = totalMoney;
	}
	public String getReceiverAddress() {
		return receiverAddress;
	}
	public void setReceiverAddress(String receiverAddress) {
		this.receiverAddress = receiverAddress;
	}
	public String getReceiverName() {
		return receiverName;
	}
	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}
	public String getReceiverPhone() {
		return receiverPhone;
	}
	public void setReceiverPhone(String receiverPhone) {
		this.receiverPhone = receiverPhone;
	}
	public int getPaysate() {
		return paysate;
	}
	public void setPaysate(int paysate) {
		this.paysate = paysate;
	}
	public Date getOrdertime() {
		return ordertime;
	}
	public void setOrdertime(Date ordertime) {
		this.ordertime = ordertime;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String userId) {
		user_id = userId;
	}
	
}
