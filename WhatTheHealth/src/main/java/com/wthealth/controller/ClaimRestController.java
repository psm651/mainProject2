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


//==> ȸ������ Controller
@RestController
@RequestMapping("/claim/*")
public class ClaimRestController {
	
	///Field
	@Autowired
	@Qualifier("claimServiceImpl")
	private ClaimService claimService;
	//setter Method ���� ����
		
	public ClaimRestController(){
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
	
	

	@RequestMapping(value="json/updateClaim/{claimNo}/{claimStatus}", method=RequestMethod.GET)
	public Claim updateClaim( @PathVariable("claimNo") int claimNo,@PathVariable("claimStatus") String claimStatus ) throws Exception{

		System.out.println("/json/updateClaim : GET");
		//Business Logic
		Claim claim = claimService.getClaim(claimNo);
		claim.setClaimStatus(claimStatus);
		claimService.updateClaim(claim);
		/* ���߿� 3���̻� �Ű�� �Խù��̸� �ڵ� ����ε�, ����ε�Խù�3���̻��̸� ������Ʈ �߰�
		  claimService.listClaim()*/
		System.out.println("�̰�Ÿ�ߤ��ȴ�!!");
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