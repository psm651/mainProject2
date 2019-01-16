package com.wthealth.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wthealth.service.refund.RefundService;

@Controller
@RequestMapping("/refund/*")
public class RefundController {

	@Autowired
	@Qualifier("refundServiceImpl")
	private RefundService refundService;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	public RefundController() {
		System.out.println(this.getClass());
	}
	
	
	
}
