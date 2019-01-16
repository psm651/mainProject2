package com.wthealth.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.wthealth.common.Page;
import com.wthealth.common.Search;
import com.wthealth.domain.Point;
import com.wthealth.domain.User;
import com.wthealth.service.point.PointService;
import com.wthealth.service.user.UserService;

@Controller
@RequestMapping("/point/*")
public class PointController {
	
	///Field
	@Autowired
	@Qualifier("pointServiceImpl")
	private PointService pointService;
	//setter Method 구현 않음
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	public PointController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping( value="listPoint" )
	public String listUser( @ModelAttribute("search") Search search , Model model , HttpServletRequest request, HttpSession session) throws Exception{
		
		System.out.println("/user/listPoint : GET / POST");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		String senderId = ((User)session.getAttribute("user")).getUserId();
		
		// Business logic 수행
		Map<String , Object> map = pointService.listPoint(search, senderId);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/point/listPoint.jsp";
	}
	
	@RequestMapping(value="updatePoint", method=RequestMethod.GET)
	public String updatePoint(@RequestParam("receiverId") String receiverId, Model model, HttpSession session) throws Exception{

		System.out.println("/point/updatePoint : GET");
		//Business Logic
		String senderId = ((User)session.getAttribute("user")).getUserId();
		
		Point point = new Point();
		point.setPointStatus("2");
		point.setSenderId(senderId);
		point.setReceiverId(receiverId);
		
		model.addAttribute("point", point);
		
		return "forward:/point/updatePoint.jsp";
	}
	
	@RequestMapping(value="updatePoint", method=RequestMethod.POST)
	public void updatePoint(@ModelAttribute("point") Point point, HttpServletRequest request, Model model ) throws Exception{

		System.out.println("/point/updatePoint : POST");
		//Business Logic
		pointService.updatePoint(point);
		
		User sendUser = userService.getUser(point.getSenderId());
		int sendPoint = sendUser.getHavingPoint() - point.getUsingPoint();
		sendUser.setHavingPoint(sendPoint);
		
		User receiveUser = userService.getUser(point.getReceiverId());
		int receivePoint = receiveUser.getHavingPoint() + point.getUsingPoint();
		receiveUser.setHavingPoint(receivePoint);
	}
	
	@RequestMapping(value="kakaoPay")
	public String kakaoPayReady(@RequestParam("userId") String userId,
								@RequestParam("point") int point) throws Exception {
		
		//Map<String, Object> map = commonService.getAceessToken(code);
		
		String url = pointService.getPaymentReady(null, point);
		
		return "redirect:"+url;
	}
	
	@RequestMapping(value="kakaoPay/success")
	public String kakaoPayApprove(@RequestParam("pg_token") String pgToken, HttpSession session, Model model) throws Exception {
		
		String userId = ((User)session.getAttribute("user")).getUserId();
		
		System.out.println("pg_token :: "+pgToken);
		
		Map<String, Object> result = pointService.getPaymentApprove(null, pgToken);
		
		Point point = new Point();
		point.setUsingPoint((int)result.get("point"));
		point.setSenderId(userId);
		pointService.addPoint(point);
		
		System.out.println(result);
		
		User user = userService.getUser(userId);
		user.setHavingPoint((int)result.get("point"));
		userService.updateHavingPoint(user);
		
		// 가격 amount.total && amout.vat (부가세)
		// 수량 quantity
		// 승인일 approved_at
		// 결제 시작일 ? created_at
		/*
		 * approvedDate & point
		 * */
		model.addAllAttributes(result);
		model.addAttribute("user", user);
		model.addAttribute("point", pointService.getPoint(point.getPointNo()));
		
		return "forward:/point/chargeSuccessPoint.jsp";
		
	}

}
