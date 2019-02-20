package com.wthealth.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.eclipse.jdt.internal.compiler.batch.Main;
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
import com.wthealth.service.community.CommunityService;
import com.wthealth.service.exinfo.ExInfoService;
import com.wthealth.service.main.MainService;
import com.wthealth.service.meeting.MeetingService;

@Controller
@RequestMapping("/*")
public class MainController {

   //Field
   @Autowired
   @Qualifier("mainServiceImpl")
   private MainService mainService;
   @Autowired
   @Qualifier("exInfoServiceImpl")
   private ExInfoService exInfoService;
   @Autowired
   @Qualifier("communityServiceImpl")
   private CommunityService communityService;
   @Autowired
   @Qualifier("meetingServiceImpl")
   private MeetingService meetingService;
   
   
   public MainController() {
      System.out.println(this.getClass());
   }
   
   @Value("#{commonProperties['pageUnit']}")
      int pageUnit;   

   @Value("#{commonProperties['pageSize']}")
      int pageSize;
   
   @RequestMapping(value="/", method=RequestMethod.GET)
   public String getMainPage(@ModelAttribute("search") Search search, Model model) throws Exception{
      System.out.println("MainController Come in");
      
      if(search.getCurrentPage()==0) {
          search.setCurrentPage(1);
       }
       
       search.setPageSize(pageSize);
    
      Map<String, Object> exCom= communityService.listExComRecom(search);   
      Map<String, Object> dietCom = communityService.listDietComRecom(search);
 
                
      //날씨별 운동추천 프로그램  
      String mainCityName = "Seoul";
      Map<String, Object> weatherRecom = exInfoService.listWeatherRecom(mainCityName);
      

	  
	  model.addAttribute("weather", weatherRecom.get("weather"));
	  model.addAttribute("weatherList", weatherRecom.get("weatherRecom"));
	  model.addAttribute("weatherCode", weatherRecom.get("weatherCode"));
	  
	  model.addAttribute("exComList", exCom.get("exComList"));
	  model.addAttribute("dietComList", dietCom.get("dietComList"));

	  model.addAttribute("search", search);
      
      return "main.jsp";
   }
   


   @RequestMapping(value="profileUpload")
    public void profileUpload(MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception{
      System.out.println("111111");
    
       mainService.profileUpload(file, request, response);
    }    
   

   
}