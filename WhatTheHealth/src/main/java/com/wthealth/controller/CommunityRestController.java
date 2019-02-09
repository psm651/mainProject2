package com.wthealth.controller;

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
import com.wthealth.domain.Post;
import com.wthealth.service.community.CommunityService;
import com.wthealth.service.favorite.FavoriteService;

@RestController
@RequestMapping("/community/*")
public class CommunityRestController {
	
	@Autowired
	@Qualifier("communityServiceImpl")
	private CommunityService communityService;
	
	@Autowired
	@Qualifier("favoriteServiceImpl")
	private FavoriteService favoriteService;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	public CommunityRestController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="json/updateLikeCount/{postNo}", method=RequestMethod.GET)
	public int updateLikeCount(@PathVariable int postNo) throws Exception{
		
		int totalLikeCount = favoriteService.getTotalLikeCount(postNo);
		
		Post post = communityService.getCommunity(postNo);
		
		post.setLikeCount(totalLikeCount);
		communityService.updateLikeCount(post);
		
		return totalLikeCount;
	}
	
	@RequestMapping(value="json/listExCom", method=RequestMethod.POST)
	   public List<Post> listExCom(@RequestBody Search search) throws Exception{
	      
	      System.out.println("rest");
	      if(search.getCurrentPage()==0) {
	      search.setCurrentPage(1);
	   }
	      search.setPageSize(pageSize);
	      
	      Map<String, Object> map = communityService.listExCom(search);
	      List<Post> list = (List<Post>) map.get("list");
	      
	      Page resultPage = new Page(search.getCurrentPage(),((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize); 
	      
	      return list;
	   }
	
	@RequestMapping(value="json/listDietCom", method=RequestMethod.POST)
	   public List<Post> listDietCom(@RequestBody Search search) throws Exception{
	      
	      System.out.println("rest");
	      if(search.getCurrentPage()==0) {
	      search.setCurrentPage(1);
	   }
	      search.setPageSize(pageSize);
	      
	      Map<String, Object> map = communityService.listDietCom(search);
	      List<Post> list = (List<Post>) map.get("list");
	      
	      Page resultPage = new Page(search.getCurrentPage(),((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize); 
	      
	      return list;
	   }

	@RequestMapping(value="json/dietCommunitylist", method=RequestMethod.POST)
	public Map<String, Object> dietCommunitylist(@RequestBody Search search) throws Exception{
		
		System.out.println("rest");
		if(search.getCurrentPage()==0) {
		search.setCurrentPage(1);
	}
		search.setPageSize(pageSize);
		
		Map<String, Object> map = communityService.listDietCom(search);
		
		Page resultPage = new Page(search.getCurrentPage(),((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize); 

		
		return map;
	}
	
	@RequestMapping(value="json/exCommunitylist", method=RequestMethod.POST)
	public Map<String, Object> exCommunitylist(@RequestBody Search search) throws Exception{
		
		System.out.println("rest");
		if(search.getCurrentPage()==0) {
		search.setCurrentPage(1);
	}
		search.setPageSize(pageSize);
		
		Map<String, Object> map = communityService.listExCom(search);
		
		Page resultPage = new Page(search.getCurrentPage(),((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize); 

		
		return map;
	}		
	
}
