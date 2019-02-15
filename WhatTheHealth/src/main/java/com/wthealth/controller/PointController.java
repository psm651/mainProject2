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
import org.springframework.web.bind.annotation.RequestBody;
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
public class PointController {
	
	///Field
	@Autowired
	@Qualifier("pointServiceImpl")
	private PointService pointService;
	//setter Method ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("meetingServiceImpl")
	private MeetingService meetingService;

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
		
		// Business logic ï¿½ï¿½ï¿½ï¿½
		Map<String , Object> map = pointService.listPoint(search, senderId);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model ï¿½ï¿½ View ï¿½ï¿½ï¿½ï¿½
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
	
	@RequestMapping(value="updatePointLive", method=RequestMethod.GET)
	public String updatePointLive(@RequestParam("receiverId") String receiverId, Model model, @RequestParam("senderId") String senderId) throws Exception{

		System.out.println("/point/updatePointLive : GET");
		//Business Logic
		//String senderId = ((User)session.getAttribute("user")).getUserId();
		
		Point point = new Point();
		point.setPointStatus("2");
		point.setSenderId(senderId);
		point.setReceiverId(receiverId);
		
		model.addAttribute("point", point);
		
		return "forward:/point/updatePointLive.jsp";
	}
	
	@RequestMapping(value="updatePoint", method=RequestMethod.POST)
	   public String updatePoint(@RequestParam("point") int usingPoint, @ModelAttribute("point") Point point, HttpServletRequest request, HttpSession session, HttpServletResponse response) throws Exception{

	      System.out.println("/point/updatePoint : POST");
	      //Business Logic

	      User sendUser = userService.getUser(point.getSenderId());
	      
	      if(usingPoint > sendUser.getHavingPoint()) {
	         
	         System.out.println("º¸À¯ÇÑ Æ÷ÀÎÆ®º¸´Ù ¸¹ÀÌÀü¼ÛÇÒ¶§");
	         response.setContentType("text/html; charset=UTF-8"); 
	         PrintWriter out = response.getWriter();    
	         out.println("<script>alert('º¸À¯ÇÑ Æ÷ÀÎÆ®¸¦ ÃÊ°úÇØ¼­ Àü¼ÛÇÒ ¼ö ¾ø½À´Ï´Ù.');</script>");
	         out.flush();
	         return "/point/updatePoint.jsp";
	         
	      } else {
	         
	         point.setUsingPoint(usingPoint);
	         pointService.updatePoint(point);
	         
	         response.setContentType("text/html; charset=UTF-8"); 
	         PrintWriter out = response.getWriter();    
	         out.println("<script>alert('Æ÷ÀÎÆ® Àü¼ÛÀÌ ¿Ï·áµÇ¾ú½À´Ï´Ù.');</script>");
	         out.flush();
	   
	         int sendPoint = sendUser.getHavingPoint() - point.getUsingPoint();
	         sendUser.setHavingPoint(sendPoint);
	         userService.updateHavingPoint(sendUser);
	         System.out.println("ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½Æ®: "+sendPoint);
	         session.setAttribute("user", sendUser);
	         System.out.println("ï¿½ï¿½ï¿½ï¿½Æ® ï¿½Ù²ï¿½ï¿½ï¿½ "+session.getAttribute("user"));
	         
	         User receiveUser = userService.getUser(point.getReceiverId());
	         int receivePoint = receiveUser.getHavingPoint() + point.getUsingPoint();
	         receiveUser.setHavingPoint(receivePoint);
	         userService.updateHavingPoint(receiveUser);
	         System.out.println("ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½Æ®: "+receivePoint);
	         
	         return "forward:/point/listPoint";
	      }
	   }
	
	
	
	@RequestMapping(value="updatePointLive", method=RequestMethod.POST)
	public void updatePointLive(@RequestParam("point") int usingPoint, @ModelAttribute("point") Point point, HttpServletRequest request, HttpSession session, HttpServletResponse response) throws Exception{

		System.out.println("/point/updatePoint : POST");
		//Business Logic

		//User sendUser = userService.getUser(point.getSenderId());
		User sendUser = userService.findId(point.getSenderId());
		point.setSenderId(sendUser.getUserId());
		
		if(usingPoint > sendUser.getHavingPoint()) {
			
			System.out.println("º¸À¯ÇÑ Æ÷ÀÎÆ®¸¦ ÃÊ°ú");
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = response.getWriter();	 
			out.println("<script>alert('º¸À¯ÇÑ Æ÷ÀÎÆ®¸¦ ÃÊ°úÇØ¼­ Àü¼ÛÇÒ ¼ö ¾ø½À´Ï´Ù.');</script>");
			out.flush();
			return ;
			
		} else {
			
			point.setUsingPoint(usingPoint);
			pointService.updatePoint(point);
			
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = response.getWriter();	 
			out.println("<script>alert('Æ÷ÀÎÆ® Àü¼ÛÀÌ ¿Ï·áµÇ¾ú½À´Ï´Ù.');</script>");
			out.flush();
	
			int sendPoint = sendUser.getHavingPoint() - point.getUsingPoint();
			sendUser.setHavingPoint(sendPoint);
			userService.updateHavingPoint(sendUser);
			System.out.println("ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½Æ®: "+sendPoint);
			session.setAttribute("user", sendUser);
			System.out.println("ï¿½ï¿½ï¿½ï¿½Æ® ï¿½Ù²ï¿½ï¿½ï¿½ "+session.getAttribute("user"));
			
			//User receiveUser = userService.getUser(point.getReceiverId());
			User receiveUser = userService.findId(point.getReceiverId());
			point.setReceiverId(receiveUser.getUserId());
			int receivePoint = receiveUser.getHavingPoint() + point.getUsingPoint();
			receiveUser.setHavingPoint(receivePoint);
			userService.updateHavingPoint(receiveUser);
			System.out.println("ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½Æ®: "+receivePoint);
			
			
		}
	}
	
	@RequestMapping(value="updateDeposit", method=RequestMethod.GET)
	public String updateDeposit(@RequestParam("joinNo") int joinNo, Model model, HttpSession session) throws Exception{

		System.out.println("/point/updateDeposit : GET");
		//Business Logic
		String senderId = ((User)session.getAttribute("user")).getUserId();
		int meetingPostNo = meetingService.getJoin(joinNo).getMeetNo();
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
			
			System.out.println("ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½Æ®ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ò¶ï¿½");
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = response.getWriter();	 
			out.println("<script>alert('ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½Æ®ï¿½ï¿½ ï¿½Ê°ï¿½ï¿½Ø¼ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½Ï´ï¿½.');</script>");
			out.flush();
			return "/point/updateDeposit.jsp";
			
		} else {
			System.out.println("ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Û¤ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½");
			point.setUsingPoint(usingPoint);
			pointService.updatePoint(point);
			
			System.out.println("ï¿½Ç¶ó¤¿¤ï¿½ï¿½ï¿½ï¿½ï¿½");
			
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = response.getWriter();	 
			out.println("<script>alert('ï¿½ï¿½ï¿½ÛµÇ¾ï¿½ï¿½ï¿½ï¿½Ï´ï¿½.');</script>");
			out.flush();
	
			int sendPoint = sendUser.getHavingPoint() - point.getUsingPoint();
			sendUser.setHavingPoint(sendPoint);
			userService.updateHavingPoint(sendUser);
			System.out.println("ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½Æ®: "+sendPoint);
			session.setAttribute("user", sendUser);
			System.out.println("ï¿½ï¿½ï¿½ï¿½Æ® ï¿½Ù²ï¿½ï¿½ï¿½ "+session.getAttribute("user"));
			
			meetingService.updateDeposit(joinNo);
			System.out.println("ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Û¿Ï·ï¿½: "+meetingService.getJoin(joinNo));
			
			/*String receiveMeeting = meetingService.getMeeting(point.getReceiverId()).getPost().getTitle();
			System.out.println("ï¿½Ò¸ï¿½ï¿½ï¿½ ï¿½Ì¸ï¿½: "+receiveMeeting);
			model.addAttribute("receiveMeeting", receiveMeeting);*/
			
			return "forward:/point/listPoint";
		}
	}
	
/*	@RequestMapping(value="kakaoPay")
	public String kakaoPayReady(@RequestParam("userId") String userId,
								@RequestParam("point") int point, Model model) throws Exception {
		
		System.out.println("Ä«Ä«ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½Ã»");
		//Map<String, Object> map = commonService.getAceessToken(code);
		
		String url = pointService.getPaymentReady(null, point);
		model.addAttribute("point",point);
		System.out.println("Ä«Ä«¿ÀÆäÀÌ url:::::::"+url);
		
		return "redirect:"+url;
	}*/
	
	/*@RequestMapping(value="kakaoPaySuccess")
	public String kakaoPayApprove(@RequestParam("pg_token") String pgToken, HttpSession session, Model model) throws Exception {
		
		System.out.println("Ä«Ä«ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½");
		
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
		
		// ï¿½ï¿½ï¿½ï¿½ amount.total && amout.vat (ï¿½Î°ï¿½ï¿½ï¿½)
		// ï¿½ï¿½ï¿½ï¿½ quantity
		// ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ approved_at
		// ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ? created_at
		
		 * approvedDate & point
		 * 
		//model.addAllAttributes(result);
		model.addAttribute("result", result);
		model.addAttribute("user", user);
		model.addAttribute("point", pointService.getPoint(point.getPointNo()));
		
		return "redirect:/point/listPoint";
		//return "forward:/point/kakaoPaySuccess?pg_token="+pgToken;
	}*/
	
	
	@RequestMapping(value="kakaoPay")
	public String kakaoPayApprove(@RequestParam("point") int point, HttpSession session, Model model) throws Exception {
		
		System.out.println("Ä«Ä«¿À ÆäÀÌ °áÁ¦");
		
		String userId = ((User)session.getAttribute("user")).getUserId();
		
		
		//Map<String, Object> result = pointService.getPaymentApprove(null, pgToken);
		System.out.println("111111111111111");
		
		Point addPoint = new Point();
		addPoint.setUsingPoint(point);
		addPoint.setSenderId(userId);
		pointService.addPoint(addPoint);
		System.out.println("222222222222222222");
		System.out.println(point);
		
		User user = userService.getUser(userId);
		user.setHavingPoint(point+user.getHavingPoint());
		userService.updateHavingPoint(user);
		session.setAttribute("user", user);
		
		// ï¿½ï¿½ï¿½ï¿½ amount.total && amout.vat (ï¿½Î°ï¿½ï¿½ï¿½)
		// ï¿½ï¿½ï¿½ï¿½ quantity
		// ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ approved_at
		// ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ? created_at
		/*
		 * approvedDate & point
		 * */
		//model.addAllAttributes(result);
		//model.addAttribute("result", result);
		model.addAttribute("user", user);
		model.addAttribute("point", pointService.getPoint(addPoint.getPointNo()));
		
		return "redirect:/point/listPoint";
		//return "forward:/point/kakaoPaySuccess?pg_token="+pgToken;
	}

}
