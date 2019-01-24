package com.wthealth.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.wthealth.domain.Refund;
import com.wthealth.service.refund.RefundService;

@RestController
@RequestMapping("/refund/*")
public class RefundRestController {

	@Autowired
	@Qualifier("refundServiceImpl")
	private RefundService refundService;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	public RefundRestController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value = "json/updateRefundStatus/{refundNo}", method = RequestMethod.GET)
	public Refund updateRefundStatus(@ModelAttribute Refund refund, @PathVariable int refundNo) throws Exception{
		System.out.println("/refund/json/updateRefundStatus : GET");
		
		refund.setRefundNo(refundNo);
		refundService.updateRefund(refund);
		
		return refundService.getRefund(refundNo);
		
	}
}
