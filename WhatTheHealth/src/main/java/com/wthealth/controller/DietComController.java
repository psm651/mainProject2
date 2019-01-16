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
import javax.sound.midi.Synthesizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.wthealth.common.Page;
import com.wthealth.common.Search;
import com.wthealth.domain.Post;
import com.wthealth.service.dietcom.DietComService;

@Controller
@RequestMapping("/dietCom/*")
public class DietComController {
	
	@Autowired
	@Qualifier("dietComServiceImpl")
	private DietComService dietComService;
	
	public DietComController() {
		System.out.println(this.getClass());
	}
	
		@Value("#{commonProperties['pageUnit']}")
		int pageUnit;
		
		@Value("#{commonProperties['pageSize']}")
		int pageSize;
		
		
		@RequestMapping(value = "addDietCom", method = RequestMethod.GET)
		public String addDietCom() throws Exception{
			System.out.println("addDietCom : GET");
						 
			Post dietCom = new Post();
			dietCom.setUserId("user1");
			
			return "forward:/dietcom/addDietCom.jsp";
		}
		
		@RequestMapping(value = "addDietCom", method = RequestMethod.POST)
		public String addDietCom(@ModelAttribute("post") Post post, HttpSession session) throws Exception{
			System.out.println("/addDietCom : POST");
			
			dietComService.addDietCom(post);
			
			return "forward:/dietcom/getDietCom?postNo"+post.getPostNo();
		}
		
		@RequestMapping(value="profileUpload")
		   public void profileUpload(MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception{
			System.out.println("111111");
			
			dietComService.profileUpload(file, request, response);
		   } 
		
		@RequestMapping(value = "getDietCom", method = RequestMethod.GET)
		public String getDietCom(@RequestParam("postNo") String postNo, Model model) throws Exception{
			System.out.println("/getDietCom :GET");
			
			Post post = dietComService.getDietCom(postNo);
			model.addAttribute("post",post);
			
			return "forward:/dietcom/getDietCom.jsp";
		}
		
		@RequestMapping(value = "updateDietCom", method= RequestMethod.GET)
		public String updateDietCom(@ModelAttribute("post") Post post) throws Exception{
			System.out.println("/updateDietCom");
			
			dietComService.updateDietCom(post);
			
			return "redirect:/dietcom/updateDietCom?postNo="+post.getPostNo();
		}
		
		@RequestMapping(value="deleteDietCom", method = RequestMethod.POST)
		public String deleteDietCom(@RequestParam("post") String postNo, Model model) throws Exception{
			System.out.println("/deleteDietCom : POST");
			
			dietComService.deleteDietCom(postNo);
			
			return "redirect:/dietcom/listDietCom.jsp";
		}
		
		@RequestMapping(value="listDietCom")
		public String listDietCom(@ModelAttribute("search")Search search, Model model) throws Exception{
			System.out.println("/listDietCom");
			
			if(search.getCurrentPage() == 0) {
				search.setCurrentPage(1);
			}
			search.setPageSize(pageSize);
			
			Map<String, Object> map = dietComService.listDietCom(search);
			
			Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(),pageUnit, pageSize); 
			System.out.println(resultPage);
			
			model.addAttribute("list", map.get("list"));
			model.addAttribute("resultPage", resultPage);
			model.addAttribute("search", search);
			
			return "forward:/dietcom/listDietCom.jsp";
		}
		
		@RequestMapping(value="listDietComRecom")
		public String listDietComRecom(@ModelAttribute("search")Search search, Model model) throws Exception{
			System.out.println("/listDietComRecom");
			
			if(search.getCurrentPage() == 0) {
				search.setCurrentPage(1);
			}
			search.setPageSize(pageSize);
			
			Map<String, Object> map = dietComService.listDietComRecom(search);
			

			Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(),pageUnit, pageSize); 
			System.out.println(resultPage);
			
			model.addAttribute("list", map.get("list"));
			model.addAttribute("resultPage", resultPage);
			model.addAttribute("search", search);
			
			return "forward:/dietcom/listDietComRecom.jsp";
		}
		
}
