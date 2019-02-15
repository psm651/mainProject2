package com.wthealth.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.wthealth.domain.Point;
import com.wthealth.domain.User;
import com.wthealth.service.meeting.MeetingService;
import com.wthealth.service.point.PointService;
import com.wthealth.service.user.UserService;

@Controller
@RequestMapping("/point/*")
public class PointRestController {
	
	///Field
	@Autowired
	@Qualifier("pointServiceImpl")
	private PointService pointService;
	//setter Method ���� ����
		
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
		
	@Autowired
	@Qualifier("meetingServiceImpl")
	private MeetingService meetingService;

	public PointRestController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="json/updatePoint", method=RequestMethod.POST)
	   public String updatePoint(@PathVariable("point") int usingPoint, @RequestBody Point point, HttpServletRequest request, HttpSession session, HttpServletResponse response) throws Exception{

	      System.out.println("/point/updatePoint : POST");
	      //Business Logic

	      User sendUser = userService.getUser(point.getSenderId());
	      
	      if(usingPoint > sendUser.getHavingPoint()) {
	         
	         System.out.println("������ ����Ʈ���� ���������Ҷ�");
	         response.setContentType("text/html; charset=UTF-8"); 
	         PrintWriter out = response.getWriter();    
	         out.println("<script>alert('������ ����Ʈ�� �ʰ��ؼ� ������ �� �����ϴ�.');</script>");
	         out.flush();
	         return "/point/updatePoint.jsp";
	         
	      } else {
	         
	         point.setUsingPoint(usingPoint);
	         pointService.updatePoint(point);
	         
	         response.setContentType("text/html; charset=UTF-8"); 
	         PrintWriter out = response.getWriter();    
	         out.println("<script>alert('����Ʈ ������ �Ϸ�Ǿ����ϴ�.');</script>");
	         out.flush();
	   
	         int sendPoint = sendUser.getHavingPoint() - point.getUsingPoint();
	         sendUser.setHavingPoint(sendPoint);
	         userService.updateHavingPoint(sendUser);
	         System.out.println("������ ����Ʈ: "+sendPoint);
	         session.setAttribute("user", sendUser);
	         System.out.println("����Ʈ �ٲ��� "+session.getAttribute("user"));
	         
	         User receiveUser = userService.getUser(point.getReceiverId());
	         int receivePoint = receiveUser.getHavingPoint() + point.getUsingPoint();
	         receiveUser.setHavingPoint(receivePoint);
	         userService.updateHavingPoint(receiveUser);
	         System.out.println("���� ����Ʈ: "+receivePoint);
	         
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
			
			System.out.println("������ ����Ʈ�� �ʰ�");
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = response.getWriter();	 
			out.println("<script>alert('������ ����Ʈ�� �ʰ��ؼ� ������ �� �����ϴ�.');</script>");
			out.flush();
			return ;
			
		} else {
			
			point.setUsingPoint(usingPoint);
			pointService.updatePoint(point);
			
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = response.getWriter();	 
			out.println("<script>alert('����Ʈ ������ �Ϸ�Ǿ����ϴ�.');</script>");
			out.flush();
	
			int sendPoint = sendUser.getHavingPoint() - point.getUsingPoint();
			sendUser.setHavingPoint(sendPoint);
			userService.updateHavingPoint(sendUser);
			System.out.println("������ ����Ʈ: "+sendPoint);
			session.setAttribute("user", sendUser);
			System.out.println("����Ʈ �ٲ��� "+session.getAttribute("user"));
			
			//User receiveUser = userService.getUser(point.getReceiverId());
			User receiveUser = userService.findId(point.getReceiverId());
			point.setReceiverId(receiveUser.getUserId());
			int receivePoint = receiveUser.getHavingPoint() + point.getUsingPoint();
			receiveUser.setHavingPoint(receivePoint);
			userService.updateHavingPoint(receiveUser);
			System.out.println("���� ����Ʈ: "+receivePoint);
			
			
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
			
			System.out.println("���� ����Ʈ���� �� ���� ���������Ҷ�");
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = response.getWriter();	 
			out.println("<script>alert('���� ����Ʈ�� �ʰ��ؼ� ������ �� �����ϴ�.');</script>");
			out.flush();
			return "/point/updateDeposit.jsp";
			
		} else {
			System.out.println("�������ۤ���������");
			point.setUsingPoint(usingPoint);
			pointService.updatePoint(point);
			
			System.out.println("�Ƕ󤿤�����");
			
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = response.getWriter();	 
			out.println("<script>alert('���۵Ǿ����ϴ�.');</script>");
			out.flush();
	
			int sendPoint = sendUser.getHavingPoint() - point.getUsingPoint();
			sendUser.setHavingPoint(sendPoint);
			userService.updateHavingPoint(sendUser);
			System.out.println("������ ����Ʈ: "+sendPoint);
			session.setAttribute("user", sendUser);
			System.out.println("����Ʈ �ٲ��� "+session.getAttribute("user"));
			
			meetingService.updateDeposit(joinNo);
			System.out.println("�������ۿϷ�: "+meetingService.getJoin(joinNo));
			
			/*String receiveMeeting = meetingService.getMeeting(point.getReceiverId()).getPost().getTitle();
			System.out.println("�Ҹ��� �̸�: "+receiveMeeting);
			model.addAttribute("receiveMeeting", receiveMeeting);*/
			
			return "forward:/point/listPoint";
		}
	}

}
