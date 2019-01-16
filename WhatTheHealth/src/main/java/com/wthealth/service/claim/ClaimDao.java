package com.wthealth.service.claim;

import java.util.List;

import com.wthealth.common.Search;
import com.wthealth.domain.Claim;
import com.wthealth.domain.Post;
import com.wthealth.domain.Reply;

public interface ClaimDao {

	public List<Claim> listClaim(Search search) throws Exception;
	
	public int addClaim(Claim claim) throws Exception;
	
	public int updateClaim(Claim claim) throws Exception; 
	
	public Claim getClaim(int claimNo) throws Exception;

	public Post getClaimedPost(int targetNo);

	public Reply getClaimedReply(int targetNo);
	
}
