package com.kitri.shopping.user;

import java.util.List;

public interface Service {
	
		
	void adduser(users u); //회원 가입
	
	users get(String id);//회원 검색
	
	List<users> getAll();//회원 전체 검색
	
	users login(String user_id);//회원 로그인, 로그아웃
	
	void editusers(users u);//회원 정보 수정 
	
	void editusersByApprove(users u); //판매자등록승인 
	
	void delusers(String id);//회원 탈퇴
	
	users findpwd(String email);//비밀번호찾기
	
	List<users> getAllType(String type);//회원 전체 검색
	
	

}
