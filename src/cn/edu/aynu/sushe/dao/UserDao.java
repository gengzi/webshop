package cn.edu.aynu.sushe.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;


import cn.edu.aynu.sushe.bean.User;
import cn.edu.aynu.sushe.utils.JDBCUtils;

public class UserDao {
	QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());

	/**
	 * 添加用户信息到表user中
	 * 
	 * @param user
	 * @throws SQLException
	 */
	public void add(User user) throws SQLException {
		String sql = "insert into user values(?,?,?,?,?)";
		qr.update(sql, user.getId(), user.getUsername(), user.getPassword(),
				user.getName(), user.getTelephone());
	}

	/**
	 * 通过用户名查找用户
	 * 
	 * @param username
	 * @return
	 * @throws SQLException
	 */
	public User findByUsername(String username) throws SQLException {
		String sql = "select * from user where username = ?";
		User user = qr.query(sql, new BeanHandler<User>(User.class), username);
		return user;
	}

	/**
	 * 通过用户名判断用户是否存在
	 * 
	 * @param username
	 * @return
	 * @throws Exception 
	 */
	public boolean testFindByUsername(String username) throws Exception {
		String sql = "select username from user where username = ?";
		Connection connection = JDBCUtils.getConnection();
		PreparedStatement prepareStatement = connection.prepareStatement(sql);
		prepareStatement.setString(1, username);
		ResultSet executeQuery = prepareStatement.executeQuery();
		while (executeQuery.next()) {
			
			String t = executeQuery.getString("username");
			if (t.equals(username)) {
				return true;
			}
		}
		return false;
	}

}
