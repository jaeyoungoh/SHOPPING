package com.kitri.shopping.product;

import java.util.List;
import java.util.Map;

public interface ProductMapper {
	//상품 목록보기
	//상품검색.
	//상품 추가
	//상품 수정
	//상품 삭제
	List<Product> selectAll();//전체상품 관리자
	List<Product> selectbyUser(String users_id);//판매자별 관리자
	List<Product> selectbyName(String name);//이름 으로 검색
	List<Product> selectbyCategory(String category); //카테고리별 검색.
	
	List<Product> cartbest();
	List<Product> orderbest();
	List<Product> newitem();
	
	Product select(int product_id);
	boolean insert(Product product);
	int update(Product product);
	int delete(int product_id);
	int updateStatus(Map<String, Object> map);
}
