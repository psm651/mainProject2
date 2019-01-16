package com.wthealth.service.user;

import java.util.Map;

import com.wthealth.common.Search;
import com.wthealth.domain.User;

public interface UserService {
	
	// 회원가입
		public void addUser(User user) throws Exception;
		
		// 내정보확인 / 로그인
		public User getUser(String userId) throws Exception;
		
		// 회원정보수정
		public void updateUser(User user) throws Exception;
		
		public void deleteUser(User user) throws Exception;
		
		public User findId(String nickName) throws Exception;
		
		public void findPassword(User user) throws Exception;
		
		public void snsLogin(User user) throws Exception;
		
		//public void kakaoLogin(User user) throws Exception;
		
		public boolean checkId(String userId) throws Exception;
		
		public boolean checkNickname(String nickName) throws Exception;
		
		public void updateHavingPoint(User user) throws Exception;
		
		public void updateAccount(User user) throws Exception;
		
		/*// 회원 ID 중복 확인
		public boolean checkDuplication(String userId) throws Exception;*/
		

}
