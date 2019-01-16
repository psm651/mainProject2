package com.wthealth.service.user.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.wthealth.common.Search;
import com.wthealth.domain.User;
import com.wthealth.service.user.UserDao;

@Repository("userDaoImpl")
public class UserDaoImpl implements UserDao {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public UserDaoImpl() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}

	@Override
	public void addUser(User user) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("UserMapper.addUser", user);
	}

	@Override
	public User getUser(String userId) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("UserMapper.getUser", userId);
	}

	@Override
	public void updateUser(User user) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("UserMapper.updateUser", user);
	}
	
	@Override
	public void deleteUser(User user) throws Exception{
		sqlSession.update("UserMapper.deleteUser", user);
	}
	
	@Override
	public User findId(String nickName) throws Exception{
		return sqlSession.selectOne("UserMapper.findId", nickName);
	}
	
	@Override
	public void findPassword(User user) throws Exception{
		sqlSession.update("UserMapper.findPassword", user);
	}
	
	
	@Override
	public void updateHavingPoint(User user) throws Exception{
		sqlSession.update("UserMapper.updateHavingPoint", user);
	}
	
	@Override
	public void updateAccount(User user) throws Exception{
		sqlSession.update("UserMapper.updateAccount", user);
	}
	
	@Override
	public void snsLogin(User user) throws Exception{
		sqlSession.insert("UserMapper.snsLogin", user);
	}
	
	/*@Override
	public void kakaoLogin(User user) throws Exception{
		sqlSession.insert("UserMapper.kakaoLogin", user);
	}
*/
	@Override
	public int getTotalCount(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("UserMapper.getTotalCount", search);
	}
	

}
