package com.wthealth.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.wthealth.common.Page;
import com.wthealth.common.Search;
import com.wthealth.domain.Favorite;
import com.wthealth.domain.Post;
import com.wthealth.domain.User;
import com.wthealth.service.favorite.FavoriteService;

@RestController
@RequestMapping("/favorite/*")
public class FavoriteRestController {
	
	@Autowired
	@Qualifier("favoriteServiceImpl")
	private FavoriteService favoriteService;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	public FavoriteRestController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value = "json/addLike/{postNo}", method = RequestMethod.GET)
	public int addLike(@ModelAttribute Favorite favorite, @PathVariable int postNo,HttpSession session) throws Exception{
		System.out.println("/favorite/json/addLike : GET");
		System.out.println(favorite);
		
		User user = (User)session.getAttribute("user");
		String userId = user.getUserId();
		favorite.setUserId(userId);
		favorite.setPostNo(postNo);
		
		//favoriteService.updateLikeCount(postNo);
		favoriteService.addLike(favorite);

		return 1;
	}
	
	@RequestMapping(value = "json/addInterest/{postNo}", method = RequestMethod.GET)
	public int addInterest(@ModelAttribute Favorite favorite, @PathVariable int postNo,HttpSession session) throws Exception{
		System.out.println("/favorite/json/addInterest : GET");
		System.out.println(favorite);
		
		User user = (User)session.getAttribute("user");
		String userId = user.getUserId();
		favorite.setUserId(userId);
		favorite.setPostNo(postNo);
		
		favoriteService.addInterest(favorite);
		
		return 1;
	}
	
	@RequestMapping(value = "json/deleteLike/{postNo}", method = RequestMethod.GET)
	public int deleteLike(@PathVariable int postNo, HttpSession session) throws Exception{
		System.out.println("/favorite/json/deleteLike : GET");	
		
		Favorite favorite = new Favorite();
		
		User user = (User)session.getAttribute("user");
		String userId = user.getUserId();
		favorite.setUserId(userId);
		favorite.setPostNo(postNo);
		favorite.setFavoriteType("0");
		
		Favorite deleteTarget = favoriteService.getFavorite(favorite);
		favoriteService.deleteLike(deleteTarget.getFavoriteNo());
		//dietComService.updateLikeCount(favorite.getPostNo());
		
		return 1;
	}
	
	@RequestMapping(value = "json/deleteInterest/{postNo}", method = RequestMethod.GET)
	public int deleteInterest(@PathVariable int postNo, HttpSession session) throws Exception{
		System.out.println("/favorite/json/deleteInterest : GET");
		Favorite favorite = new Favorite();
		
		User user = (User)session.getAttribute("user");
		String userId = user.getUserId();
		favorite.setUserId(userId);
		favorite.setPostNo(postNo);
		favorite.setFavoriteType("1");
		
		Favorite deleteTarget = favoriteService.getFavorite(favorite);
		favoriteService.deleteInterest(deleteTarget.getFavoriteNo());
		
		return 1;
	}
	
	@RequestMapping(value = "json/listLikePeople/{postNo}", method = RequestMethod.GET)  // 수정해야할듯.
	public Map<String, Object> listLikePeople(@ModelAttribute("search") Search search, @PathVariable int postNo) throws Exception{
		System.out.println("/favorite/json/listLikePeople : GET");
		System.out.println("search : "+search);
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String, Object> map = favoriteService.listLikePeople(search, postNo);
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(),pageUnit, pageSize); 
		
		map.put("search", search);
		map.put("postNo", postNo);
		
		return map;
	}
		
	@RequestMapping(value = "json/listFavorite/{postNo}", method = RequestMethod.GET)
	public List<Favorite> listFavorite(@ModelAttribute("favorite") Favorite favorite, @PathVariable int postNo, HttpSession session) throws Exception{
		System.out.println("/favorite/json/listFavorite : GET");
		
		User user = (User)session.getAttribute("user");
		String userId = user.getUserId();
		favorite.setUserId(userId);
		favorite.setPostNo(postNo);
		
		return favoriteService.listFavorite(favorite);
	}
}
