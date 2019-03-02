package cn.edu.aynu.sushe.utils;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;

/**
 * 创建数据库连接池
 * @author Administrator
 *
 */
public class JDBCUtils {
	//创建一个ThreadLoacl对象，用当前线程作为key
	private static ThreadLocal<Connection> tc = new ThreadLocal<Connection>();
	
	//读取的是C3P0-config默认配置创建数据库连接池对象
	private static DataSource ds = new ComboPooledDataSource();
	//获取数据库连接池对象
	public static DataSource getDataSource(){
		return ds;
	}
	
	
	//从连接池中获取连接
	public static Connection getConnection() throws Exception{
		//从集合tc中获取一个Connection
		Connection conn = tc.get();
		if(conn == null){
			conn = ds.getConnection();
			//将conn存放到集合tc中
			tc.set(conn);
			System.out.println("首次创建连接："+conn);
		}
		return conn;
	}
	
	//开启事务
	public static void startTransaction(){
		try {
			//获取连接
			Connection conn = getConnection();
			//开启事务
			conn.setAutoCommit(false);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	//提交事务
	public static void commit(){
		try {
			//从集合tc中得到一个连接
			Connection conn = tc.get();
			if(conn != null){
				conn.commit();
			}			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	//回滚事务
	public static void rollback(){
		try {
			//从集合tc中得到一个连接
			Connection conn = tc.get();
			if(conn != null){
				conn.rollback();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//关闭连接释放资源
	public static void close(){
		//从集合tc中得到一个连接
		Connection conn = tc.get();
		if(conn != null){
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				//从集合tc中移除连接对象
				tc.remove();
				conn = null;
			}
		}
	}
}
