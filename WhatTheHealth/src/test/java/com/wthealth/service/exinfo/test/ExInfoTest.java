package com.wthealth.service.exinfo.test;

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
import com.wthealth.service.adminmanage.AdminManageService;
import com.wthealth.service.exinfo.ExInfoService;



	@RunWith(SpringJUnit4ClassRunner.class)


	@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
																		"classpath:config/context-aspect.xml",
																		"classpath:config/context-mybatis.xml",
																		"classpath:config/context-transaction.xml" })
	//@ContextConfiguration(locations = { "classpath:config/context-common.xml" })
	public class ExInfoTest {

		//==>@RunWith,@ContextConfiguration 占싱울옙 Wiring, Test 占쏙옙 instance DI
		@Autowired
		@Qualifier("exInfoServiceImpl")
		private ExInfoService exInfoService;

		@Test
		public void testAdd() throws Exception{
			
			Post post = new Post();
			post.setUserId("admin");
			post.setNickName("tes3ttt");
			post.setTitle("占쏙옙占쌘곤옙占쏙옙");
			post.setVideo("video.video");
			post.setContents("占싱뱄옙占쏙옙占쏙옙占쏙옙 占싱뤄옙占쏙옙 占쏙옙占쏙옙 占싯뤄옙占썲립占싹댐옙.占쏙옙占쏙옙占쌕라마바삼옙占쏙옙占쏙옙占식� 타占쏙옙占쏙옙");
			post.setPhoto("wwww.wwwww");
			post.setCategory("1");
			post.setDeleteStatus("0");
			post.setLikeCount(100);
			
			//exInfo 占쌉시뱄옙 占쏙옙占� 
			post.setExCalorie(755);
			post.setExPlace("0");
			post.setExPart("3");
			post.setExVideoTime("15:15");
			
			
		
			exInfoService.addExInfo(post);
			System.out.println("占쏙옙占쏙옙 占쏙옙 : "+post.getExInfoNo());
			
			String postNo = "EI"+post.getExInfoNo();
		//	post.setPostNo(postNo);
			
			Assert.assertEquals(755, post.getExCalorie());
			Assert.assertEquals("0", post.getExPlace());
			Assert.assertEquals("3", post.getExPart());
			Assert.assertEquals("15:15", post.getExVideoTime());
			
			Assert.assertEquals("", post.getTitle());
			Assert.assertEquals("video.video", post.getVideo());
			Assert.assertEquals("", post.getContents());
			Assert.assertEquals("wwww.wwwww", post.getPhoto());
			Assert.assertEquals("0", post.getCategory());
			Assert.assertEquals("0", post.getExPlace());
			Assert.assertEquals("3", post.getExPart());
			Assert.assertEquals("15:15", post.getExVideoTime());
	
		
		}
		
//		@Test
		public void testUpdatePost() throws Exception{
			
			Post post = new Post();
			
			//post 占쌉시뱄옙 占쏙옙占쏙옙
			post.setPostNo(10018);
			post.setTitle("");
			post.setVideo("");
			post.setContents("");
			post.setPhoto("");
			post.setCategory("3");
			
//			exInfoService.updatePost(post);
			
//			Assert.assertEquals("占쏙옙占쏙옙", post.getTitle());
//			Assert.assertEquals("占쏙옙占쏙옙", post.getVideo());
//			Assert.assertEquals("占쏙옙占쏙옙", post.getContents());
//			Assert.assertEquals("占쏙옙占쏙옙", post.getPhoto());	
//			Assert.assertEquals("3", post.getCategory());	
			
		}
//		@Test
		public void testUpdateExInfo() throws Exception{
		
			Post post = new Post();
			//exInfo  
			post.setPostNo(10018);
			post.setExCalorie(8888);
			post.setExPlace("3");
			post.setExPart("3");
			post.setExVideoTime("18:15");
			
			
			//exInfo service 
			exInfoService.updateExInfo(post);
			
			Assert.assertEquals(8888, post.getExCalorie());
			Assert.assertEquals("3", post.getExPlace());
			Assert.assertEquals("3", post.getExPart());
			Assert.assertEquals("18:15", post.getExVideoTime());
			
		}		
		
		

//		@Test
		public void testgetExInfo() throws Exception{
			
			Post post = new Post();
			
		//	post = exInfoService.getExInfo("EI10005");
			
			System.out.println(post);
			
			Assert.assertEquals("", post.getTitle());
			Assert.assertEquals("0", post.getExPart());
			Assert.assertEquals("16:07占쏙옙", post.getExVideoTime());
			
		}
		
		@Test
		public void testlistExInfo() throws Exception{
			
			//client loading
			Search search = new Search();
			search.setCurrentPage(1);
			search.setPageSize(3);
			
			Map<String, Object> map = exInfoService.listExInfo(search);
			
			List<Post> list = (List<Post>) map.get("list");
			
			System.out.println(list);
			
			Assert.assertEquals(3, list.size());

			Integer totalCount = (Integer)map.get("totalCount");
			System.out.println("totalCount : "+totalCount);
			
			
			search.setCurrentPage(1);
			search.setPageSize(3);
			search.setSearchCondition("0");
			search.setSearchKeyword("");
			search.setSearchFilter("3");
			
			map = exInfoService.listExInfo(search);
			
			list = (List<Post>)map.get("list");
			Assert.assertEquals(3, list.size());
			totalCount = (Integer) map.get("totalCount");
			System.out.println(totalCount);
			
			
			System.out.println(list.size());
		}		
		
}
