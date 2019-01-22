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
	//setter Method 구현 않음
	
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
	public String updatePoint(@RequestParam("point") int usingPoint, @ModelAttribute("point") Point point, HttpServletRequest request, HttpSession session, HttpServletResponse response) throws Exception{

		System.out.println("/point/updatePoint : POST");
		//Business Logic

		User sendUser = userService.getUser(point.getSenderId());
		
		if(usingPoint > sendUser.getHavingPoint()) {
			
			System.out.println("보유 포인트보다 더 많이 보내려고할때");
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = response.getWriter();	 
			out.println("<script>alert('보유 포인트를 초과해서 쏠 수 없습니다.');</script>");
			out.flush();
			return "/point/updatePoint.jsp";
			
		} else {
			
			point.setUsingPoint(usingPoint);
			pointService.updatePoint(point);
			
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = response.getWriter();	 
			out.println("<script>alert('전송되었습니다.');</script>");
			out.flush();
	
			int sendPoint = sendUser.getHavingPoint() - point.getUsingPoint();
			sendUser.setHavingPoint(sendPoint);
			userService.updateHavingPoint(sendUser);
			System.out.println("전송한 포인트: "+sendPoint);
			session.setAttribute("user", sendUser);
			System.out.println("포인트 바뀌라고 "+session.getAttribute("user"));
			
			User receiveUser = userService.getUser(point.getReceiverId());
			int receivePoint = receiveUser.getHavingPoint() + point.getUsingPoint();
			receiveUser.setHavingPoint(receivePoint);
			userService.updateHavingPoint(receiveUser);
			System.out.println("받은 포인트: "+receivePoint);
			
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
			
			System.out.println("보유 포인트보다 더 많이 보내려고할때");
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = response.getWriter();	 
			out.println("<script>alert('보유 포인트를 초과해서 전송할 수 없습니다.');</script>");
			out.flush();
			return "/point/updateDeposit.jsp";
			
		} else {
			System.out.println("선금전송ㅇㅇㅇㅇㅇ");
			point.setUsingPoint(usingPoint);
			pointService.updatePoint(point);
			
			System.out.println("되라ㅏㅏㅏㅏ");
			
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = response.getWriter();	 
			out.println("<script>alert('전송되었습니다.');</script>");
			out.flush();
	
			int sendPoint = sendUser.getHavingPoint() - point.getUsingPoint();
			sendUser.setHavingPoint(sendPoint);
			userService.updateHavingPoint(sendUser);
			System.out.println("전송한 포인트: "+sendPoint);
			session.setAttribute("user", sendUser);
			System.out.println("포인트 바뀌라고 "+session.getAttribute("user"));
			
			meetingService.updateDeposit(joinNo);
			System.out.println("선금전송완료: "+meetingService.getJoin(joinNo));
			
			/*String receiveMeeting = meetingService.getMeeting(point.getReceiverId()).getPost().getTitle();
			System.out.println("소모임 이름: "+receiveMeeting);
			model.addAttribute("receiveMeeting", receiveMeeting);*/
			
			return "forward:/point/listPoint";
		}
	}
	
	@RequestMapping(value="kakaoPay")
	public String kakaoPayReady(@RequestParam("userId") String userId,
								@RequestParam("point") int point, Model model) throws Exception {
		
		System.out.println("카카오페이 요청");
		//Map<String, Object> map = commonService.getAceessToken(code);
		
		String url = pointService.getPaymentReady(null, point);
		model.addAttribute("point",point);
		
		return "redirect:"+url;
	}
	
	@RequestMapping(value="kakaoPaySuccess")
	public String kakaoPayApprove(@RequestParam("pg_token") String pgToken, HttpSession session, Model model) throws Exception {
		
		System.out.println("카카오페이 승인");
		
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
		
		// 가격 amount.total && amout.vat (부가세)
		// 수량 quantity
		// 승인일 approved_at
		// 결제 시작일 ? created_at
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
