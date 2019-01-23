package com.wthealth.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
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
	
	@RequestMapping(value = "json/deposit", method = RequestMethod.POST)
	public String deposit(HttpSession session, HttpServletRequest request, Model model) throws Exception{
		System.out.println("/authorizeAccount : POST");
		
		String userId = ((User)session.getAttribute("user")).getUserId();
		User user = userService.getUser(userId);
		session.setAttribute("user", user);
		
		Map<String, Object> accessToken = refundService.getAccessToken(); //token 획득
		refundService.deposit((String)accessToken.get("access_token"), "84860204104911", 9404162, "004"); //입력되있는 파라미터와 유저가 입력한 정보가 같으면 됨..
		//refundService.getAccount((String)accessToken.get("access_token"), (String)request.getAttribute("accountNum"), (int)request.getAttribute("dateOfBirth"),(String)request.getAttribute("bankCode"));
		
		Refund refund = new Refund();
		refund.setHolder((String)request.getAttribute("holder")); //예금주명 저장
		refund.setUserId(userId);
		refund.setRefundStatus("1"); //환급 완료
		
		model.addAttribute("refund", refund);
		
		return "redirect:/refund/listRefund";
		
	}
}
