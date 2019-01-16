package com.wthealth.service.point.test;

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
import com.wthealth.domain.Point;
import com.wthealth.domain.User;
import com.wthealth.service.point.PointService;


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

public class PointServiceTest {

	@Autowired
	@Qualifier("pointServiceImpl")
	private PointService pointService;
	
	//@Test
	public void testAddPoint() throws Exception{
		
		Point point = new Point();
		point.setUsingPoint(100);
		point.setSenderId("JUnit");
		
		pointService.addPoint(point);
		
		point = pointService.getPoint(10003);
		
		System.out.println(point);
		
		Assert.assertEquals("JUnit", point.getSenderId());
		Assert.assertEquals("0", point.getPointStatus());
		Assert.assertEquals(100, point.getUsingPoint());
		
	}
	
	//@Test
	public void testUpdatePoint() throws Exception{
		
		Point point = new Point();
		point.setUsingPoint(500);
		point.setSenderId("JUnit");
		point.setReceiverId("user1");
		point.setPointStatus("2");
		
		pointService.updatePoint(point);
		
		point = pointService.getPoint(10004);
		
		System.out.println(point);
		
		Assert.assertEquals("JUnit", point.getSenderId());
		Assert.assertEquals("2", point.getPointStatus());
		Assert.assertEquals("user1", point.getReceiverId());
	}
	
	@Test
	public void testListPoint() throws Exception{
		
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);
		search.setSearchFilter("1");
		
		User user = new User();
		user.setUserId("user1");
		String senderId = user.getUserId();
		System.out.println(senderId);
		
		Map<String,Object> map = pointService.listPoint(search, senderId);
		
		List<Object> list = (List<Object>)map.get("list");
		Assert.assertEquals(2, list.size());
		
		System.out.println(list);
		
		Integer totalCount = (Integer)map.get("totalCount");
		System.out.println(totalCount);
	
	}

}
