package com.kitri.shopping.user;

import java.util.List;

public interface usersMapper {
	void insert(users u); //회원 가입
	
	users select(String user_id);//회원 검색
	
	List<users> selectAll();//회원 전체 검색
	
	void update(users u);//회원 정보 수정, 
	
	void updateByApprove1(String user_id); //일반으로 만들기
	
	void updateByApprove(String user_id); //판매자등록승인 
	
	void updateByWithdraw(String id);//회원 탈퇴
	
	users selectByEmail(String email);//비밀번호찾기
	
	List<users> selectByType(String type);//회원 타입으로 검색

}
