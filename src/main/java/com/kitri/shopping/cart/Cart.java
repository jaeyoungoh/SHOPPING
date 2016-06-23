package com.kitri.shopping.cart;

public class Cart {
	
	// 물건 번호
	private int product_id;
	// 물건 이름
	private String product_name;
	// 장바구니 담긴 물건 갯수
	private int product_cnt;
	//물건 가격
	private int price;
	//물건 할인
	private int sale_pct;
	//판매자 아이디
	private String user_id;
	//물건 이미지 파일
	private String img_url;
	
	public Cart() {	}
	
	public Cart(int product_id, String product_name, int product_cnt, int price, int sale_pct, String user_id,
			String img_url) {
		this.product_id = product_id;
		this.product_name = product_name;
		this.product_cnt = product_cnt;
		this.price = price;
		this.sale_pct = sale_pct;
		this.user_id = user_id;
		this.img_url = img_url;
	}



	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getSale_pct() {
		return sale_pct;
	}
	public void setSale_pct(int sale_pct) {
		this.sale_pct = sale_pct;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getImg_url() {
		return img_url;
	}
	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}

	public int getProduct_cnt() {
		return product_cnt;
	}

	public void setProduct_cnt(int product_cnt) {
		this.product_cnt = product_cnt;
	}
	
	

}