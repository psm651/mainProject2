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
    
/*      Map<String, Object> ex= communityService.listExComRecom(search);   
      Map<String, Object> diet = communityService.listDietComRecom(search);
      Map<String, Object> meeting = meetingService.listMeeting(search);
      List<Post> exInfo = exInfoService.listExInfo(Weather);*/
      
      
      
/*      if(search.getCurrentPage()==0) {
         search.setCurrentPage(1);
      }
      
      search.setPageSize(pageSize);*/
      
      
      
      return "main.jsp" ;
   }
   
   @RequestMapping(value="listSearchMain", method=RequestMethod.GET)
   public String listSearchMain(@ModelAttribute Search search, Model model) throws Exception{
      
      if(search.getCurrentPage()==0) {
         search.setCurrentPage(1);
      }
      search.setPageSize(1);
      
      //Business Logic
      Map<String, Object> map = mainService.listSearchMain(search);
      
      Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
      
      //MV
      model.addAttribute("list", map.get("list"));
      model.addAttribute("resultPage", resultPage);
      model.addAttribute("search", search);
      
      return "forward:/main/listSearchMain.jsp";
         
   }

   @RequestMapping(value="profileUpload")
    public void profileUpload(MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception{
      System.out.println("111111");
    
       mainService.profileUpload(file, request, response);
    }    
   

   
}