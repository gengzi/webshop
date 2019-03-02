package cn.edu.aynu.sushe.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.edu.aynu.sushe.bean.OrderItem;
import cn.edu.aynu.sushe.bean.Product;
import cn.edu.aynu.sushe.utils.JDBCUtils;

public class OrderItemDao {
	private QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
	
	//添加订单项到数据库表ordeitem中
	public void addItem(OrderItem orderItem) throws Exception{
		Connection conn = JDBCUtils.getConnection();
		String sql = "insert into orderitem values(?,?,?,?,?)";
		qr.update(conn, sql, orderItem.getId(),orderItem.getOrder_id(),orderItem.getProduct_id(),orderItem.getBuynum(),orderItem.getSubtotal());
	}
	
	//查询某一订单的所有订单项
	public List<OrderItem> findOrderItem(String order_id) throws SQLException{
		//查询某一订单所包含的订单项
		String sql = "select * from orderitem where order_id = ?";
		List<OrderItem> orderItemList = qr.query(sql, new BeanListHandler<OrderItem>(OrderItem.class), order_id);
		
		//查询某一订单所包含的订单项对应的商品信息
		sql = "select   p.id, p.name, p.price  from product p, orderitem oi where p.id = oi.product_id  and  order_id = ?";
		List<Product> productList = qr.query(sql, new BeanListHandler<Product>(Product.class), order_id);
		
		//将查询出来的商品作为订单项的属性进行添加
		for(OrderItem oi :orderItemList){
			for(Product p :productList){
				if(oi.getProduct_id().equals(p.getId())){
					oi.setProduct(p);
				}
			}
		}
		
		return orderItemList;
		
	}
}
