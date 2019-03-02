package cn.edu.aynu.sushe.service;

import java.sql.SQLException;

import cn.edu.aynu.sushe.bean.User;
import cn.edu.aynu.sushe.dao.UserDao;

public class UserService {
	private UserDao userDao = new UserDao();

	/**
	 * 用户注册
	 * 
	 * @param user
	 * @throws UserException
	 */
	public void register(User user) throws UserException {
		/**
		 * 1、检测输入的用户名是否存在，如果存在抛出异常--"用户名已存在" 2、把用户信息添加到数据库表user中
		 */
		try {
			// 检测用户名是否存在
			User u = userDao.findByUsername(user.getUsername());
			// 如果用户名已存在
			if (u != null) {
				throw new UserException("用户名已经存在");
			}
			// 注册用户
			userDao.add(user);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * 用户登录
	 * 
	 * @param user
	 * @return
	 */
	public User login(User user) throws UserException {
		/**
		 * 1、根据用户名查询得到User对象u 2、如果User对象u为null，说明用户不存在，抛出异常，显示：用户名不存在
		 * 3、如果User对象u不为null,说明用户存在，检测User对象中的密码和用户输入的密码是否一致，
		 * 如果不一致，就抛出异常，显示：密码错误 4、如果用户名和密码都正确，返回查询到的User对象u
		 */
		try {
			User u = userDao.findByUsername(user.getUsername());
			if (u == null) {
				throw new UserException("用户名错误");
			}
			// 查询到的用户密码和用户名输入的密码不一致
			if (!u.getPassword().equals(user.getPassword())) {
				throw new UserException("密码错误");
			}
			return u;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	/** 检测用户名是否存在
	 * @param username
	 * @return
	 */
	public boolean testFindByUsername(String username) {

		try {
			boolean test = userDao.testFindByUsername(username);
			return test;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}

	}

}
