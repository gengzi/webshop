package cn.edu.aynu.sushe.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.edu.aynu.sushe.bean.Product;
import cn.edu.aynu.sushe.utils.JDBCUtils;

public class ProductDao {
	QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());

	// 查询所有商品
	public List<Product> findAll() throws SQLException {
		String sql = "select * from product";
		List<Product> list = qr.query(sql, new BeanListHandler<Product>(
				Product.class));
		return list;
	}

	// 根据id查找商品
	public Product findProductById(String id) throws SQLException {
		String sql = "select * from product where id=?";
		return qr.query(sql, new BeanHandler<Product>(Product.class), id);
	}

	// 添加一个商品
	public void addProduct(Product product) throws SQLException {
		String sql = "insert into product values(?,?,?,?,?,?,?)";
		qr.update(sql, product.getId(), product.getName(), product.getPrice(),
				product.getCategory(), product.getPnum(), product.getImgurl(),
				product.getDescription());
	}

	// 根据id更新一个商品的信息
	public void updateProduct(Product product) throws SQLException {
		String sql = "update product set name=?, price=?, category=?, pnum=?, imgurl=?,description=? where id=?";

		qr.update(sql, product.getName(), product.getPrice(),
				product.getCategory(), product.getPnum(), product.getImgurl(),
				product.getDescription(), product.getId());
	}

	// 根据id 删除一个商品
	public void deleteByIdProduct(String productid) throws SQLException {
		String sql = "delete from product where id=? ";
		qr.update(sql, productid);
	}

	// 根据分类查找一类商品
	public List<Product> findBycategory(int category) throws SQLException {
		String sql = "select * from product where category=? ";
		List<Product> list = qr.query(sql,
				new BeanListHandler<Product>(Product.class), category);
		return list;
	}

}
