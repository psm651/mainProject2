package com.wthealth.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.wthealth.common.Page;
import com.wthealth.common.Search;
import com.wthealth.domain.Meeting;
import com.wthealth.domain.Post;
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
	
	/*@RequestMapping(value="json/updateLikeCount/{postNo}", method=RequestMethod.GET)
	public int updateLikeCount(@PathVariable int postNo) throws Exception{
		
		int totalLikeCount = favoriteService.getTotalLikeCount(postNo);
		
		Post post = meetingService.getMeetingPost(postNo);
		
		post.setLikeCount(totalLikeCount);
		meetingService.updateLikeCount(post);
		
		return totalLikeCount;
	}*/
	
	@RequestMapping(value="json/listMeeting", method=RequestMethod.POST)
	   public List<Post> listMeeting(@RequestBody Search search) throws Exception{
	      
	      System.out.println("rest");
	      if(search.getCurrentPage()==0) {
	      search.setCurrentPage(1);
	   }
	      search.setPageSize(pageSize);
	      
	      Map<String, Object> map = meetingService.listMeeting(search);
	      List<Meeting> list = (List<Meeting>) map.get("list");
	      List<Post> listForPost = new ArrayList();
	      System.out.println("戚惟侯猿食にしししししし"+list);
	      
	      for (int i = 0; i < list.size(); i++) {
	    	  listForPost.add(list.get(i).getPost());
		}
	      
	      Page resultPage = new Page(search.getCurrentPage(),((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize); 
	      
	      return listForPost;
	   }

}
