package com.wthealth.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.wthealth.common.Page;
import com.wthealth.common.Search;
import com.wthealth.domain.Join;
import com.wthealth.domain.Meeting;
import com.wthealth.domain.Post;
import com.wthealth.domain.User;
import com.wthealth.service.favorite.FavoriteService;
import com.wthealth.service.meeting.MeetingService;

@RestController
@RequestMapping("/meeting/*")
public class MeetingRestController {
	
	@Autowired
	@Qualifier("meetingServiceImpl")
	private MeetingService meetingService;
	
	@Autowired
	@Qualifier("favoriteServiceImpl")
	private FavoriteService favoriteService;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	public MeetingRestController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="json/updateLikeCount/{postNo}", method=RequestMethod.GET)
	public int updateLikeCount(@PathVariable int postNo) throws Exception{
		
		int totalLikeCount = favoriteService.getTotalLikeCount(postNo);
		
		Post post = meetingService.getMeetingPost(postNo);
		
		post.setLikeCount(totalLikeCount);
		meetingService.updateLikeCount(post);
		
		return totalLikeCount;
	}
	
/*	@RequestMapping(value="json/listMeeting", method=RequestMethod.POST)
	   public List<Post> listMeeting(@RequestBody Search search) throws Exception{
	      
	      System.out.println("rest");
	      if(search.getCurrentPage()==0) {
	      search.setCurrentPage(1);
	   }
	      search.setPageSize(pageSize);
	      
	      Map<String, Object> map = meetingService.listMeeting(search);
	      List<Meeting> list = (List<Meeting>) map.get("list");
	      List<Post> listForPost = new ArrayList();
	      System.out.println("이게몰까여ㅛㅇㅇㅇㅇㅇㅇ"+list);
	      
	      for (int i = 0; i < list.size(); i++) {
	    	  listForPost.add(list.get(i).getPost());
		}
	      
	      Page resultPage = new Page(search.getCurrentPage(),((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize); 
	      
	      return listForPost;
	   }*/
	
	
	//무한스크롤 
	@RequestMapping(value="json/listMeeting", method=RequestMethod.POST)
	public Map<String, Object> listMeeting(@RequestBody Search search) throws Exception{
		
		System.out.println("rest");
		if(search.getCurrentPage()==0) {
		search.setCurrentPage(1);
	}
		search.setPageSize(pageSize);
		
		Map<String, Object> map = meetingService.listMeeting(search);

		
		Page resultPage = new Page(search.getCurrentPage(),((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize); 

		
		return map;
	}
	
	@RequestMapping(value="json/addJoin/{meetNo}", method=RequestMethod.GET)
	public int addJoin(@PathVariable("meetNo") int meetNo, HttpSession session) throws Exception{
		Join join = new Join();
		join.setPartyId(((User)(session.getAttribute("user"))).getUserId());
		join.setMeetNo(meetNo);
		System.out.println("여기는 컨트롤러 안 ::: "+join);
		if(meetingService.getJoinMeeting(join)!=null) {
			meetingService.updateJoinDeleteStatus((meetingService.getJoinMeeting(join)).getJoinNo());
		}else {
		System.out.println("/meeting/json/addJoin: GET");
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
		return  1;
	}
	
	
	
}
