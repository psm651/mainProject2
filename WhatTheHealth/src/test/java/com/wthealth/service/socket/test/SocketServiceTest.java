package com.wthealth.service.socket.test;

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
import com.wthealth.domain.Socket;
import com.wthealth.service.socket.SocketService;


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
public class SocketServiceTest {

	//==>@RunWith,@ContextConfiguration �̿� Wiring, Test �� instance DI
	@Autowired
	@Qualifier("socketServiceImpl")
	private SocketService socketService;

	@Test
	public void testAddLiveStream() throws Exception {
		
		Socket socket = new Socket();
		
		socket.setBjId("user2");
		socket.setLiveTitle("������ �����");
		socket.setLiveType("0");

		
		socketService.addLiveStream(socket);
		socket = socketService.getLiveStream(socket.getSocketNo());
		//==> console Ȯ��
		System.out.println(socket);
		
		//==> API Ȯ��
		Assert.assertEquals("user2", socket.getBjId());
		Assert.assertEquals("������ �����", socket.getLiveTitle());
		Assert.assertEquals("0", socket.getLiveType());
	}
	
	//@Test
	public void testGetLiveStream() throws Exception {
		Socket socket = new Socket();
		
		socket = socketService.getLiveStream(10000);
			
		//==> console Ȯ��
		System.out.println(socket);
					
		//==> API Ȯ��
		Assert.assertEquals(10000, socket.getSocketNo());
		Assert.assertEquals("������ ��� ����ġ!", socket.getLiveTitle());
		Assert.assertEquals("0", socket.getLiveType());
	}
	
	//@Test
	public void testDeleteLive() throws Exception {
		Socket socket = socketService.getLiveStream(10000);
		Assert.assertNotNull(socket);
		
		socketService.deleteLiveStream(10000);
		socket = socketService.getLiveStream(10000);
		Assert.assertEquals("0", socket.getLiveStatus());
	}

	//@Test
	public void testListLiveStream() throws Exception {
		Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	
	 	Map<String,Object> map = socketService.listLiveStream(search);
	 	List<Object> list = (List<Object>)map.get("list");
	 	Assert.assertEquals(3, list.size());
	 	
	 	//==> console Ȯ��
	 	System.out.println(list);
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println("product list all ��Żī��� : "+totalCount);
	 	
	 	System.out.println("=======================================");
	 	
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	search.setSearchCondition("1");
	 	search.setSearchKeyword("ȣ����");
	 	map = socketService.listLiveStream(search);
	 	
	 	list = (List<Object>)map.get("list");
	 	Assert.assertEquals(3, list.size());
	 	
	 	//==> console Ȯ��
	 	System.out.println("product list all ����Ʈ : "+list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println("product list all 3�� �� ����Ʈ ���� : "+totalCount);
	}
	 
}