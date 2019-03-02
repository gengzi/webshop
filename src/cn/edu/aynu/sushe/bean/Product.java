package cn.edu.aynu.sushe.bean;

import java.io.Serializable;

public class Product implements Serializable{
	//数据库表product中的字段名要和JavaBean类Product的属性一一对应
	//在添加商品的表单中各个表单项的名字也要和类Product中的属性一一对应
	private String id;
	private String name;
	private double price;
	private String category;
	private int pnum;
	private String imgurl;
	private String description;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public String getImgurl() {
		return imgurl;
	}
	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	
}
