package com.wthealth.controller;
/*package com.wthealth.web.seongmin;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.wthealth.service.hashtag.HashTagService;



//==> 회원관리 Controller
@Controller
@RequestMapping("/hashTag/*")
public class HashTagController {
	
	///Field
	@Autowired
	@Qualifier("hashTagServiceImpl")
	private HashTagService hashTagService;
	
		
	public HashTagController(){
		System.out.println(this.getClass());
	}
	
	//==> classpath:config/common.properties  ,  classpath:config/commonservice.xml 참조 할것
	//==> 아래의 두개를 주석을 풀어 의미를 확인 할것
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	
	@RequestMapping(value="listProduct")
	public String listProduct( @ModelAttribute("search") Search search ,@CookieValue(value="history") String history, Model model , HttpServletResponse response, HttpServletRequest request) throws Exception{
		
		System.out.println("/product/listProduct : GET / POST23423423432");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
	
		search.setPageSize(pageSize);
		search.setOrder(search.getOrder());
		List<Product> list=new ArrayList<Product>();
		// Business logic 수행
		Map<String , Object> map=productService.getProductList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		Cookie cookie= new Cookie("history", history);
		cookie.setPath("/");
		response.addCookie(cookie);
		
	if (history!="" ) {
		
	
		String[] h =history.split(",");
		
		for (int i = 0; i < h.length; i++) {
			
				
				Product cookieProduct=productService.getProduct(Integer.parseInt(h[i]));
			
			list.add(productService.getProduct(Integer.parseInt(h[i])));
			
		}
		model.addAttribute("cookieList", list);
	}

		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
	
		
		return "forward:/product/listProduct.jsp";
	}
}*/