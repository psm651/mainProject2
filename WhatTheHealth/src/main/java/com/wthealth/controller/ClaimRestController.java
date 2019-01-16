package com.wthealth.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.wthealth.common.Search;
import com.wthealth.domain.Claim;
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
	
	

	@RequestMapping(value="json/updateClaim", method=RequestMethod.POST)
	public Claim updateClaim( @RequestBody Claim claim ) throws Exception{

		System.out.println("/json/updateClaim : POST");
		//Business Logic
		claimService.updateClaim(claim);
		/* ���߿� 3���̻� �Ű�� �Խù��̸� �ڵ� ����ε�, ����ε�Խù�3���̻��̸� ������Ʈ �߰�
		  claimService.listClaim()*/
		
		return claim;
	
	}
	
}