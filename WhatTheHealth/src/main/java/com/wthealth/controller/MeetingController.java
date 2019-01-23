package com.wthealth.controller;

import java.util.Map;

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
import com.wthealth.domain.Join;
import com.wthealth.domain.Meeting;
import com.wthealth.domain.Post;
import com.wthealth.domain.Socket;
import com.wthealth.domain.User;
import com.wthealth.service.meeting.MeetingService;

@Controller
@RequestMapping("/meeting/*")
public class MeetingController {

	@Autowired
	@Qualifier("meetingServiceImpl")
	private MeetingService meetingService;
	
	public MeetingController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	// @Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	// @Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	@RequestMapping(value="addMeeting", method=RequestMethod.GET)
	public String addMeeting() throws Exception{
		System.out.println("/addMeeting : GET");
		
		return "forward:/meeting/addMeeting.jsp" ;
	}
	
	@RequestMapping(value="addMeeting", method=RequestMethod.POST)
	public String addMeeting(@ModelAttribute("meeting") Meeting meeting, HttpSession session) throws Exception{
		System.out.println("/addMeeting: POST");
		
		User user = (User)session.getAttribute("user");
		meeting.setCheifId(user.getUserId());
		
		Post post = meeting.getPost();
		post.setUserId(user.getUserId());

		meeting.setPost(post);
		
		meetingService.addMeeting(meeting);
		/*post.setPostNo("ME"+meeting.getMeetNo());
		meetingService.addMeetingPost(post);*/
		return "forward:/meeting/getMeeting?postNo="+meeting.getPost().getPostNo();
	}
	
	@RequestMapping(value="getMeeting", method=RequestMethod.GET)
	public String getMeeting(@RequestParam("meetNo") int meetNo, Model model) throws Exception{
		System.out.println("/getMeeting: GET");
		Meeting meeting = meetingService.getMeeting(meetNo);
		model.addAttribute("meeting", meeting);
		
		return "forward:/meeting/getMeeting.jsp"; ///////////////////�ٽú���(-)
	}
	
	@RequestMapping(value="deleteMeeting", method=RequestMethod.GET)
	public String deleteMeeting(@RequestParam("postNo") int postNo) throws Exception{
		System.out.println("/deleteMeeting: GET");
		meetingService.deleteMeeting(postNo);
		
		return "forward:/meeting/listMeeting"; //forward..?
	}
	
	@RequestMapping(value="addJoin", method=RequestMethod.POST)
	public String addJoin(@ModelAttribute("join") Join join) throws Exception{
		System.out.println("/addJoin: POST");
		meetingService.addJoin(join);
		return "forward:/meeting/getMeeting?postNo="+join.getPostNo();
	}
	
	/*@RequestMapping(value="getJoin", method=RequestMethod.GET)
	public String getJoin(@RequestParam("joinNo") int joinNo, Model model) throws Exception{
		System.out.println("/getJoin: GET");
		Join join = meetingService.getJoin(joinNo);
		model.addAttribute("join", join);
		
		return "forward" �̰� �� �ʿ�����..?
	}*/
	
	@RequestMapping(value="deleteJoin", method=RequestMethod.GET)
	public String deleteJoin(@RequestParam("joinNo") int joinNo) throws Exception{
		System.out.println("/deleteJoin: GET");
		meetingService.deleteJoin(joinNo);
		
		return "forward:/joinNo/listJoin"; //forward..?
	}
	
	@RequestMapping(value="listMeeting")
	public String listMeeting(@ModelAttribute("search") Search search, Model model) throws Exception{
		System.out.println("/listMeeting");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String , Object> map=meetingService.listMeeting(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/meeting/listMeeting.jsp";
	}
	
	@RequestMapping(value="listJoinedMeeting")
	   public String listJoinedMeeting(@ModelAttribute("search") Search search, HttpSession session, Model model) throws Exception{
	      System.out.println("/listJoinedMeeting");
	      
	      if(search.getCurrentPage() ==0 ){
	         search.setCurrentPage(1);
	      }
	      search.setPageSize(pageSize);
	      User user = (User)session.getAttribute("user");
	      
	      Map<String , Object> map=meetingService.listJoinedMeeting(search, user.getUserId());
	      
	      Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
	      System.out.println(resultPage);
	      
	      model.addAttribute("meetingList", map.get("list"));
	      model.addAttribute("resultPage", resultPage);
	      model.addAttribute("search", search);
	      
	      return "forward:/activity/listJoinedMeeting.jsp";
	   }
	
	@RequestMapping(value="youtube")
	public String youtube() throws Exception{
		return "forward:/meeting/index.html";
	}
}
