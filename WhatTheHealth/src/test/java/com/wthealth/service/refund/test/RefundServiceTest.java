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
 * �� JUnit4 (Test Framework) �� Spring Framework ���� Test( Unit Test)
 * �� Spring �� JUnit 4�� ���� ���� Ŭ������ ���� ������ ��� ���� �׽�Ʈ �ڵ带 �ۼ� �� �� �ִ�.
 * �� @RunWith : Meta-data �� ���� wiring(����,DI) �� ��ü ����ü ����
 * �� @ContextConfiguration : Meta-data location ����
 * �� @Test : �׽�Ʈ ���� �ҽ� ����
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/context-common.xml", "classpath:config/context-aspect.xml",
		"classpath:config/context-mybatis.xml", "classpath:config/context-transaction.xml" })
public class RefundServiceTest {

	// ==>@RunWith,@ContextConfiguration �̿� Wiring, Test �� instance DI
		@Autowired
		@Qualifier("refundServiceImpl")
		private RefundService refundService;
		
		@Test
		public void testAddRefund() throws Exception{
			
			Refund refund = new Refund();
			
			refund.setRefundNo(10004);
			refund.setAccountNum(123456);
			refund.setBankName("��Ʈ����");
			refund.setHolder("����");
			refund.setRefundMoney(10000);
			
			refundService.addRefund(refund);
			
			System.out.println(refund);
			
			Assert.assertEquals(10004, refund.getRefundNo());
			Assert.assertEquals(123456, refund.getAccountNum());
			Assert.assertEquals("��Ʈ����", refund.getBankName());
			Assert.assertEquals("����", refund.getHolder());
			Assert.assertEquals(10000, refund.getRefundMoney());
			
		}
}
