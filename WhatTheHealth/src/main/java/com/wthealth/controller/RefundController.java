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
		
		// Business logic ����
		Map<String , Object> map = refundService.listRefund(search,userId);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model �� View ����
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
		
		// Business logic ����
		Map<String , Object> map = refundService.listRefundAdmin(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model �� View ����
		model.addAttribute("listAdmin", map.get("listAdmin"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/refund/listRefundAdmin.jsp";
	}
	
	@RequestMapping(value = "authorizeAccount")
	public String authorizeAccount(HttpSession session, HttpServletRequest request, @ModelAttribute("refund") Refund refund) throws Exception{
		System.out.println("/authorizeAccount : POST");
		//System.out.println("refund:"+refund);
		
		String userId = ((User)session.getAttribute("user")).getUserId();
		User user = userService.getUser(userId);
		session.setAttribute("user", user);
		
		String bankCode = refundService.getBankCode(refund.getBankName());
		System.out.println("bankCode"+bankCode);
		
		Map<String, Object> accessToken = refundService.getAccessToken(); //token ȹ��
		refundService.getAccount((String)accessToken.get("access_token"), refund.getAccountNum(), refund.getDateOfBirth(), bankCode);
		//refundService.getAccount((String)accessToken.get("access_token"), "84860204104911", 9404162, "004"); //�Էµ��ִ� �Ķ���Ϳ� ������ �Է��� ������ ������ ��..
		//refundService.getAccount((String)accessToken.get("access_token"), (String)request.getAttribute("accountNum"), (int)request.getAttribute("dateOfBirth"),(String)request.getAttribute("bankCode"));
		
		refund.setHolder((String)request.getAttribute("holder")); //�����ָ� ����
		refund.setUserId(userId);
		
		return "redirect:/refund/listRefund";
		
	}
	
	/*@RequestMapping(value = "deposit")
	public String deposit(HttpSession session, HttpServletRequest request, Model model) throws Exception{
		System.out.println("/deposit : POST");
		
		String userId = ((User)session.getAttribute("user")).getUserId();
		User user = userService.getUser(userId);
		session.setAttribute("user", user);
		
		Map<String, Object> accessToken = refundService.getAccessToken(); //token ȹ��
		refundService.deposit((String)accessToken.get("access_token"), "84860204104911", 9404162, "004"); //�Էµ��ִ� �Ķ���Ϳ� ������ �Է��� ������ ������ ��..
		//refundService.getAccount((String)accessToken.get("access_token"), (String)request.getAttribute("accountNum"), (int)request.getAttribute("dateOfBirth"),(String)request.getAttribute("bankCode"));
		
		Refund refund = new Refund();
		refund.setHolder((String)request.getAttribute("holder")); //�����ָ� ����
		refund.setUserId(userId);
		refund.setRefundStatus("1"); //ȯ�� �Ϸ�
		
		model.addAttribute("refund", refund);
		
		return "redirect:/refund/listRefund";
		
	}
	*/
}
