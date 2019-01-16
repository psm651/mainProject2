package com.wthealth.service.user.test;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.wthealth.domain.User;
import com.wthealth.service.user.UserService;


/*
 *	FileName :  UserServiceTest.java
 * �� JUnit4 (Test Framework) �� Spring Framework ���� Test( Unit Test)
 * �� Spring �� JUnit 4�� ���� ���� Ŭ������ ���� ������ ��� ���� �׽�Ʈ �ڵ带 �ۼ� �� �� �ִ�.
 * �� @RunWith : Meta-data �� ���� wiring(����,DI) �� ��ü ����ü ����
 * �� @ContextConfiguration : Meta-data location ����
 * �� @Test : �׽�Ʈ ���� �ҽ� ����
 */
@RunWith(SpringJUnit4ClassRunner.class)

@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
										"classpath:config/context-aspect.xml",
										"classpath:config/context-mybatis.xml",
										"classpath:config/context-transaction.xml" })

public class UserServiceTest {
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	//@Test
	public void testAddUser() throws Exception {
			
		User user = new User();
		user.setUserId("JUnit");
		user.setNickName("testUserName");
		user.setPassword("testPasswd");
		user.setGender("0");
		user.setPhone("111-2222-3333");
		user.setClaimCount(0);
		user.setEmail("test@test.com");
		
		userService.addUser(user);
			
		user = userService.getUser("JUnit");

		//==> console Ȯ��
		System.out.println(user);
			
		//==> API Ȯ��
		Assert.assertEquals("JUnit", user.getUserId());
		Assert.assertEquals("testUserName", user.getNickName());
		Assert.assertEquals("testPasswd", user.getPassword());
		Assert.assertEquals("111-2222-3333", user.getPhone());
		Assert.assertEquals("test@test.com", user.getEmail());
	}
	
	//@Test
	public void testAddNaverUser() throws Exception {
			
		User user = new User();
		user.setUserId("naverTest");
		user.setNickName("naver");
		user.setPassword("testPasswd");
		user.setGender("0");
		user.setPhone("010-000-0000");
		user.setEmail("test@naver.com");
		
		userService.snsLogin(user);
			
		user = userService.getUser("naverTest");

		//==> console Ȯ��
		System.out.println(user);
			
		//==> API Ȯ��
		Assert.assertEquals("naverTest", user.getUserId());
		Assert.assertEquals("naver", user.getNickName());
		Assert.assertEquals("testPasswd", user.getPassword());
		Assert.assertEquals("010-000-0000", user.getPhone());
		Assert.assertEquals("test@naver.com", user.getEmail());
	}
	
	//@Test
	public void testGetUser() throws Exception {
		
		User user = new User();
		
		user = userService.getUser("JUnit");

		//==> console Ȯ��
		System.out.println(user);
		
		//==> API Ȯ��
		Assert.assertEquals("JUnit", user.getUserId());
		Assert.assertEquals("testUserName", user.getNickName());
		Assert.assertEquals("testPasswd", user.getPassword());
		Assert.assertEquals("111-2222-3333", user.getPhone());
		Assert.assertEquals("test@test.com", user.getEmail());

		Assert.assertNotNull(userService.getUser("JUnit"));
		Assert.assertNotNull(userService.getUser("user1"));
	}
	
	//@Test
	public void testUpdateUser() throws Exception{
		 
		User user = userService.getUser("JUnit");
		Assert.assertNotNull(user);
		
		//==> API Ȯ��
		Assert.assertEquals("JUnit", user.getUserId());
		Assert.assertEquals("testUserName", user.getNickName());
		Assert.assertEquals("testPasswd", user.getPassword());
		Assert.assertEquals("111-2222-3333", user.getPhone());
		Assert.assertEquals("test@test.com", user.getEmail());


		user.setNickName("change");
		user.setPhone("777-7777-7777");
		user.setPassword("change");
		user.setEmail("change@change.com");
		
		userService.updateUser(user);
		
		user = userService.getUser("JUnit");
		Assert.assertNotNull(user);
		
		//==> console Ȯ��
		System.out.println(user);
			
		//==> API Ȯ��
		Assert.assertEquals("change", user.getNickName());
		Assert.assertEquals("777-7777-7777", user.getPhone());
		Assert.assertEquals("change", user.getPassword());
		Assert.assertEquals("change@change.com", user.getEmail());
	 }
	
	//@Test
	public void testDeleteUser() throws Exception{
		 
		User user = userService.getUser("JUnit");
		Assert.assertNotNull(user);
		
		//==> API Ȯ��
		Assert.assertEquals("JUnit", user.getUserId());
		Assert.assertEquals("change", user.getNickName());
		Assert.assertEquals("777-7777-7777", user.getPhone());
		Assert.assertEquals("change", user.getPassword());
		Assert.assertEquals("change@change.com", user.getEmail());

		userService.deleteUser(user);
		
		user = userService.getUser("JUnit");
		Assert.assertNotNull(user);
		
		//==> console Ȯ��
		System.out.println(user);
			
		//==> API Ȯ��
		Assert.assertEquals("1", user.getUserStatus());
	 }
	
	//@Test
	public void testFindUserId() throws Exception{
		 
		User user = userService.findId("name");
		Assert.assertNotNull(user);
		
		//==> API Ȯ��
		Assert.assertEquals("user2", user.getUserId());
		Assert.assertEquals("name", user.getNickName());
		
		//==> console Ȯ��
		System.out.println(user);
	}
	
	//@Test
	public void testFindUserPassword() throws Exception{
		 
		User user = userService.getUser("JUnit");
		Assert.assertNotNull(user);
		
		//==> API Ȯ��
		Assert.assertEquals("change", user.getNickName());
		Assert.assertEquals("777-7777-7777", user.getPhone());
		Assert.assertEquals("change", user.getPassword());
		Assert.assertEquals("change@change.com", user.getEmail());

		user.setPassword("passworddd");
		
		userService.findPassword(user);
		
		user = userService.getUser("JUnit");
		Assert.assertNotNull(user);
		
		//==> console Ȯ��
		System.out.println(user);
			
		//==> API Ȯ��
		Assert.assertEquals("passworddd", user.getPassword());
	 }
	
	//@Test
	public void testCheckId() throws Exception{

		//==> console Ȯ��
		System.out.println(userService.checkId("user1"));
		System.out.println(userService.checkId("user1"+System.currentTimeMillis()) );
	 	
		//==> API Ȯ��
		Assert.assertFalse( userService.checkId("user1") );
	 	Assert.assertTrue( userService.checkId("user1"+System.currentTimeMillis()) );
		 	
	}
	
	//@Test
	public void testCheckNickname() throws Exception{

		//==> console Ȯ��
		System.out.println(userService.checkNickname("testtt"));
		System.out.println(userService.checkNickname("testtt"+System.currentTimeMillis()) );
	 	
		//==> API Ȯ��
		Assert.assertFalse( userService.checkNickname("testtt") );
	 	Assert.assertTrue( userService.checkNickname("testtt"+System.currentTimeMillis()) );
		 	
	}
	
	//@Test
	public void testUpdatePoint() throws Exception{
		 
		User user = userService.getUser("JUnit");
		Assert.assertNotNull(user);
		
		//==> API Ȯ��
		Assert.assertEquals("JUnit", user.getUserId());
		Assert.assertEquals("change", user.getNickName());
		Assert.assertEquals(0, user.getHavingPoint());
		Assert.assertEquals("passworddd", user.getPassword());
		Assert.assertEquals("change@change.com", user.getEmail());
		
		user.setHavingPoint(1000);

		userService.updateHavingPoint(user);
		
		user = userService.getUser("JUnit");
		Assert.assertNotNull(user);
		
		//==> console Ȯ��
		System.out.println(user);
			
		//==> API Ȯ��
		Assert.assertEquals(1000, user.getHavingPoint());
	 }
	
	@Test
	public void testUpdateAccount() throws Exception{
		 
		User user = userService.getUser("JUnit");
		Assert.assertNotNull(user);
		
		//==> API Ȯ��
		Assert.assertEquals("JUnit", user.getUserId());
		Assert.assertNull(user.getAccountNum());
		Assert.assertNull(user.getBankName());
		Assert.assertNull(user.getHolder());
		
		user.setAccountNum("00000-000000");
		user.setBankName("����");
		user.setHolder("������");

		userService.updateAccount(user);
		
		user = userService.getUser("JUnit");
		Assert.assertNotNull(user);
		
		//==> console Ȯ��
		System.out.println(user);
			
		//==> API Ȯ��
		Assert.assertEquals("00000-000000", user.getAccountNum());
		Assert.assertEquals("����", user.getBankName());
		Assert.assertEquals("������", user.getHolder());
		
	 }

}