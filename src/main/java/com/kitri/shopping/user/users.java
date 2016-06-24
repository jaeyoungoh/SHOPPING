package com.kitri.shopping.user;

import java.util.Date;

public class users {
	private String user_id; 
	private String pwd;
	private String name;
	private String type; // 구매자(default), 판매자, 관리자, 회원탈퇴 4가지 (사용자는 등급변경요청후 판매자로 수정가능)
	private String email;
	private String address;
	//private int point;  포인트 및 적립, 할인관련 등등 미구현
	private String phone;
	private int point;
	private Date in_date;
	private Date out_date;
	
	public users() {
		// TODO Auto-generated constructor stub
	}

	
	public users(String user_id, String pwd, String name, String type, String email, String address, String phone,
			int point, Date in_date, Date out_date) {
		super();
		this.user_id = user_id;
		this.pwd = pwd;
		this.name = name;
		this.type = type;
		this.email = email;
		this.address = address;
		this.phone = phone;
		this.point = point;
		this.in_date = in_date;
		this.out_date = out_date;
	}

	@Override
	public String toString() {
		return "users [user_id=" + user_id + ", pwd=" + pwd + ", name=" + name + ", type=" + type + ", email=" + email
				+ ", address=" + address + ", phone=" + phone + ", point=" + point + ", in_date=" + in_date
				+ ", out_date=" + out_date + "]";
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getIn_date() {
		return in_date;
	}

	public void setIn_date(Date in_date) {
		this.in_date = in_date;
	}

	public Date getOut_date() {
		return out_date;
	}

	public void setOut_date(Date out_date) {
		this.out_date = out_date;
	}




	public int getPoint() {
		return point;
	}




	public void setPoint(int point) {
		this.point = point;
	}

	

	
	
	

}
