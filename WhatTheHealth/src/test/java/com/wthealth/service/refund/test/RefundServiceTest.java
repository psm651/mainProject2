package com.wthealth.service.refund.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.wthealth.domain.Refund;
import com.wthealth.service.refund.RefundService;

import junit.framework.Assert;

/*
 *	FileName :  ExComServiceTest.java
 * ㅇ JUnit4 (Test Framework) 과 Spring Framework 통합 Test( Unit Test)
 * ㅇ Spring 은 JUnit 4를 위한 지원 클래스를 통해 스프링 기반 통합 테스트 코드를 작성 할 수 있다.
 * ㅇ @RunWith : Meta-data 를 통한 wiring(생성,DI) 할 객체 구현체 지정
 * ㅇ @ContextConfiguration : Meta-data location 지정
 * ㅇ @Test : 테스트 실행 소스 지정
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/context-common.xml", "classpath:config/context-aspect.xml",
		"classpath:config/context-mybatis.xml", "classpath:config/context-transaction.xml" })
public class RefundServiceTest {

	// ==>@RunWith,@ContextConfiguration 이용 Wiring, Test 할 instance DI
		@Autowired
		@Qualifier("refundServiceImpl")
		private RefundService refundService;
		
		@Test
		public void testAddRefund() throws Exception{
			
			Refund refund = new Refund();
			
			refund.setRefundNo(10004);
			refund.setAccountNum(123456);
			refund.setBankName("비트은행");
			refund.setHolder("정연");
			refund.setRefundMoney(10000);
			
			refundService.addRefund(refund);
			
			System.out.println(refund);
			
			Assert.assertEquals(10004, refund.getRefundNo());
			Assert.assertEquals(123456, refund.getAccountNum());
			Assert.assertEquals("비트은행", refund.getBankName());
			Assert.assertEquals("정연", refund.getHolder());
			Assert.assertEquals(10000, refund.getRefundMoney());
			
		}
}
