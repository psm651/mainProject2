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
import com.wthealth.domain.User;
import com.wthealth.service.favorite.FavoriteService;
import com.wthealth.service.main.MainService;
import com.wthealth.service.meeting.MeetingService;

@Controller
@RequestMapping("/meeting/*")
public class MeetingController {

	@Autowired
	@Qualifier("meetingServiceImpl")
	private MeetingService meetingService;
	
	@Autowired
	@Qualifier("mainServiceImpl")
	private MainService mainService;
	
	@Autowired
	@Qualifier("favoriteServiceImpl")
	private FavoriteService favoriteService;
	
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
		/*if(post.getContents().indexOf("upload/") != -1) {
			mainService.updateThumbnail(post);
		}*/
		if(post.getContents().indexOf("upload/") != -1) {
			mainService.updateThumbnail(post);
		}else if(post.getContents().indexOf("embed/") != -1){
			mainService.updateYoutubeThumbnail(post);
		}
		meeting.setPost(post);
		
		meetingService.addMeeting(meeting);
		/*post.setPostNo("ME"+meeting.getMeetNo());
		meetingService.addMeetingPost(post);*/
		//return "redirect:/meeting/getMeeting?meetNo="+meeting.getMeetNo();
		return "redirect:/meeting/addJoin?meetNo="+meeting.getMeetNo();
	}
	
	@RequestMapping(value="getMeeting", method=RequestMethod.GET)
	public String getMeeting(@RequestParam("meetNo") int meetNo, Model model) throws Exception{
		System.out.println("/getMeeting: GET");
		Meeting meeting = meetingService.getMeeting(meetNo);
		Post post = meeting.getPost();
		String contents = post.getContents();
		post.setContents(contents.substring(0));
		System.out.println(contents);
		
		meeting.setPost(post);
		model.addAttribute("meeting", meeting);
		
		return "forward:/meeting/getMeetingMap.jsp"; 
	}
	
	@RequestMapping(value="getMeetingMap", method=RequestMethod.GET)
	public String getMeetingMap(@RequestParam("meetNo") int meetNo, Model model) throws Exception{
		System.out.println("/getMeetingMap: GET");
		Map<String, Object>	map = meetingService.getMeetingMap(meetNo);
		
		Meeting meeting = (Meeting)map.get("meeting");
		Post post = meeting.getPost();
		
		String contents = post.getContents();
		post.setContents(contents.substring(1));
		System.out.println(contents);
		
		int clickCount = post.getClickCount();
		clickCount++;
		post.setClickCount(clickCount);
		meetingService.updateClickCount(post);

		int totalLikeCount = favoriteService.getTotalLikeCount(post.getPostNo());
		post.setLikeCount(totalLikeCount);
		meetingService.updateLikeCount(post);
		
		meeting.setPost(post);
		
		model.addAttribute("meeting", map.get("meeting"));
		model.addAttribute("joinlist", map.get("joinlist"));
		
		return "forward:/meeting/getMeetingMap.jsp"; 
	}
	
	@RequestMapping(value = "updateMeeting", method= RequestMethod.GET)
	public String updateMeeting(@RequestParam("meetNo") int meetNo, Model model) throws Exception{
		System.out.println("/updateMeeting : GET");
		
		Meeting meeting = meetingService.getMeeting(meetNo);
		
		model.addAttribute("meeting", meeting);
		
		return "forward:/meeting/updateMeeting.jsp";
	}
	
	@RequestMapping(value = "updateMeeting", method= RequestMethod.POST)
	public String updateMeeting(@ModelAttribute("meeting") Meeting meeting, @RequestParam("meetNo") int meetNo) throws Exception{
		System.out.println("/updateMeeting : POST");
		
		/*dietComService.updateDietCom(post);
		dietComService.addDietCom(post);*/
		meeting.setMeetNo(meetNo);
		Post post = meeting.getPost();
		post.setPostSubNo("ME"+meetNo);
		
		if(post.getContents().indexOf("upload/") != -1) {
			mainService.updateThumbnail(post);
		}else if(post.getContents().indexOf("embed/") != -1){
			mainService.updateYoutubeThumbnail(post);
		}
		meeting.setPost(post);
		
		meetingService.updateMeeting(meeting);
		

		/*if(meeting.getPost().getContents().indexOf("upload/") != -1) {
			mainService.updateThumbnail(meeting.getPost());
		};*/
		
		return "redirect:/meeting/getMeetingMap?meetNo="+meeting.getMeetNo();
	}
	
	
	@RequestMapping(value="deleteMeeting", method=RequestMethod.GET)
	public String deleteMeeting(@RequestParam("meetNo") int meetNo) throws Exception{
		System.out.println("/deleteMeeting: GET");
		meetingService.deleteMeeting("ME"+meetNo);
		
		return "forward:/meeting/listMeeting"; //forward..?
	}
	
	@RequestMapping(value="addJoin", method=RequestMethod.GET)
	public String addJoin(@RequestParam("meetNo") int meetNo, HttpSession session) throws Exception{
		Join join = new Join();
		join.setPartyId(((User)(session.getAttribute("user"))).getUserId());
		join.setMeetNo(meetNo);
		System.out.println("여기는 컨트롤러 안 ::: "+join);
		if(meetingService.getJoinMeeting(join)!=null) {
			meetingService.updateJoinDeleteStatus((meetingService.getJoinMeeting(join)).getJoinNo());
		}else {
		System.out.println("/addJoin: GET");
		//Join join = new Join();
		join.setMeetNo(meetNo);
		join.setPartyId(((User)(session.getAttribute("user"))).getUserId());
		
		Meeting meeting = meetingService.getMeeting(meetNo);
		if((meeting.getDepoCondition()).equals("1") ) {
			join.setDepoStatus("0");	//�꽑湲� 誘몄엯湲�
			join.setJoinStatus("0");  //李몄뿬 ��湲곗긽�깭
		}else if((meeting.getDepoCondition()).equals("0")) {
			join.setDepoStatus("9");  //�꽑湲덉뾾�쓬
			join.setJoinStatus("1");  //李몄뿬�솗�젙�긽�깭
		};
		
		join.setMeetTime(meeting.getMeetTime());
		
		
		meetingService.addJoin(join);
	}
		return "redirect:/meeting/getMeetingMap?meetNo="+meetNo;
	}
	
	/*@RequestMapping(value="getJoin", method=RequestMethod.GET)
	public String getJoin(@RequestParam("joinNo") int joinNo, Model model) throws Exception{
		System.out.println("/getJoin: GET");
		Join join = meetingService.getJoin(joinNo);
		model.addAttribute("join", join);
		
		return "forward" 占싱곤옙 占쏙옙 占십울옙占쏙옙占쏙옙..?
	}*/
	
	@RequestMapping(value="deleteJoin", method=RequestMethod.GET)
	public String deleteJoin(@RequestParam("joinNo") int joinNo) throws Exception{
		System.out.println("/deleteJoin: GET");
		meetingService.deleteJoin(joinNo);
		
		return "redirect:/meeting/listMeeting"; //forward..?
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
	      String userId = user.getUserId();
	      
	      Map<String , Object> map=meetingService.listJoinedMeeting(search, userId);
	      
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
