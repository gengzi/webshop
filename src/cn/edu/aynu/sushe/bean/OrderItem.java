package cn.edu.aynu.sushe.bean;

public class OrderItem {
	private String id;
	private String order_id;
	private String product_id;
	private int buynum;
	private double subtotal;
	
	private Product product; //一个订单项对应一个商品

	public Product getProduct() {
		return product;
	}
	
	public void setProduct(Product product) {
		this.product = product;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String orderId) {
		order_id = orderId;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String productId) {
		product_id = productId;
	}
	public int getBuynum() {
		return buynum;
	}
	public void setBuynum(int buynum) {
		this.buynum = buynum;
	}
	public double getSubtotal() {
		return subtotal;
	}
	public void setSubtotal(double subtotal) {
		this.subtotal = subtotal;
	}
	
}
