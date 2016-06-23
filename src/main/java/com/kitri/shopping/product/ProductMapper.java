package com.kitri.shopping.product;

import java.util.List;

public interface ProductMapper {
	//상품 목록보기
	//상품검색.
	//상품 추가
	//상품 수정
	//상품 삭제
	List<Product> selectAll();
	List<Product> selectbyName(String name);
	List<Product> selectbyCategory(String category);
	Product select(int product_id);
	boolean insert(Product product);
	int update(Product product);
	int delete(int product_id);
}
