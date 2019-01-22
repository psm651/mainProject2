package com.wthealth.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wthealth.common.Page;
import com.wthealth.common.Search;
import com.wthealth.common.URLConnection;
import com.wthealth.domain.Refund;
import com.wthealth.domain.User;
import com.wthealth.service.refund.RefundService;
import com.wthealth.service.user.UserService;

@Controller
@RequestMapping("/refund/*")
public class RefundController {

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
	
	public RefundController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping( value="listRefund" )
	public String listRefund( @ModelAttribute("search") Search search , Model model , HttpServletRequest request, HttpSession session) throws Exception{
		
		System.out.println("/refund/listRefund : GET / POST");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		String userId = ((User)session.getAttribute("user")).getUserId();
		
		// Business logic 수행
		Map<String , Object> map = refundService.listRefund(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/refund/listRefund.jsp";
	}
	
	@RequestMapping(value = "authorizeAccount")
	public String authorizeAccount(HttpSession session, Model model, HttpServletRequest request) throws Exception{
		System.out.println("/authorizeAccount : POST");
		//model.addAttribute("refund", refund);
		//System.out.println("refund:"+refund);
		
		String userId = ((User)session.getAttribute("user")).getUserId();
		User user = userService.getUser(userId);
		session.setAttribute("user", user);
		
		Map<String, Object> accessToken = refundService.getAccessToken(); //token 획득
		refundService.getAccount((String)accessToken.get("access_token"), "84860204104911", 9404162, 004); //입력되있는 파라미터와 유저가 입력한 정보가 같으면 됨..
		//refundService.getAccount((String)accessToken.get("access_token"), (int)request.getAttribute("accountNum"), (int)request.getAttribute("holder"),(int)request.getAttribute("bankCode"));
		
		
		return "redirect:/refund/listRefund";
		
	}
	
}
