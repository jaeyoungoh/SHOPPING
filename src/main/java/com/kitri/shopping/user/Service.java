package com.kitri.shopping.user;



public interface Service {
	
		
	void addid(users u); //회원 가입
	
	users get(String id);//회원 검색
	
	boolean login(users u);//회원 로그인, 로그아웃
	
	void editusers1(users u);//회원 수정, 
	
	void editusers2(users u); //판매자등록승인 
	
	void delusers(String id);//회원 탈퇴
	
	users findpwd(users u);//비밀번호찾기
	
	

}
