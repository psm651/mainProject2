package com.wthealth.service.adminmanage.test;

import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.wthealth.common.Search;
import com.wthealth.domain.User;
import com.wthealth.service.adminmanage.AdminManageService;



	@RunWith(SpringJUnit4ClassRunner.class)


	@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
			"classpath:config/context-aspect.xml",
			"classpath:config/context-mybatis.xml",
			"classpath:config/context-transaction.xml" })
	public class AdminManageTest {

		//==>@RunWith,@ContextConfiguration ÀÌ¿ë Wiring, Test ÇÒ instance DI
		@Autowired
		@Qualifier("adminManageServiceImpl")
		private AdminManageService adminManageService;

//		@Test
		public void testgetAdminManage() throws Exception{
			
			//getUser
			
			User user = new User();
			user.setUserId("user3");
			
		
			user = adminManageService.getAdminManage(user.getUserId());
			
			System.out.println(user);
			//user_id, nickname, email, user_phone, user_image,
			//	having_point, holder, bank_name, account_num, user_status_code
			Assert.assertEquals("user3", user.getUserId());
			Assert.assertEquals("userduser", user.getNickName());
			Assert.assertEquals(null, user.getEmail());
			Assert.assertEquals(null, user.getPhone());
			Assert.assertEquals(null, user.getUserImage());
			Assert.assertEquals(null, user.getPhone());
			Assert.assertEquals(0, user.getHavingPoint());
		
		}
//		@Test
		public void testupdateAdminManage() throws Exception{
			
			//getUser
			
			User user = new User();
			user.setUserId("user3");
			user.setPassword("0000");
			user.setNickName("±è±è±è");
			user.setEmail("bbbbb");
			user.setGender("1");
				
	
		    adminManageService.updateUserAdminManage(user);
			
		
		}		
		
		
//	@Test
		public void testlistUserAdminManage() throws Exception {
			
			//Client Loading Test
			 
			Search search = new Search();
			search.setCurrentPage(1);
			search.setPageSize(1);
			search.setSearchCondition("0");
			search.setSearchKeyword("adm");
			Map<String, Object> map = adminManageService.listUserAdminManage(search);
			
			List<User> list = (List<User>)map.get("list");
			
			Assert.assertEquals(1, list.size());	
			
			System.out.println(list.size());
			
			Integer totalCount = (Integer)map.get("totalCount");
			System.out.println("totalCount : "+totalCount);
		
			System.out.println(list.size());
			
			System.out.println("////////////////////////////////////");

			//SearchCondition :: ¾ÆÀÌµð  SearchKeyword :: use
			search.setCurrentPage(1);
			search.setPageSize(3);
			search.setSearchCondition("0");
			search.setSearchKeyword("use");
			search.setSearchFilter("0");
			map = adminManageService.listUserAdminManage(search);
			
			list = (List<User>)map.get("list");
			Assert.assertEquals(3, list.size());
			
			totalCount = (Integer) map.get("totalCount");
			System.out.println(totalCount);
			
			
			System.out.println(list.size());
			
		}
		
		@Test
		public void testlistPointAdminManage() throws Exception {
			
			//Client Loading Test			 
			Search search = new Search();
			search.setCurrentPage(1);
			search.setPageSize(1);
			Map<String, Object> map = adminManageService.listPointAdminManage(search);
			
			List<Object> list = (List<Object>)map.get("list");
			
			Assert.assertEquals(1, list.size());	
			
			System.out.println(list.size());
			
			Integer totalCount = (Integer)map.get("totalCount");
			System.out.println("totalCount : "+totalCount);
		
			System.out.println(list.size());
			
			System.out.println("////////////////////////////////////");

			//SearchKeyword :: ¾ÆÀÌµð  SearchKeyword :: use
			search.setCurrentPage(1);
			search.setPageSize(3);
			search.setSearchKeyword("use");
			
			map = adminManageService.listPointAdminManage(search);
			
			list = (List<Object>)map.get("list");
			Assert.assertEquals(3, list.size());
			
			totalCount = (Integer) map.get("totalCount");
			System.out.println(totalCount);
			
			System.out.println(list.size());
			
		}		
		

}
