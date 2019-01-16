package com.wthealth.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.wthealth.common.Page;
import com.wthealth.common.Search;
import com.wthealth.domain.Favorite;
import com.wthealth.domain.Post;
import com.wthealth.domain.User;
import com.wthealth.service.favorite.FavoriteService;

@Controller
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
	
	@RequestMapping(value = "json/addLike", method = RequestMethod.POST)
	public Favorite addLike(@RequestBody Favorite like) throws Exception{
		System.out.println("/favorite/json/addLike : POST");
		
		return favoriteService.addLike(like);
	}
	
	@RequestMapping(value = "json/addInterest", method = RequestMethod.POST)
	public Favorite addInterest(@RequestBody Favorite interest) throws Exception{
		System.out.println("/favorite/json/addInterest : POST");
		
		return favoriteService.addInterest(interest);
	}
	
	@RequestMapping(value = "json/deleteLike/{favoriteNo}", method = RequestMethod.GET)
	public void deleteLike(@PathVariable int favoriteNo) throws Exception{
		System.out.println("/favorite/json/deleteLike : GET");	
		
		favoriteService.deleteLike(favoriteNo);
	}
	
	@RequestMapping(value = "json/deleteInterest/{favoriteNo}", method = RequestMethod.GET)
	public void deleteInterest(@PathVariable int favoriteNo) throws Exception{
		System.out.println("/favorite/json/deleteInterest : GET");
		
		favoriteService.deleteInterest(favoriteNo);
	}
	
	@RequestMapping(value = "json/listLikePeople/{postNo}", method = RequestMethod.POST)
	public Map<String, Object> listLikePeople(@ModelAttribute("search") Search search, @PathVariable String postNo) throws Exception{
		System.out.println("/favorite/json/listLikePeople : POST");
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
	
}
