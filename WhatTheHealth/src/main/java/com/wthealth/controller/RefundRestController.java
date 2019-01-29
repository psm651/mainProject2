package com.wthealth.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.wthealth.domain.Refund;
import com.wthealth.domain.User;
import com.wthealth.service.refund.RefundService;
import com.wthealth.service.user.UserService;

@RestController
@RequestMapping("/refund/*")
public class RefundRestController {

	@Autowired
	@Qualifier("refundServiceImpl")
	private RefundService refundService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	public RefundRestController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value = "json/updateRefundStatus/{refundNo}", method = RequestMethod.GET)
	public Refund updateRefundStatus(@ModelAttribute Refund refund, @PathVariable int refundNo,
			@ModelAttribute User user, HttpSession session) throws Exception{
		System.out.println("/refund/json/updateRefundStatus : GET");
		
		refund = refundService.getRefund(refundNo);
				
		user = userService.getUser(refund.getUserId());
		int havingPoint = user.getHavingPoint() - refund.getRefundMoney();
		user.setHavingPoint(havingPoint);
		userService.updateHavingPoint(user);
		
		User admin = (User)session.getAttribute("user");
		int havingPointAdmin =admin.getHavingPoint() - - refund.getRefundMoney();
		admin.setHavingPoint(havingPointAdmin);
		userService.updateHavingPoint(admin);
		
		refundService.updateRefund(refund);
		
		return refundService.getRefund(refundNo);
		
	}
}
