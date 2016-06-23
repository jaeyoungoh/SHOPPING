package com.kitri.shopping.user;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

@Component("userService")
public class ServiceImpl implements Service {

	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}	
	
	@Override
	public void addid(users u) {
		// TODO Auto-generated method stub
	
	}

	@Override
	public users get(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean login(users u) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void editusers1(users u) {
		// TODO Auto-generated method stub

	}

	@Override
	public void editusers2(users u) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delusers(String id) {
		// TODO Auto-generated method stub

	}

	@Override
	public users findpwd(users u) {
		// TODO Auto-generated method stub
		return null;
	}

}
