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
 * ㅇ JUnit4 (Test Framework) 과 Spring Framework 통합 Test( Unit Test)
 * ㅇ Spring 은 JUnit 4를 위한 지원 클래스를 통해 스프링 기반 통합 테스트 코드를 작성 할 수 있다.
 * ㅇ @RunWith : Meta-data 를 통한 wiring(생성,DI) 할 객체 구현체 지정
 * ㅇ @ContextConfiguration : Meta-data location 지정
 * ㅇ @Test : 테스트 실행 소스 지정
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
		"classpath:config/context-aspect.xml",
		"classpath:config/context-mybatis.xml",
		"classpath:config/context-transaction.xml" })
public class SocketServiceTest {

	//==>@RunWith,@ContextConfiguration 이용 Wiring, Test 할 instance DI
	@Autowired
	@Qualifier("socketServiceImpl")
	private SocketService socketService;

	@Test
	public void testAddLiveStream() throws Exception {
		
		Socket socket = new Socket();
		
		socket.setBjId("user2");
		socket.setLiveTitle("차가운 란라니");
		socket.setLiveType("0");

		
		socketService.addLiveStream(socket);
		socket = socketService.getLiveStream(socket.getSocketNo());
		//==> console 확인
		System.out.println(socket);
		
		//==> API 확인
		Assert.assertEquals("user2", socket.getBjId());
		Assert.assertEquals("차가운 란라니", socket.getLiveTitle());
		Assert.assertEquals("0", socket.getLiveType());
	}
	
	//@Test
	public void testGetLiveStream() throws Exception {
		Socket socket = new Socket();
		
		socket = socketService.getLiveStream(10000);
			
		//==> console 확인
		System.out.println(socket);
					
		//==> API 확인
		Assert.assertEquals(10000, socket.getSocketNo());
		Assert.assertEquals("란블리의 라방 대잔치!", socket.getLiveTitle());
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
	 	
	 	//==> console 확인
	 	System.out.println(list);
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println("product list all 토탈카운드 : "+totalCount);
	 	
	 	System.out.println("=======================================");
	 	
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	search.setSearchCondition("1");
	 	search.setSearchKeyword("호란블리");
	 	map = socketService.listLiveStream(search);
	 	
	 	list = (List<Object>)map.get("list");
	 	Assert.assertEquals(3, list.size());
	 	
	 	//==> console 확인
	 	System.out.println("product list all 리스트 : "+list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println("product list all 3개 당 리스트 갯수 : "+totalCount);
	}
	 
}