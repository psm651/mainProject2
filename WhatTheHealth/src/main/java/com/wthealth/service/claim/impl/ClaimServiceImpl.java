package com.wthealth.service.claim.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.wthealth.common.Search;
import com.wthealth.domain.Claim;
import com.wthealth.domain.Post;
import com.wthealth.domain.Reply;
import com.wthealth.domain.User;
import com.wthealth.service.claim.ClaimDao;
import com.wthealth.service.claim.ClaimService;

@Service("claimServiceImpl")
public class ClaimServiceImpl implements ClaimService {

	///Field
	@Autowired
	@Qualifier("claimDaoImpl")
	private ClaimDao claimDao;
	
	public void setClaimDao(ClaimDao claimDao) {
		this.claimDao = claimDao;
	}
	///Constructor
	public ClaimServiceImpl() {
		System.out.println(this.getClass());
	}

	///Method
	
	@Override
	public int addClaim(Claim claim) throws Exception {
		
		return claimDao.addClaim(claim);

	}
 
	@Override
	public int updateClaim(Claim claim) throws Exception {
		
		return claimDao.updateClaim(claim);
		
	}
	@Override
	public Map<String, Object> listClaim(Search search) throws Exception {
		List<Claim> list = claimDao.listClaim(search);
		int totalCount = claimDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		return map;
	}
	@Override
	public Claim getClaim(int claimNo) throws Exception {
	
		return claimDao.getClaim(claimNo);
	}
	@Override
	public Post getClaimedPost(int targetNo) throws Exception {
		
		return claimDao.getClaimedPost(targetNo);
	}
	@Override
	public Reply getClaimedReply(int targetNo) throws Exception {
		return claimDao.getClaimedReply(targetNo);
	}
	@Override
	public Claim reduplication(Claim claim) throws Exception {
		
		return claimDao.reduplication(claim);
	}
	@Override
	public int claimCount(String userId) throws Exception {
		return claimDao.claimCount(userId);
	}
	@Override
	public void updateBlackUser(User user) throws Exception {
		claimDao.updateBlackUser(user);
		
	}
	@Override
	public void updatePostBlind(String userId) throws Exception {
		claimDao.updatePostBlind(userId);
		
	}
	@Override
	public Post getReplyPostLocation(int targetNo) throws Exception {
		return claimDao.getReplyPostLocation(targetNo);
	}


}
