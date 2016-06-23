package com.kitri.shopping.user;

public class users {
	private String id; 
	private String pwd;
	private String name;
	private String type; // 구매자(default), 판매자, 관리자, 회원탈퇴 4가지 (사용자는 등급변경요청후 판매자로 수정가능)
	private String email;
	private String address;
	//private int point;  포인트 및 적립, 할인관련 등등 미구현
	
	
	public users() {}


	public users(String id, String pwd, String name, String type, String email, String address) {
		
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.type = type;
		this.email = email;
		this.address = address;
	}


	@Override
	public String toString() {
		return "users [id=" + id + ", pwd=" + pwd + ", name=" + name + ", type=" + type + ", email=" + email
				+ ", address=" + address + "]";
	}


	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	public String getPwd() {
		return pwd;
	}



	public void setPwd(String pwd) {
		this.pwd = pwd;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getType() {
		return type;
	}



	public void setType(String type) {
		this.type = type;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getAddress() {
		return address;
	}



	public void setAddress(String address) {
		this.address = address;
	}

	
	
	

}
