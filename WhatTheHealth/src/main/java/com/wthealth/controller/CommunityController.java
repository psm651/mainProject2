package com.wthealth.controller;

import java.io.File;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.wthealth.common.Page;
import com.wthealth.common.Search;
import com.wthealth.domain.Favorite;
import com.wthealth.domain.Post;
import com.wthealth.domain.User;
import com.wthealth.service.community.CommunityService;
import com.wthealth.service.favorite.FavoriteService;
import com.wthealth.service.main.MainService;

@Controller
@RequestMapping("/community/*")
public class CommunityController {
	
	@Autowired
	@Qualifier("communityServiceImpl")
	private CommunityService communityService;
	
	@Autowired
	@Qualifier("favoriteServiceImpl")
	private FavoriteService favoriteService;
	
	@Autowired
	@Qualifier("mainServiceImpl")
	private MainService mainService;
	
	public CommunityController() {
		System.out.println(this.getClass());
	}
	
		@Value("#{commonProperties['pageUnit']}")
		int pageUnit;
		
		@Value("#{commonProperties['pageSize']}")
		int pageSize;
		
//////////ExCom/////////////
		@RequestMapping(value = "addExCom", method = RequestMethod.GET)
		public String addExCom() throws Exception{
			System.out.println("/addExCom : GET");
									
			return "forward:/community/addExCom.jsp";
		}
		
		@RequestMapping(value = "addExCom", method = RequestMethod.POST)
		public String addExCom(@ModelAttribute("post") Post post, HttpSession session) throws Exception{
			System.out.println("/addExCom : POST");
			
			User user = (User)session.getAttribute("user");
			post.setUserId(user.getUserId());
			
			communityService.addExCom(post);
			if(post.getContents().indexOf("upload/") != -1) {
				mainService.updateThumbnail(post);
			}else if(post.getContents().indexOf("embed/") != -1){
				mainService.updateYoutubeThumbnail(post);
			}
			
			return "redirect:/community/getCommunity?postNo="+post.getPostNo();
		}
		
//////DietCom/////////////
		@RequestMapping(value = "addDietCom", method = RequestMethod.GET)
		public String addDietCom() throws Exception{
			System.out.println("/addDietCom : GET");
									
			return "forward:/community/addDietCom.jsp";
		}
		
		@RequestMapping(value = "addDietCom", method = RequestMethod.POST)
		public String addDietCom(@ModelAttribute("post") Post post, HttpSession session) throws Exception{
			System.out.println("/addDietCom : POST");
			
			User user = (User)session.getAttribute("user");
			post.setUserId(user.getUserId());
			
			communityService.addDietCom(post);
			if(post.getContents().indexOf("upload/") != -1) {
				mainService.updateThumbnail(post);
			}else if(post.getContents().indexOf("embed/") != -1){
				mainService.updateYoutubeThumbnail(post);
			}
			
			return "redirect:/community/getCommunity?postNo="+post.getPostNo();
		}
		
		@RequestMapping(value = "getCommunity", method = RequestMethod.GET)
		public String getCommunity(@RequestParam("postNo") int postNo, Model model) throws Exception{
			System.out.println("/getCommunity :GET");
			
			Post post = communityService.getCommunity(postNo);
			////////////////////for SummerNote//////////////////////
			String contents = post.getContents();
			post.setContents(contents.substring(1));
			System.out.println(contents);
			////////////////////for SummerNote//////////////////////
			
			int clickCount = post.getClickCount();
			clickCount++;
			post.setClickCount(clickCount);
			communityService.updateClickCount(post);

			int totalLikeCount = favoriteService.getTotalLikeCount(postNo);
			post.setLikeCount(totalLikeCount);
			communityService.updateLikeCount(post);
			
			model.addAttribute("post",post);
			
			return "forward:/community/getCommunity.jsp";
		}
		
		@RequestMapping(value = "updateCommunity", method= RequestMethod.GET)
		public String updateCommunity(@RequestParam("postNo") int postNo, Model model) throws Exception{
			System.out.println("/updateCommunity : GET");
			
			Post post = communityService.getCommunity(postNo);
			
			model.addAttribute("post",post);
			
			return "forward:/community/updateCommunity.jsp";
		}
		
		@RequestMapping(value = "updateCommunity", method= RequestMethod.POST)
		public String updateCommunity(@ModelAttribute("post") Post post, @RequestParam("postNo") int postNo) throws Exception{
			System.out.println("/updateCommunity : POST");
			
			communityService.updateCommunity(post);
			
			if(post.getContents().indexOf("upload/") != -1) {
				mainService.updateThumbnail(post);
			}else if(post.getContents().indexOf("embed/") != -1){
				mainService.updateYoutubeThumbnail(post);
			}
			return "redirect:/community/getCommunity?postNo="+post.getPostNo();
		}
		
		@RequestMapping(value="deleteExCom", method=RequestMethod.GET)
		public String deleteExCom(@RequestParam("postNo") int postNo) throws Exception{
			System.out.println("/deleteExCom : GET");
			
			communityService.deleteCommunity(postNo);
			
			return "redirect:/community/listExCom";
		}
		
		@RequestMapping(value="deleteDietCom", method=RequestMethod.GET)
		public String deleteDietCom(@RequestParam("postNo") int postNo) throws Exception{
			System.out.println("/deleteDietCom : GET");
			
			communityService.deleteCommunity(postNo);
			
			return "redirect:/community/listDietCom";
		}
		
//////ExCom/////////////		
		@RequestMapping(value="listExCom")
		public String listExCom(@ModelAttribute("search")Search search, Model model) throws Exception{
			System.out.println("/listExCom");
			
			if(search.getCurrentPage() == 0) {
				search.setCurrentPage(1);
			}
			search.setPageSize(pageSize);
			
			Map<String, Object> map = communityService.listExCom(search);
			
			Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(),pageUnit, pageSize); 
			System.out.println(resultPage);
			
			model.addAttribute("list", map.get("list"));
			model.addAttribute("resultPage", resultPage);
			model.addAttribute("search", search);
			
			return "forward:/community/listExCom.jsp";
		}
		
		@RequestMapping(value="listExComRecom")
		public String listExComRecom(@ModelAttribute("search")Search search, Model model) throws Exception{
			System.out.println("/listExComRecom");
			
			if(search.getCurrentPage() == 0) {
				search.setCurrentPage(1);
			}
			search.setPageSize(pageSize);
			
			Map<String, Object> map = communityService.listExComRecom(search);
			
			Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(),pageUnit, pageSize); 
			System.out.println(resultPage);
			
			model.addAttribute("list", map.get("list"));
			model.addAttribute("resultPage", resultPage);
			model.addAttribute("search", search);
			
			return "forward:/main.jsp";
		}
		
//////////DietCom///////////////
		@RequestMapping(value="listDietCom")
		public String listDietCom(@ModelAttribute("search")Search search, Model model) throws Exception{
			System.out.println("/listDietCom");
			
			if(search.getCurrentPage() == 0) {
				search.setCurrentPage(1);
			}
			search.setPageSize(pageSize);
			
			Map<String, Object> map = communityService.listDietCom(search);
			
			Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(),pageUnit, pageSize); 
			System.out.println(resultPage);
			
			model.addAttribute("list", map.get("list"));
			model.addAttribute("resultPage", resultPage);
			model.addAttribute("search", search);
			
			return "forward:/community/listDietCom.jsp";
		}
		
		@RequestMapping(value="listDietComRecom")
		public String listDietComRecom(@ModelAttribute("search")Search search, Model model) throws Exception{
			System.out.println("/listDietComRecom");
			
			if(search.getCurrentPage() == 0) {
				search.setCurrentPage(1);
			}
			search.setPageSize(pageSize);
			
			Map<String, Object> map = communityService.listDietComRecom(search);
			

			Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(),pageUnit, pageSize); 
			System.out.println(resultPage);
			
			model.addAttribute("list", map.get("list"));
			model.addAttribute("resultPage", resultPage);
			model.addAttribute("search", search);
			
			return "forward:/main.jsp";
		}
		
}
