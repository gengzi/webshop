package cn.edu.aynu.sushe.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.edu.aynu.sushe.bean.Order;
import cn.edu.aynu.sushe.bean.Product;
import cn.edu.aynu.sushe.utils.CommonsUtils;
import cn.edu.aynu.sushe.utils.JDBCUtils;

/**
 * 处理关于分页显示 在数据库中的操作
 * 
 * @author 子
 * 
 */
public class PageDao {
	public static QueryRunner queryRunner = new QueryRunner(
			JDBCUtils.getDataSource());

	// 得到总记录数
	/**
	 * @return product 中的所有记录数
	 * @throws SQLException
	 */
	public int getPageTotalRecord() throws SQLException {
		String sql = "select count(*) from product "; // 拿到这个表的总行数
		// ScalarHandler 用于获取结果集中第一行某列的数据并转换成 T 表示的实际对象。
		// ScalarHandler 的参数为空或null时，返回第一行第一列的数据
		Long totalRecord = queryRunner.query(sql, new ScalarHandler<Long>());
		return totalRecord.intValue();

	}

	/**
	 * 得到每一页的商品列表
	 * 
	 * @param recoderStartIndex
	 *            当前页面中记录的起始记录号
	 * @param pagesize
	 *            当前页面需要显示的条目
	 * @return 一个List<Customer> 集合
	 * @throws SQLException
	 */
	public List<Product> getListProduct(int recoderStartIndex, int pagesize)
			throws SQLException {
		String sql = "select * from product limit ?,?";
		List<Product> datas = queryRunner.query(sql,
				new BeanListHandler<Product>(Product.class), recoderStartIndex,
				pagesize);

		return datas;
	}

	/**
	 * 得到订单的总记录数 和 订单表中的每一页的列表
	 * 
	 */
	public int getPageTotalOrder() throws SQLException {
		String sql = "select count(*) from order1 "; // 拿到这个表的总行数
		// ScalarHandler 用于获取结果集中第一行某列的数据并转换成 T 表示的实际对象。
		// ScalarHandler 的参数为空或null时，返回第一行第一列的数据
		Long totalRecord = queryRunner.query(sql, new ScalarHandler<Long>());
		return totalRecord.intValue();

	}

	public List<Order> getListOrder(int recoderStartIndex, int pagesize)
			throws SQLException {
		String sql = "select * from order1 limit ?,?";
		List<Order> datas = queryRunner.query(sql, new BeanListHandler<Order>(
				Order.class), recoderStartIndex, pagesize);

		return datas;
	}

}
