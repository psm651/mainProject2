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
import org.springframework.web.bind.annotation.RestController;

import com.wthealth.domain.Point;
import com.wthealth.domain.User;
import com.wthealth.service.meeting.MeetingService;
import com.wthealth.service.point.PointService;
import com.wthealth.service.user.UserService;

@RestController
@RequestMapping("/point/*")
public class PointRestController {
	
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

	public PointRestController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="json/updatePoint/{usingPoint}", method=RequestMethod.POST)
	   public String updatePoint(@PathVariable("usingPoint") int usingPoint, @RequestBody Point point, HttpSession session) throws Exception{

	      System.out.println("json/updatePoint");
	      //Business Logic

	      User sendUser = userService.getUser(point.getSenderId());
	      
	      if(usingPoint > sendUser.getHavingPoint()) {
	    	  
	    	 System.out.println("Æ÷ÀÎÆ® ÃÊ°úÇßÀ»¶§");
	
	         return "111";
	         
	      } else {
	         
	         point.setUsingPoint(usingPoint);
	         pointService.updatePoint(point);
	         
	         int sendPoint = sendUser.getHavingPoint() - point.getUsingPoint();
	         sendUser.setHavingPoint(sendPoint);
	         userService.updateHavingPoint(sendUser);
	         System.out.println("Àü¼ÛÇÒ Æ÷ÀÎÆ®: "+sendPoint);
	         session.setAttribute("user", sendUser);
	         System.out.println("Àü¼ÛÇÑ »ç¿ëÀÚ "+session.getAttribute("user"));
	         
	         User receiveUser = userService.getUser(point.getReceiverId());
	         int receivePoint = receiveUser.getHavingPoint() + point.getUsingPoint();
	         receiveUser.setHavingPoint(receivePoint);
	         userService.updateHavingPoint(receiveUser);
	         System.out.println("¹ÞÀº Æ÷ÀÎÆ®: "+receivePoint);
	         
	         return "222";
	      }
	   }
	

	@RequestMapping(value="json/updateDeposit/{usingPoint}/{joinNo}", method=RequestMethod.POST)
	public String updateDeposit(@PathVariable("usingPoint") int usingPoint, @PathVariable("joinNo") int joinNo, @RequestBody Point point, HttpSession session) throws Exception{

		System.out.println("/point/updateDeposit : POST");
		//Business Logic
		User sendUser = userService.getUser(point.getSenderId());
		
		if(usingPoint > sendUser.getHavingPoint()) {
			 
			System.out.println("Æ÷ÀÎÆ® ÃÊ°úÇßÀ»¶§");
				
	         return "111";
			
		} else {
			
			
			point.setUsingPoint(usingPoint);
			pointService.updatePoint(point);
	
			int sendPoint = sendUser.getHavingPoint() - point.getUsingPoint();
			sendUser.setHavingPoint(sendPoint);
			userService.updateHavingPoint(sendUser);
			System.out.println("Àü¼ÛÇÑ Æ÷ÀÎÆ®: "+sendPoint);
			session.setAttribute("user", sendUser);
			System.out.println("Àü¼ÛÇÑ »ç¿ëÀÚ  "+session.getAttribute("user"));
			
			meetingService.updateDeposit(joinNo);
			System.out.println("¹ÞÀº Æ÷ÀÎÆ®: "+meetingService.getJoin(joinNo));
			
			/*String receiveMeeting = meetingService.getMeeting(point.getReceiverId()).getPost().getTitle();
			System.out.println("ï¿½Ò¸ï¿½ï¿½ï¿½ ï¿½Ì¸ï¿½: "+receiveMeeting);
			model.addAttribute("receiveMeeting", receiveMeeting);*/
			
			return "222";
		}
	}
	
	@RequestMapping(value="json/updatePointLive/{usingPoint}", method=RequestMethod.POST)
	public String updatePointLive(@PathVariable("usingPoint") int usingPoint, @RequestBody Point point, HttpSession session) throws Exception{

		System.out.println("json/point/updatePoint : POST");
		//Business Logic

		//User sendUser = userService.getUser(point.getSenderId());
		User sendUser = userService.findId(point.getSenderId());
		point.setSenderId(sendUser.getUserId());
		
		if(usingPoint > sendUser.getHavingPoint()) {
			
			System.out.println("º¸À¯ÇÑ Æ÷ÀÎÆ®¸¦ ÃÊ°ú");
			
			return "111";
			
		} else {
			
			point.setUsingPoint(usingPoint);
			pointService.updatePoint(point);
	
			int sendPoint = sendUser.getHavingPoint() - point.getUsingPoint();
			sendUser.setHavingPoint(sendPoint);
			userService.updateHavingPoint(sendUser);
			System.out.println("Àü¼ÛÇÑ Æ÷ÀÎÆ®:: "+sendPoint);
			session.setAttribute("user", sendUser);
			System.out.println("Àü¼ÛÇÑ »ç¿ëÀÚ: "+session.getAttribute("user"));
			
			//User receiveUser = userService.getUser(point.getReceiverId());
			User receiveUser = userService.findId(point.getReceiverId());
			point.setReceiverId(receiveUser.getUserId());
			int receivePoint = receiveUser.getHavingPoint() + point.getUsingPoint();
			receiveUser.setHavingPoint(receivePoint);
			userService.updateHavingPoint(receiveUser);
			System.out.println("¹ÞÀº Æ÷ÀÎÆ®: "+receivePoint);
			
			return "222";
			
		}
	}

}
