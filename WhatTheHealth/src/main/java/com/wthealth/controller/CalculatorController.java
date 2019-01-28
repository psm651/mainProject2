package com.wthealth.controller;

import java.io.File;
import java.util.Map;

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
import com.wthealth.service.exinfo.ExInfoService;
import com.wthealth.service.main.MainService;

@Controller
@RequestMapping("/calculator/*")
public class CalculatorController {

	//Field
	
	//Constructor
	public CalculatorController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="addDietSc", method=RequestMethod.GET)
	public String addDietSc(@RequestParam("dietScDate") String dietScDate, Model model) throws Exception{
		
		model.addAttribute("dietScdate", dietScDate);
		
		return "forward:/common/calorieCalculator.jsp";
	}
	
}