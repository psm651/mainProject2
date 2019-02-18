package com.wthealth.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
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
import com.wthealth.domain.Post;
import com.wthealth.domain.User;
import com.wthealth.service.claim.ClaimService;
import com.wthealth.service.user.UserService;


//==> 회원관리 Controller
@RestController
@RequestMapping("/claim/*")
public class ClaimRestController {
	
	///Field
	@Autowired
	@Qualifier("claimServiceImpl")
	private ClaimService claimService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
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
	public Claim updateClaim( @PathVariable("claimNo") int claimNo,@PathVariable("claimStatus") String claimStatus,HttpServletResponse response ) throws Exception{

		System.out.println("/json/updateClaim : GET");
		//Business Logic
		Claim claim = claimService.getClaim(claimNo);
		claim.setClaimStatus(claimStatus);
		claimService.updateClaim(claim);
		if (claimService.claimCount(claim.getClaimedUserId())>=3) {
			User user = userService.getUser(claim.getClaimedUserId());
			user.setUserStatus("2");
			claimService.updateBlackUser(user);
			claimService.updatePostBlind(user.getUserId());
		}
		
		
		
		return claim;
	
	}
	
	@RequestMapping(value="json/addClaim", method = RequestMethod.POST)
	public String addClaim( @RequestBody Claim claim,  HttpSession session ) throws Exception {
		System.out.println(claim);
		System.out.println("/claim/json/addClaim : POST");

		//Business Logic
		claim.setUserId(((User)session.getAttribute("user")).getUserId());

		if (claimService.reduplication(claim)!=null) {
			return "0";
		}
		
		claimService.addClaim(claim);
		
		return "1";
		
	}
	
	@RequestMapping(value="json/getClaim/{targetNo}", method = RequestMethod.GET)
	public Claim getClaim(@PathVariable("targetNo") int claimNo) throws Exception {
		
		System.out.println(claimNo);
		//Business Logic
		Claim claim = claimService.getClaim(claimNo);
		
		return claim;
		
	}	
	
	@RequestMapping(value="json/getPost/{targetNo}", method = RequestMethod.GET)
	public Post getPost(@PathVariable("targetNo") int postNo) throws Exception {
		
		//Business Logic
		Post post = claimService.getClaimedPost(postNo);
		
		return post;
		
	}		
	
	@RequestMapping(value="json/getReply/{targetNo}", method = RequestMethod.GET)
	public Post getReply(@PathVariable("targetNo") int postNo) throws Exception {
			
		return claimService.getReplyPostLocation(postNo);
		
	}	
}