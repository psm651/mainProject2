package com.wthealth.service.user;

import java.util.List;

import com.wthealth.common.Search;
import com.wthealth.domain.User;


public interface UserDao {
	
		// INSERT
		public void addUser(User user) throws Exception ;

		// SELECT ONE
		public User getUser(String userId) throws Exception ;

		// UPDATE
		public void updateUser(User user) throws Exception ;
		
		public void deleteUser(User user) throws Exception;
		
		public User findId(String nickName) throws Exception;
		
		public void findPassword(User user) throws Exception;
		
		public void snsLogin(User user) throws Exception;
		
		//public void kakaoLogin(User user) throws Exception;
		
		public void updateHavingPoint(User user) throws Exception;
		
		public void updateAccount(User user) throws Exception;
		
		// 게시판 Page 처리를 위한 전체Row(totalCount)  return
		public int getTotalCount(Search search) throws Exception ;
		
		
	

}
