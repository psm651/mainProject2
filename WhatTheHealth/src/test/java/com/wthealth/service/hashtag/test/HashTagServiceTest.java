package com.wthealth.service.hashtag.test;

import java.util.ArrayList;
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
import com.wthealth.domain.HashTag;
import com.wthealth.service.hashtag.HashTagService;

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
public class HashTagServiceTest {

	//==>@RunWith,@ContextConfiguration �̿� Wiring, Test �� instance DI
	@Autowired
	@Qualifier("hashTagServiceImpl")
	private HashTagService hashTagService;

	@Test
	public void testAddHashTag() throws Exception {
		
		HashTag hashTag1 = new HashTag();
		hashTag1.setHashTag("#�л�");
		hashTag1.setPostNo("ME10023");
		
		HashTag hashTag2 = new HashTag();
		hashTag2.setHashTag("#�л�");
		hashTag2.setPostNo("EI10025");
		
		HashTag hashTag3 = new HashTag();
		hashTag3.setHashTag("#�л�");
		hashTag3.setPostNo("EC10020");
		
		
		List<HashTag> hashTag =new ArrayList<HashTag>();
		hashTag.add(hashTag1);
		hashTag.add(hashTag2);
		hashTag.add(hashTag3);
		
		for (int j = 0; j < hashTag.size(); j++) {
			hashTagService.addHashTag(hashTag.get(j));

		}
		//==> console Ȯ��
		System.out.println("test��"+hashTag);
		
		//==> API Ȯ��
		Assert.assertEquals("�л�", hashTag.get(0).getHashTag());
		Assert.assertEquals("EI10025", hashTag.get(1).getPostNo());
	}

	//@Test
/*	public void testGetProduct() throws Exception {
		
		Product product = new Product();
		//==> �ʿ��ϴٸ�...
		//user.setUserId("testUserId");
		//user.setUserName("testUserName");
		//user.setPassword("testPasswd");
		//user.setSsn("1111112222222");
		//user.setPhone("111-2222-3333");
		//user.setAddr("��⵵");
		//user.setEmail("test@test.com");
		
		product = productService.getProduct(10066);

		//==> console Ȯ��
		System.out.println(product);
		
		//==> API Ȯ��
		
		Assert.assertEquals("testProductName", product.getProdName());
		Assert.assertEquals("testProdDetail", product.getProdDetail());
		Assert.assertEquals("20181018", product.getManuDate());
		Assert.assertEquals(1000000, product.getPrice());
		Assert.assertEquals("testProductFile", product.getFileName());

		Assert.assertNotNull(productService.getProduct(10020));
		Assert.assertNotNull(productService.getProduct(10021));
		
	}
	*/
	
	//@Test
	 public void testUpdateHashTag() throws Exception{
		 
		HashTag hashTag1 = new HashTag();
		hashTag1.setHashTag("����");
		hashTag1.setPostNo("DC10000");

		
		HashTag hashTag2 = new HashTag();
		hashTag2.setHashTag("����");
		hashTag2.setPostNo("DC10000");

		
		HashTag hashTag3 = new HashTag();
		hashTag3.setHashTag("����");
		hashTag3.setPostNo("DC10000");

		
		
		
		List<HashTag> hashTag =new ArrayList<HashTag>();
		hashTag.add(hashTag1);
		hashTag.add(hashTag2);
		hashTag.add(hashTag3);
		hashTagService.updateHashTag(hashTag);
		/*for (int j = 0; j < hashTag.size(); j++) {
			hashTag.get(j).setPostNo("DC10000");
			hashTagService.updateHashTag(hashTag.get(j));

		}*/
		//==> console Ȯ��
		System.out.println("test��"+hashTag);
		
		//==> API Ȯ��
		Assert.assertEquals("����", hashTag.get(0).getHashTag());
		Assert.assertEquals("DC10000", hashTag.get(1).getPostNo());
		
		}
	
	 
	 
	 
	 //==>  �ּ��� Ǯ�� �����ϸ�....
	// @Test
	 public void testListHashTag() throws Exception{
		 
	 	Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(5);
	 	search.setSearchKeyword("�л�");
	 	Map<String,Object> map = hashTagService.listHashTag(search);
	 	
	 	List<Object> list = (List<Object>)map.get("list");
	 	Assert.assertEquals(4, list.size());
	 	
		//==> console Ȯ��
	 	/*
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	search.setSearchCondition("0");
	 	search.setSearchKeyword("");
	 	search.setSearchFilter("1");
	 	map = claimService.listClaim(search);
	 	*/
	 	
	 	//==> console Ȯ��
	 	System.out.println("product list all ����Ʈ : "+list);
	 	
	 }
	 
	 /*
	//@Test
		 public void testGetProductListByProductN0() throws Exception{
			 
		 	Search search = new Search();
		 	search.setCurrentPage(1);
		 	search.setPageSize(3);
		 	search.setSearchCondition("0");
		 	search.setSearchKeyword("10042");
		 	Map<String,Object> map = productService.getProductList(search);
		 	
		 	List<Object> list = (List<Object>)map.get("list");
		 	Assert.assertEquals(1, list.size());
		 	
			//==> console Ȯ��
		 	System.out.println(list);
		 	
		 	Integer totalCount = (Integer)map.get("totalCount");
		 	System.out.println(totalCount);
		 	
		 	System.out.println("=======================================");
		 	
		 	//search.setSearchCondition("1");
		 	//search.setSearchKeyword("��ǰ");	//����ð� �� �Է�?
		 	//map = productService.getProductList(search);
		 	
		 	//list = (List<Object>)map.get("list");
		 	//Assert.assertEquals(3, list.size());
		 	
			//==> console Ȯ��
		 	//System.out.println(list);
		 	
		 	//totalCount = (Integer)map.get("totalCount");
		 	//System.out.println(totalCount);
		 }
	 
	 @Test
	 public void testGetProductListByProductName() throws Exception{
		 
	 	Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	search.setSearchCondition("1");
	 	search.setSearchKeyword("�䳢");
	 	search.setSearchPriceCondition("1");
	 	Map<String,Object> map = productService.getProductList(search);
	 	
	 	List<Object> list = (List<Object>)map.get("list");
	 	//Assert.assertEquals(1, list.size());
	 	
		//==> console Ȯ��
	 	System.out.println(list);
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 	
	 	System.out.println("=======================================");
	 	
	 	search.setSearchCondition("0");
	 	search.setSearchKeyword(""+System.currentTimeMillis());	//����ð� �� �Է�?
	 	map = productService.getProductList(search);
	 	
	 	list = (List<Object>)map.get("list");
	 	Assert.assertEquals(0, list.size());
	 	
		//==> console Ȯ��
	 	System.out.println(list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 }
	 
	 //@Test
	 public void testGetProductListByPrice() throws Exception{
		 
	 	Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	search.setSearchCondition("2");
	 	search.setSearchKeyword("100");
	 	Map<String,Object> map = productService.getProductList(search);
	 	
	 	List<Object> list = (List<Object>)map.get("list");
	 	Assert.assertEquals(1, list.size());
	 	
		//==> console Ȯ��
	 	System.out.println(list);
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 	
	 	System.out.println("=======================================");
	 	
	 	search.setSearchCondition("1");
	 	search.setSearchKeyword(""+System.currentTimeMillis());
	 	map = productService.getProductList(search);
	 	
	 	list = (List<Object>)map.get("list");
	 	Assert.assertEquals(0, list.size());
	 	
		//==> console Ȯ��
	 	System.out.println(list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 }	 */
	 
}
