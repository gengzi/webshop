package cn.edu.aynu.sushe.service;

import java.sql.SQLException;
import java.util.List;

import cn.edu.aynu.sushe.bean.Product;
import cn.edu.aynu.sushe.dao.ProductDao;

public class ProductService {
	private ProductDao pdao = new ProductDao();

	// 查询所有商品
	public List<Product> findAll() {
		try {
			return pdao.findAll();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// 查看某一商品
	public Product findById(String id) {
		try {
			return pdao.findProductById(id);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// 添加商品信息
	public void addProduct(Product product) {
		try {
			pdao.addProduct(product);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// 根据商品的id 来更新商品信息
	public void editProductById(Product product) {

		try {
			pdao.updateProduct(product);
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	// 根据商品的id 删除该商品
	public void deleteById(String productid) {

		try {
			pdao.deleteByIdProduct(productid);
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	// 根据分类查找商品
	public List<Product> findBycategory(int category) {

		try {
			List<Product> list = pdao.findBycategory(category);
			return list;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}
}
