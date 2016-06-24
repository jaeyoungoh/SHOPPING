package com.kitri.shopping.user;

import java.util.List;

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
	public void adduser(users u) {
		// TODO Auto-generated method stub
		usersMapper usersMapper = sqlSession.getMapper(usersMapper.class);
		
		usersMapper.insert(u);
		
	}

	@Override
	public users get(String id) {
		// TODO Auto-generated method stub
		usersMapper usersMapper = sqlSession.getMapper(usersMapper.class);
		
		return usersMapper.select(id);
	}



	

	@Override
	public void delusers(String id) {
		// TODO Auto-generated method stub
		usersMapper usersMapper = sqlSession.getMapper(usersMapper.class);
		
		usersMapper.updateByWithdraw(id);
	}

	@Override
	public users findpwd(String email) {
		// TODO Auto-generated method stub
		usersMapper usersMapper = sqlSession.getMapper(usersMapper.class);
		
		return usersMapper.selectByEmail(email);
	}

	@Override
	public List<users> getAll() {
		// TODO Auto-generated method stub
		usersMapper usersMapper = sqlSession.getMapper(usersMapper.class);
		
		return usersMapper.selectAll();
	}

	@Override
	public void editusers(users u) {
		// TODO Auto-generated method stub
		usersMapper usersMapper = sqlSession.getMapper(usersMapper.class);
		usersMapper.update(u);
	}

	@Override
	public void editusersByApprove(String user_id) {
		// TODO Auto-generated method stub
		usersMapper usersMapper = sqlSession.getMapper(usersMapper.class);
		usersMapper.updateByApprove(user_id);
		
	}

	@Override
	public List<users> getAllType(String type) {
		// TODO Auto-generated method stub
		usersMapper usersMapper = sqlSession.getMapper(usersMapper.class);
		return usersMapper.selectByType(type);
	}

	@Override
	public users login(String user_id) {
		usersMapper usersMapper = sqlSession.getMapper(usersMapper.class);
		return usersMapper.select(user_id);
	}

	@Override
	public void editusersByApprove1(String user_id) {
		// TODO Auto-generated method stub
		usersMapper usersMapper = sqlSession.getMapper(usersMapper.class);
		usersMapper.updateByApprove1(user_id);
		
	}

}
