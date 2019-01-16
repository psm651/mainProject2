package com.wthealth.service.main.test;

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
import com.wthealth.domain.Post;
import com.wthealth.service.main.MainService;



	@RunWith(SpringJUnit4ClassRunner.class)


	@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
																		"classpath:config/context-aspect.xml",
																		"classpath:config/context-mybatis.xml",
																		"classpath:config/context-transaction.xml" })
	//@ContextConfiguration(locations = { "classpath:config/context-common.xml" })
	public class Main {

		//==>@RunWith,@ContextConfiguration 이용 Wiring, Test 할 instance DI
		@Autowired
		@Qualifier("mainServiceImpl")
		private MainService mainService;

	
		@Test
		public void testlistExInfo() throws Exception{
			
			//client loading
			Search search = new Search();
			search.setCurrentPage(1);
			search.setPageSize(1);
			search.setSearchCondition("3");
			search.setSearchKeyword("해");
			
			Map<String, Object> map = mainService.listSearchMain(search);
			
			List<Post> list = (List<Post>) map.get("list");
			
			System.out.println(list);
			
			Assert.assertEquals(1, list.size());

			Integer totalCount = (Integer)map.get("totalCount");
			System.out.println("totalCount : "+totalCount);
			
			
	/*		search.setCurrentPage(1);
			search.setPageSize(3);
			search.setSearchCondition("0");
			search.setSearchKeyword("가");
			search.setSearchFilter("3");
			
			map = mainService.listSearchMain(search);
			
			list = (List<Post>)map.get("list");
			Assert.assertEquals(3, list.size());
			totalCount = (Integer) map.get("totalCount");
			System.out.println(totalCount);
			
			
			System.out.println(list.size());*/
		}		
		
}
