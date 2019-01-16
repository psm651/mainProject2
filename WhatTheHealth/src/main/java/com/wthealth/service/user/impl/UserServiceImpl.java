package com.wthealth.service.user.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.wthealth.common.Search;
import com.wthealth.domain.User;
import com.wthealth.service.user.UserDao;
import com.wthealth.service.user.UserService;

@Service("userServiceImpl")
public class UserServiceImpl implements UserService{
	
	///Field
	@Autowired
	@Qualifier("userDaoImpl")
	private UserDao userDao;
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public UserServiceImpl() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	///Method
	public void addUser(User user) throws Exception {
		userDao.addUser(user);
	}

	public User getUser(String userId) throws Exception {
		return userDao.getUser(userId);
	}

	public void updateUser(User user) throws Exception {
		userDao.updateUser(user);
	}

	@Override
	public void deleteUser(User user) throws Exception {
		// TODO Auto-generated method stub
		userDao.deleteUser(user);
	}

	@Override
	public User findId(String nickName) throws Exception {
		// TODO Auto-generated method stub
		return userDao.findId(nickName);
	}

	@Override
	public void findPassword(User user) throws Exception {
		// TODO Auto-generated method stub
		userDao.findPassword(user);
	}

	@Override
	public void snsLogin(User user) throws Exception {
		// TODO Auto-generated method stub
		userDao.snsLogin(user);
	}
/*
	@Override
	public void kakaoLogin(User user) throws Exception {
		// TODO Auto-generated method stub
		userDao.kakaoLogin(user);
	}*/

	@Override
	public boolean checkId(String userId) throws Exception {
		// TODO Auto-generated method stub
		boolean result=true;
		User user=userDao.getUser(userId);
		if(user != null) {
			result=false;
		}
		return result;
	}

	@Override
	public boolean checkNickname(String nickName) throws Exception {
		// TODO Auto-generated method stub
		boolean result=true;
		User user=userDao.findId(nickName);
		if(user != null) {
			result=false;
		}
		return result;
	}
	

	/*public boolean checkDuplication(String userId) throws Exception {
		boolean result=true;
		User user=userDao.getUser(userId);
		if(user != null) {
			result=false;
		}
		return result;
	}*/

	@Override
	public void updateHavingPoint(User user) throws Exception {
		// TODO Auto-generated method stub
		userDao.updateHavingPoint(user);
	}

	@Override
	public void updateAccount(User user) throws Exception {
		// TODO Auto-generated method stub
		userDao.updateAccount(user);
	}

}
