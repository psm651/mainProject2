package com.wthealth.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

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

}
