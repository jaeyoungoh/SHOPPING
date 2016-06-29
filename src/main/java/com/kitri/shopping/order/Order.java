package com.kitri.shopping.order;

public class Order {

	private int order_num;//주문번호
	
	private String order_date; //주문일시
	
	private String user_id; //주문자 아이디
	
	private String product_id; // 상품번호
	
	private int product_cnt; //상품 갯수
	
	private String product_status; //상품 상태 주문완료, 취소, 교환
	
	private String cancel_comment; //취소 사유
	
	private String name; //상품 이름.
	
	private String comment; //상품 후기
	
	private int recommend; //상품 추천
	
	private String img_url;//상품 이미지 주소
	
	private int price; //상품 가격
	
	
	public Order(){}
	
	public Order(int order_num, String order_date, String user_id, String product_id,
			int product_cnt, String product_status, String cancel_comment, String name, String comment, int recommend,
			String img_url,int price) {
		this.order_num = order_num;
		this.order_date = order_date;
		this.user_id = user_id;
		this.product_id = product_id;
		this.product_cnt = product_cnt;
		this.product_status = product_status;
		this.cancel_comment = cancel_comment;
		this.name = name;
		this.comment = comment;
		this.recommend = recommend;
		this.img_url = img_url;
		this.price = price;
	}
	

	@Override
	public String toString() {
		return "Order [order_num=" + order_num + ", order_date=" + order_date + ", user_id=" + user_id
				+ ", order_info_num=" + ", product_id=" + product_id + ", product_cnt=" + product_cnt
				+ ", product_status=" + product_status + ", cancel_comment=" + cancel_comment + ", name=" + name
				+ ", comment=" + comment + ", recommend=" + recommend + ", img_url=" + img_url + "]";
	}
	

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getOrder_num() {
		return order_num;
	}

	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}

	public String getOrder_date() {
		return order_date;
	}

	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getProduct_id() {
		return product_id;
	}

	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}

	public int getProduct_cnt() {
		return product_cnt;
	}

	public void setProduct_cnt(int product_cnt) {
		this.product_cnt = product_cnt;
	}

	public String getProduct_status() {
		return product_status;
	}

	public void setProduct_status(String product_status) {
		this.product_status = product_status;
	}

	public String getCancel_comment() {
		return cancel_comment;
	}

	public void setCancel_comment(String cancel_comment) {
		this.cancel_comment = cancel_comment;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public int getRecommend() {
		return recommend;
	}

	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}

	public String getImg_url() {
		return img_url;
	}

	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}
	
}
