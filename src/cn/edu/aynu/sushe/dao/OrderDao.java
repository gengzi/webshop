package cn.edu.aynu.sushe.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

 
import cn.edu.aynu.sushe.bean.Order;
import cn.edu.aynu.sushe.utils.JDBCUtils;

public class OrderDao {
	private QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
	
	//添加订单到数据库表order1中
	public void add(Order order) throws Exception{
		Connection conn = JDBCUtils.getConnection();
		String sql = "insert into order1 values(?,?,?,?,?,?,?,?)";
		//订单的生成时间，由java.util.Date---->java.sql.Dtae
		Date date = new Date(order.getOrdertime().getTime());
		qr.update(conn, sql, order.getId(),order.getTotalMoney(),order.getReceiverAddress(),order.getReceiverName(),order.getReceiverPhone(),order.getPaysate(),date,order.getUser_id());
	}
	
	//根据user_id查看用户的订单
	public List<Order> findOrderByUser_id(String user_id) throws SQLException{
		String sql = "select * from order1 where user_id = ?";
		return qr.query(sql, new BeanListHandler<Order>(Order.class), user_id);
	}
	//管理员处理订单
	public List<Order> editOrder(String id,String receiverPhone,Date ordertime,int paysate) throws SQLException{
		String sql = "select * from order1 where id=?,receiverPhone=?,ordertime=?,paysate=?";
		return qr.query(sql, new BeanListHandler<Order>(Order.class),id, receiverPhone, ordertime, paysate);
	}
	
	
	//管理员查询所有的订单
	public List<Order> findAllOrder() throws SQLException{
		
		String sql = "select * from order1";
		List<Order> list = qr.query(sql, new BeanListHandler<Order>(Order.class));
		
		return list;
			
	}
	
	//删除一个订单
	public void delete(String id) throws SQLException{
		String sql ="delete from order1 wherw id= ?";
		qr.update(sql,id);
	}
}
