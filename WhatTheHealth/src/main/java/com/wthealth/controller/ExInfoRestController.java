package com.wthealth.controller;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.wthealth.common.Page;
import com.wthealth.common.Search;
import com.wthealth.domain.Post;
import com.wthealth.service.exinfo.ExInfoService;

@RestController
@RequestMapping("/exinfo/*")
public class ExInfoRestController {

	//Field
	@Autowired
	@Qualifier("exInfoServiceImpl")
	private ExInfoService exInfoService;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	public ExInfoRestController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="json/listExInfo", method=RequestMethod.POST)
	public Map<String, Object> listExInfo(@RequestBody Search search) throws Exception{
		
		System.out.println("rest");
		if(search.getCurrentPage()==0) {
		search.setCurrentPage(1);
	}
		search.setPageSize(pageSize);
		
		Map<String, Object> map = exInfoService.listExInfo(search);
		
		Page resultPage = new Page(search.getCurrentPage(),((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize); 

		
		return map;
	}
	
	@RequestMapping(value="json/listExInfoAd", method=RequestMethod.POST)
	public List<Post> listExInfoAd(@RequestBody Search search) throws Exception{
	      
	      System.out.println("rest");
	      if(search.getCurrentPage()==0) {
	      search.setCurrentPage(1);
	   }
	      search.setPageSize(pageSize);
	      
	      Map<String, Object> map = exInfoService.listExInfo(search);
	      List<Post> list = (List<Post>) map.get("list");
	      
	      Page resultPage = new Page(search.getCurrentPage(),((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize); 
	      
	      return list;
	   }
	
	@RequestMapping(value="json/getWeather/{cityName}", method=RequestMethod.GET)
	public Map<String, Object> getWeather(@PathVariable String cityName) throws Exception{
		
		Map<String, Object> map = exInfoService.listWeatherRecom(cityName);
		
		return map;
	}
	
   @RequestMapping(value="json/listExInfoRecom")
   public List<Post> listExInfoRecom(@ModelAttribute("search")Search search, Model model) throws Exception{
      System.out.println("/listExInfoRecom");
      
      if(search.getCurrentPage() == 0) {
         search.setCurrentPage(1);
      }
      search.setPageSize(pageSize);
      
      Map<String, Object> map = exInfoService.listExInfoRecom(search);
       List<Post> list = (List<Post>) map.get("exInfoList");
      
      Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(),pageUnit, pageSize); 
      System.out.println(resultPage);
      
      model.addAttribute("list", map.get("list"));
      model.addAttribute("resultPage", resultPage);
      model.addAttribute("search", search);
      
      return list;
   }
	
	
}
