package com.wthealth.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wthealth.domain.User;
import com.wthealth.service.dietschedule.DietScheduleService;
import com.wthealth.service.exschedule.ExScheduleService;


//==> 회원관리 Controller
@Controller
@RequestMapping("/schedule/*")
public class ScheduleController {
	
	///Field
	@Autowired
	@Qualifier("dietScheduleServiceImpl")
	private DietScheduleService dietScheduleService;
	
	@Autowired
	@Qualifier("exScheduleServiceImpl")	
	private ExScheduleService exScheduleService;
	//setter Method 구현 않음
		
	public ScheduleController(){
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
	
/*	
	@RequestMapping(value="addProduct", method = RequestMethod.GET)
	public String addProduct() throws Exception {

		System.out.println("/product/addProduct : GET");
	
		
		return "redirect:/product/addProductView.jsp";
	}
	
	@RequestMapping(value="addProduct", method = RequestMethod.POST)
	public String addProduct( @ModelAttribute("product") Product product, @RequestParam("fileNa") MultipartFile file ) throws Exception {

		
		System.out.println("/product/addProduct : POST");
		//Business Logic
		File file1=new File("C:\\Users\\Bit\\git\\11PJT\\11.Model2MVCShop\\WebContent\\images\\uploadFiles\\",file.getOriginalFilename());
		
		file.transferTo(file1);
		product.setFileName(file.getOriginalFilename());
		productService.addProduct(product);
		
		return "forward:/product/addProductConform.jsp";
	}
	
	@RequestMapping(value="getProduct", method = RequestMethod.GET)
	public String getProduct( @RequestParam("prodNo") int prodNo ,@CookieValue(value="history", required=false) String history, HttpServletResponse response, Model model ) throws Exception {
		
		System.out.println("/product/getProduct : GET");
		//Business Logic
		Product product = productService.getProduct(prodNo);
		List<Product> map=new ArrayList<Product>();
		if (history==null || history.length()==0) {
			history = prodNo+"";
		}else {
			if (history.indexOf(prodNo+"")==-1) {
				history = prodNo+","+history;
			}			
			
		}
		
		Cookie cookie= new Cookie("history", history);
		cookie.setPath("/");
		response.addCookie(cookie);
		
		
		String[] h =history.split(",");
		
		for (int i = 0; i < h.length; i++) {
			
				
				Product cookieProduct=productService.getProduct(Integer.parseInt(h[i]));
			
				map.add(productService.getProduct(Integer.parseInt(h[i])));
			
		}
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@이게맵이다"+map);
		
		
		// Model 과 View 연결
		model.addAttribute("product", product);
		model.addAttribute("map", map);
		
		return "forward:/product/getProduct.jsp";
	}
	
	@RequestMapping(value="updateProduct", method=RequestMethod.GET)
	public String updateProduct( @RequestParam("prodNo") int prodNo , Model model ) throws Exception{

		System.out.println("/product/updateProduct : GET");
		//Business Logic
		Product product = productService.getProduct(prodNo);
		// Model 과 View 연결
		model.addAttribute("product", product);
		
		return "forward:/product/updateProductView.jsp";
	}
	
	@RequestMapping(value="updateProduct", method=RequestMethod.POST)
	public String updateProduct( @ModelAttribute("product") Product product , Model model) throws Exception{

		System.out.println("/product/updateProduct : GET");
		//Business Logic
		
		productService.updateProduct(product);
		
	
		return "redirect:/product/getProduct?prodNo="+product.getProdNo()+"&menu=manage";
	}
	*/
	@RequestMapping(value="listSchedule")
	public String listProduct(/*@RequestParam("userId") String userId,*/ Model model, HttpSession session) throws Exception{
		
		System.out.println("/listSchedule : GET / POST");
		String userId=((User)session.getAttribute("user")).getUserId();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("dietList", dietScheduleService.listDietSchedule(userId));
		map.put("exList", exScheduleService.listExSchedule(userId));
		

		// Model 과 View 연결
		model.addAttribute("dietList", map.get("dietList"));
		model.addAttribute("exList", map.get("exList"));

		
	
		
		return "forward:/schedule/listSchedule.jsp";
	}
}