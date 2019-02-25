package com.wthealth.controller;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	@RequestMapping(value= "addRefund", method = RequestMethod.GET)
	public String addRefund() throws Exception{
		System.out.println("/addRefund : GET");
		
		return "forward:/refund/addRefund.jsp";
	}
	
	@RequestMapping(value= "addRefund", method = RequestMethod.POST)
	public String addRefund(@ModelAttribute("refund")Refund refund, HttpSession session) throws Exception{
		System.out.println("/addRefund : POST");
		
		User user = (User)session.getAttribute("user");
		refund.setUserId(user.getUserId());
		
		refundService.addRefund(refund);
		
		return "redirect:/refund/listRefund";
	}
	
	@RequestMapping( value="listRefund" )
	public String listRefund( @ModelAttribute("search") Search search , Model model , HttpServletRequest request, HttpSession session) throws Exception{
		
		System.out.println("/refund/listRefund : GET / POST");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		String userId = ((User)session.getAttribute("user")).getUserId();
		
		// Business logic 占쏙옙占쏙옙
		Map<String , Object> map = refundService.listRefund(search,userId);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model 占쏙옙 View 占쏙옙占쏙옙
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/refund/listRefund.jsp";
	}
	
	@RequestMapping( value="listRefundAdmin" )
	public String listRefundAdmin( @ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
		
		System.out.println("/refund/listRefundAdmin : GET / POST");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic 占쏙옙占쏙옙
		Map<String , Object> map = refundService.listRefundAdmin(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model 占쏙옙 View 占쏙옙占쏙옙
		model.addAttribute("listAdmin", map.get("listAdmin"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/refund/listRefundAdmin.jsp";
	}
	
	
	
	/*@RequestMapping(value = "deposit")
	public String deposit(HttpSession session, HttpServletRequest request, Model model) throws Exception{
		System.out.println("/deposit : POST");
		
		String userId = ((User)session.getAttribute("user")).getUserId();
		User user = userService.getUser(userId);
		session.setAttribute("user", user);
		
		Map<String, Object> accessToken = refundService.getAccessToken(); //token 획占쏙옙
		refundService.deposit((String)accessToken.get("access_token"), "84860204104911", 9404162, "004"); //占쌉력듸옙占쌍댐옙 占식띰옙占쏙옙沽占� 占쏙옙占쏙옙占쏙옙 占쌉뤄옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙..
		//refundService.getAccount((String)accessToken.get("access_token"), (String)request.getAttribute("accountNum"), (int)request.getAttribute("dateOfBirth"),(String)request.getAttribute("bankCode"));
		
		Refund refund = new Refund();
		refund.setHolder((String)request.getAttribute("holder")); //占쏙옙占쏙옙占쌍몌옙 占쏙옙占쏙옙
		refund.setUserId(userId);
		refund.setRefundStatus("1"); //환占쏙옙 占싹뤄옙
		
		model.addAttribute("refund", refund);
		
		return "redirect:/refund/listRefund";
		
	}
	*/
}
