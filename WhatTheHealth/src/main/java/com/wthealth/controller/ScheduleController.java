package com.wthealth.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.wthealth.domain.DietSchedule;
import com.wthealth.domain.ExSchedule;
import com.wthealth.domain.User;
import com.wthealth.service.dietschedule.DietScheduleService;
import com.wthealth.service.exschedule.ExScheduleService;


//==> ȸ������ Controller
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
	//setter Method ���� ����
		
	public ScheduleController(){
		System.out.println(this.getClass());
	}
	
	//==> classpath:config/common.properties  ,  classpath:config/commonservice.xml ���� �Ұ�
	//==> �Ʒ��� �ΰ��� �ּ��� Ǯ�� �ǹ̸� Ȯ�� �Ұ�
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	

	@RequestMapping(value="addExSchedule", method = RequestMethod.GET)
	public String addProduct(Model model, @RequestParam("date") String date) throws Exception {

		System.out.println("/schedule/addExSchedule : GET");
		model.addAttribute("ExScDate", date);
		
		return "forward:/schedule/addEx.jsp";
	}
	
	
	@RequestMapping(value="getExSchedule", method = RequestMethod.GET)
	public String getExSchedule(Model model, @RequestParam("exScNo") int exScNo) throws Exception {
		System.out.println("운동넘버123123"+exScNo);
		System.out.println("/schedule/getExSchedule : GET");
		
		model.addAttribute("exSchedule", exScheduleService.getExSchedule(exScNo));
		
		return "forward:/schedule/getEx.jsp";
	}
	
	@RequestMapping(value="getDietSchedule", method = RequestMethod.GET)
	public String getDietSchedule(Model model, @RequestParam("dietScNo") int dietScNo) throws Exception {
		System.out.println("식단넘버다"+dietScNo);
		System.out.println("/schedule/getDietSchedule : GET");
		//dietScheduleService.list
		model.addAttribute("food", dietScheduleService.listFood(dietScNo));
		
		System.out.println(dietScheduleService.listFood(dietScNo).get(2));
		model.addAttribute("dietSchedule", dietScheduleService.getDietSchedule(dietScNo));
		
		return "forward:/schedule/getDiet.jsp";
	}
	/*		
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
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@�̰Ը��̴�"+map);
		
		
		// Model �� View ����
		model.addAttribute("product", product);
		model.addAttribute("map", map);
		
		return "forward:/product/getProduct.jsp";
	}
	
	@RequestMapping(value="updateProduct", method=RequestMethod.GET)
	public String updateProduct( @RequestParam("prodNo") int prodNo , Model model ) throws Exception{

		System.out.println("/product/updateProduct : GET");
		//Business Logic
		Product product = productService.getProduct(prodNo);
		// Model �� View ����
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
	@RequestMapping(value="getHistoryChart")
	public String getHistoryChart(/*@RequestParam("userId") String userId,*/ Model model, HttpSession session) throws Exception{
		System.out.println("/getHistoryChart : GET / POST");
		String userId=((User)session.getAttribute("user")).getUserId();
		
		List<ExSchedule> exList = exScheduleService.getExHistoryChart(userId);
		
		List calList = new ArrayList();
		//int cal=0;
		
		Calendar now = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		now.setTime(sdf.parse("2019-01-29"));
		/*System.out.println("년"+now.get(1));
		System.out.println("월"+now.get(2));
		System.out.println("일"+now.get(5));
		*/
		
		System.out.println("현재몇주차인지 데이터타입"+(now.get(now.WEEK_OF_YEAR )+"").getClass());
		System.out.println("db에서 받아온 날짜 데이터타입"+(exList.get(2).getExScDate()).getClass());
		System.out.println((now.get(now.WEEK_OF_YEAR ))+"");
		
	
		for (int j = 0; j < 53; j++) {
			int cal=0;
			for (int i = 0; i < exList.size(); i++) {
				now.setTime(sdf.parse(exList.get(i).getExScDate()));
				if (j ==now.get(now.WEEK_OF_YEAR )) {
					if (!exList.get(i).getDeleteStatus().equals("1")) {
						cal+=exList.get(i).getExScCalorie();
					}
				}
			}
			calList.add(j, cal);
			System.out.println(j+"주차"+calList.get(j));
		}
		
		
		
		
		//List<DietSchedule> dietList = dietScheduleService.getExHistoryChart(userId);
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("dietList", dietScheduleService.listDietSchedule(userId));
		map.put("exList", exScheduleService.listExSchedule(userId));
		
		
		System.out.println("123123123123"+map.get("exList"));

		// Model �� View ����
		model.addAttribute("dietList", map.get("dietList"));
		model.addAttribute("exList", map.get("exList"));
		model.addAttribute("exCalorie", calList);
		System.out.println("맵이다"+calList);

		
	
		
		return "forward:/schedule/historyChart.jsp";
	}
	
	@RequestMapping(value="listSchedule")
	public String listProduct(/*@RequestParam("userId") String userId,*/ Model model, HttpSession session) throws Exception{
		System.out.println("/listSchedule : GET / POST");
		String userId=((User)session.getAttribute("user")).getUserId();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("dietList", dietScheduleService.listDietSchedule(userId));
		map.put("exList", exScheduleService.listExSchedule(userId));
		//map.compute("mealList", dietScheduleService.list)
		
		

		// Model �� View ����
		model.addAttribute("dietList", map.get("dietList"));
		model.addAttribute("exList", map.get("exList"));
		
		System.out.println("맵이다"+map.get("exList"));
		System.out.println("다이어트리스ㅡㅌ"+map.get("dietList"));
		
	
		
		return "forward:/schedule/listSchedule.jsp";
	}
}