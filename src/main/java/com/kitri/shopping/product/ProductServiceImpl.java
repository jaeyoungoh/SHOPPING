package com.kitri.shopping.product;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

@Component("productService")
public class ProductServiceImpl implements ProductService {

	@Resource(name="sqlSession")
	private SqlSession sqlsession;

	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}

	@Override
	public List<Product> getAllProduct() {
		ProductMapper productmapper=sqlsession.getMapper(ProductMapper.class);
		List<Product> list=productmapper.selectAll();
		return list;
	}

	@Override
	public List<Product> getProductbyName(String name) {
		ProductMapper productmapper=sqlsession.getMapper(ProductMapper.class);
		return productmapper.selectbyName(name);
	}

	@Override
	public List<Product> getProductbyCategory(String category) {
		ProductMapper productmapper=sqlsession.getMapper(ProductMapper.class);
		return productmapper.selectbyCategory(category);
	}

	@Override
	public Product getProduct(int product_id) {
		ProductMapper productmapper=sqlsession.getMapper(ProductMapper.class);
		return productmapper.select(product_id);
	}

	@Override
	public boolean addProduct(Product product) {
		ProductMapper productmapper=sqlsession.getMapper(ProductMapper.class);
		return productmapper.insert(product);
	}

	@Override
	public int editProduct(Product product) {
		ProductMapper productmapper=sqlsession.getMapper(ProductMapper.class);
		return productmapper.update(product);
	}

	@Override
	public int delProduct(int product_id) {
		ProductMapper productmapper=sqlsession.getMapper(ProductMapper.class);
		return productmapper.delete(product_id);
	}

	@Override
	public List<Product> getProductbyUser(String users_id) {
		ProductMapper productmapper=sqlsession.getMapper(ProductMapper.class);
		return productmapper.selectbyUser(users_id);
	}
	
}
