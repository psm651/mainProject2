package com.wthealth.controller;

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

import com.wthealth.common.Page;
import com.wthealth.common.Search;
import com.wthealth.domain.Claim;
import com.wthealth.domain.Post;
import com.wthealth.domain.Reply;
import com.wthealth.service.claim.ClaimService;


//==> ȸ������ Controller
@Controller
@RequestMapping("/claim/*")
public class ClaimController {
	
	///Field
	@Autowired
	@Qualifier("claimServiceImpl")
	private ClaimService claimService;
	
	
	
	//setter Method ���� ����
		
	public ClaimController(){
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
	
	
	@RequestMapping(value="addClaimPost", method = RequestMethod.GET)
	public String addClaim(@RequestParam("targetNo") int targetNo, Model model) throws Exception {

		System.out.println("/addClaimPost : GET");
		Post claimedPost=claimService.getClaimedPost(targetNo);
		model.addAttribute("claimed", claimedPost);
		
	
		
		return "redirect:/claim/addClaim.jsp";
	}
	
	@RequestMapping(value="addClaimReply", method = RequestMethod.GET)
	public String addClaimReply(@RequestParam("targetNo") int targetNo, Model model) throws Exception {

		System.out.println("/addClaimReply : GET");
		Reply claimedReply = claimService.getClaimedReply(targetNo);
		model.addAttribute("claimed", claimedReply);
		
	
		
		return "redirect:/claim/addClaim.jsp";
	}
	
	@RequestMapping(value="addClaim", method = RequestMethod.POST)
	public String addClaim( @ModelAttribute("claim") Claim claim ) throws Exception {

		
		System.out.println("/addClaim : POST");
		//Business Logic
		
		claimService.addClaim(claim);
		//���� �����ϴ°�
		return "forward:/product/addProductConform.jsp";
	}

	@RequestMapping(value="listClaim")
	public String listProduct( @ModelAttribute("search") Search search ,Model model) throws Exception{
		
		System.out.println("/listClaim : GET / POST");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
	
		search.setPageSize(pageSize);
		search.setSearchKeyword(search.getSearchKeyword());
		// Business logic ����
		Map<String , Object> map=claimService.listClaim(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
	

		// Model �� View ����
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
	
		
		return "forward:/claim/listClaim.jsp";
	}
}