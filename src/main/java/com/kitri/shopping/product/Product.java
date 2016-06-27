package com.kitri.shopping.product;

import java.util.Date;

public class Product {
	private int product_id;
	private String name;
	private int quantity;
	private int price;
	private int sale_pct;
	private String img_url;
	private String category;
	private String intro_content;
	private String user_id;
	private Date product_date;
	private String status;
	
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
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
	public String getImg_url() {
		return img_url;
	}
	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getIntro_content() {
		return intro_content;
	}
	public void setIntro_content(String intro_content) {
		this.intro_content = intro_content;
	}

	public Product(int product_id, String name, int quantity, int price, int sale_pct, String img_url, String category,
			String intro_content, String user_id, Date product_date) {
		super();
		this.product_id = product_id;
		this.name = name;
		this.quantity = quantity;
		this.price = price;
		this.sale_pct = sale_pct;
		this.img_url = img_url;
		this.category = category;
		this.intro_content = intro_content;
		this.user_id = user_id;
		this.product_date = product_date;
	}
	@Override
	public String toString() {
		return "Product [product_id=" + product_id + ", name=" + name + ", quantity=" + quantity + ", price=" + price
				+ ", sale_pct=" + sale_pct + ", img_url=" + img_url + ", category=" + category + ", intro_content="
				+ intro_content + ", user_id=" + user_id + ", product_date=" + product_date + "]";
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public Date getProduct_date() {
		return product_date;
	}
	public void setProduct_date(Date product_date) {
		this.product_date = product_date;
	}
	public Product() {
	}

}

