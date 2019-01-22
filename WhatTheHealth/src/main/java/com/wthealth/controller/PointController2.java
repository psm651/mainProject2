package com.wthealth.controller;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import com.wthealth.service.meeting.MeetingService;
import com.wthealth.service.point.PointService;
import com.wthealth.service.user.UserService;

@Controller
@RequestMapping("/point/*")
public class PointController2 {
	
	///Field
	@Autowired
	@Qualifier("pointServiceImpl")
	private PointService pointService;
	//setter Method 姥薄 省製
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("meetingServiceImpl")
	private MeetingService meetingService;

	public PointController2() {
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
		
		// Business logic 呪楳
		Map<String , Object> map = pointService.listPoint(search, senderId);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model 引 View 尻衣
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
	public String updatePoint(@RequestParam("point") int usingPoint, @ModelAttribute("point") Point point, HttpServletRequest request, HttpSession session, HttpServletResponse response) throws Exception{

		System.out.println("/point/updatePoint : POST");
		//Business Logic

		User sendUser = userService.getUser(point.getSenderId());
		
		if(usingPoint > sendUser.getHavingPoint()) {
			
			System.out.println("左政 匂昔闘左陥 希 弦戚 左鎧形壱拝凶");
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = response.getWriter();	 
			out.println("<script>alert('左政 匂昔闘研 段引背辞 薯 呪 蒸柔艦陥.');</script>");
			out.flush();
			return "/point/updatePoint.jsp";
			
		} else {
			
			point.setUsingPoint(usingPoint);
			pointService.updatePoint(point);
			
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = response.getWriter();	 
			out.println("<script>alert('穿勺鞠醸柔艦陥.');</script>");
			out.flush();
	
			int sendPoint = sendUser.getHavingPoint() - point.getUsingPoint();
			sendUser.setHavingPoint(sendPoint);
			userService.updateHavingPoint(sendUser);
			System.out.println("穿勺廃 匂昔闘: "+sendPoint);
			session.setAttribute("user", sendUser);
			System.out.println("匂昔闘 郊餓虞壱 "+session.getAttribute("user"));
			
			User receiveUser = userService.getUser(point.getReceiverId());
			int receivePoint = receiveUser.getHavingPoint() + point.getUsingPoint();
			receiveUser.setHavingPoint(receivePoint);
			userService.updateHavingPoint(receiveUser);
			System.out.println("閤精 匂昔闘: "+receivePoint);
			
			return "forward:/point/listPoint";
		}
	}
	
	@RequestMapping(value="updateDeposit", method=RequestMethod.GET)
	public String updateDeposit(@RequestParam("joinNo") int joinNo, Model model, HttpSession session) throws Exception{

		System.out.println("/point/updateDeposit : GET");
		//Business Logic
		String senderId = ((User)session.getAttribute("user")).getUserId();
		String meetingPostNo = meetingService.getJoin(joinNo).getPostNo();
		String receiveMeeting = meetingService.getMeeting(meetingPostNo).getPost().getTitle();
		
		Point point = new Point();
		point.setPointStatus("1");
		point.setSenderId(senderId);
		point.setReceiverId(receiveMeeting);
		
		model.addAttribute("point", point);
		model.addAttribute("joinNo", joinNo);
		
		return "forward:/point/updateDeposit.jsp";
	}
	
	@RequestMapping(value="updateDeposit", method=RequestMethod.POST)
	public String updateDeposit(@RequestParam("point") int usingPoint, @RequestParam("joinNo") int joinNo, @ModelAttribute("point") Point point, HttpServletRequest request, HttpSession session, HttpServletResponse response, Model model) throws Exception{

		System.out.println("/point/updateDeposit : POST");
		//Business Logic
		User sendUser = userService.getUser(point.getSenderId());
		
		if(usingPoint > sendUser.getHavingPoint()) {
			
			System.out.println("左政 匂昔闘左陥 希 弦戚 左鎧形壱拝凶");
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = response.getWriter();	 
			out.println("<script>alert('左政 匂昔闘研 段引背辞 穿勺拝 呪 蒸柔艦陥.');</script>");
			out.flush();
			return "/point/updateDeposit.jsp";
			
		} else {
			System.out.println("識榎穿勺ししししし");
			point.setUsingPoint(usingPoint);
			pointService.updatePoint(point);
			
			System.out.println("鞠虞たたたた");
			
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = response.getWriter();	 
			out.println("<script>alert('穿勺鞠醸柔艦陥.');</script>");
			out.flush();
	
			int sendPoint = sendUser.getHavingPoint() - point.getUsingPoint();
			sendUser.setHavingPoint(sendPoint);
			userService.updateHavingPoint(sendUser);
			System.out.println("穿勺廃 匂昔闘: "+sendPoint);
			session.setAttribute("user", sendUser);
			System.out.println("匂昔闘 郊餓虞壱 "+session.getAttribute("user"));
			
			meetingService.updateDeposit(joinNo);
			System.out.println("識榎穿勺刃戟: "+meetingService.getJoin(joinNo));
			
			/*String receiveMeeting = meetingService.getMeeting(point.getReceiverId()).getPost().getTitle();
			System.out.println("社乞績 戚硯: "+receiveMeeting);
			model.addAttribute("receiveMeeting", receiveMeeting);*/
			
			return "forward:/point/listPoint";
		}
	}
	
	@RequestMapping(value="kakaoPay")
	public String kakaoPayReady(@RequestParam("userId") String userId,
								@RequestParam("point") int point, Model model) throws Exception {
		
		System.out.println("朝朝神凪戚 推短");
		//Map<String, Object> map = commonService.getAceessToken(code);
		
		String url = pointService.getPaymentReady(null, point);
		model.addAttribute("point",point);
		
		return "redirect:"+url;
	}
	
	@RequestMapping(value="kakaoPaySuccess")
	public String kakaoPayApprove(@RequestParam("pg_token") String pgToken, HttpSession session, Model model) throws Exception {
		
		System.out.println("朝朝神凪戚 渋昔");
		
		String userId = ((User)session.getAttribute("user")).getUserId();
		
		System.out.println("pg_token :: "+pgToken);
		
		Map<String, Object> result = pointService.getPaymentApprove(null, pgToken);
		System.out.println("111111111111111");
		Point point = new Point();
		point.setUsingPoint((int)result.get("point"));
		point.setSenderId(userId);
		pointService.addPoint(point);
		System.out.println("222222222222222222");
		System.out.println(result);
		
		User user = userService.getUser(userId);
		user.setHavingPoint((int)result.get("point")+user.getHavingPoint());
		userService.updateHavingPoint(user);
		session.setAttribute("user", user);
		
		// 亜維 amount.total && amout.vat (採亜室)
		// 呪勲 quantity
		// 渋昔析 approved_at
		// 衣薦 獣拙析 ? created_at
		/*
		 * approvedDate & point
		 * */
		//model.addAllAttributes(result);
		model.addAttribute("result", result);
		model.addAttribute("user", user);
		model.addAttribute("point", pointService.getPoint(point.getPointNo()));
		
		return "redirect:/point/listPoint";
		//return "forward:/point/kakaoPaySuccess?pg_token="+pgToken;
	}

}
