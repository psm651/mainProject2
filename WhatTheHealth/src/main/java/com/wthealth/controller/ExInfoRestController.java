package com.wthealth.controller;


import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.wthealth.common.Page;
import com.wthealth.common.Search;
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
		
		if(search.getCurrentPage()==0) {
		search.setCurrentPage(1);
	}
		search.setPageSize(pageSize);
		
		Map<String, Object> map = exInfoService.listExInfo(search);
		
		Page resultPage = new Page(search.getCurrentPage(),((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize); 

		
		return map;
	}
}
