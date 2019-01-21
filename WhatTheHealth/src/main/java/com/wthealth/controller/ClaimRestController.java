package com.wthealth.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.wthealth.domain.Claim;
import com.wthealth.domain.User;
import com.wthealth.service.claim.ClaimService;


//==> 회원관리 Controller
@RestController
@RequestMapping("/claim/*")
public class ClaimRestController {
	
	///Field
	@Autowired
	@Qualifier("claimServiceImpl")
	private ClaimService claimService;
	//setter Method 구현 않음
		
	public ClaimRestController(){
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
	
	

	@RequestMapping(value="json/updateClaim/{claimNo}/{claimStatus}", method=RequestMethod.GET)
	public Claim updateClaim( @PathVariable("claimNo") int claimNo,@PathVariable("claimStatus") String claimStatus ) throws Exception{

		System.out.println("/json/updateClaim : GET");
		//Business Logic
		Claim claim = claimService.getClaim(claimNo);
		claim.setClaimStatus(claimStatus);
		claimService.updateClaim(claim);
		/* 나중에 3개이상 신고된 게시물이면 자동 블라인드, 블라인드게시물3개이상이면 블랙리스트 추가
		  claimService.listClaim()*/
		System.out.println("이걸타야ㅐ된다!!");
		return claim;
	
	}
	
	@RequestMapping(value="json/addClaim", method = RequestMethod.POST)
	public void addClaim( @RequestBody Claim claim, HttpSession session ) throws Exception {
		System.out.println(claim);
		System.out.println("/claim/json/addClaim : POST");
		//Business Logic
		
		claim.setUserId(((User)session.getAttribute("user")).getUserId());
		
		claimService.addClaim(claim);
	
		
	}
}