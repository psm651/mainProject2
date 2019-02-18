package com.wthealth.service.claim.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.wthealth.common.Search;
import com.wthealth.domain.Claim;
import com.wthealth.domain.Post;
import com.wthealth.domain.Reply;
import com.wthealth.domain.User;
import com.wthealth.service.claim.ClaimDao;

@Repository("claimDaoImpl")
public class ClaimDaoImpl implements ClaimDao {

	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public ClaimDaoImpl() {
		System.out.println(this.getClass());
	}

	///Method
	
	@Override
	public List<Claim> listClaim(Search search) throws Exception {
		
		return sqlSession.selectList("ClaimMapper.listClaim", search);
	}

	@Override
	public int addClaim(Claim claim) throws Exception {
		return sqlSession.insert("ClaimMapper.addClaim", claim);
		// TODO Auto-generated method stub
		
	}

	@Override
	public int updateClaim(Claim claim) throws Exception {
		return sqlSession.update("ClaimMapper.updateClaim", claim);
		
	}

	@Override
	public Claim getClaim(int claimNo) throws Exception {
		return sqlSession.selectOne("ClaimMapper.getClaim", claimNo);
	}

	@Override
	public Post getClaimedPost(int targetNo) {
		return sqlSession.selectOne("ClaimMapper.getClaimedPost",targetNo);
	}

	@Override
	public Reply getClaimedReply(int targetNo) {
		return sqlSession.selectOne("ClaimMapper.getClaimedReply",targetNo);
	}

	@Override
	public int getTotalCount(Search search) {
		return sqlSession.selectOne("ClaimMapper.getTotalCount",search);
	}

	@Override
	public Claim reduplication(Claim claim) throws Exception {
		
		return sqlSession.selectOne("ClaimMapper.reduplication",claim);
	}

	@Override
	public int claimCount(String userId) throws Exception {
		return sqlSession.selectOne("ClaimMapper.claimCount",userId);
	}

	@Override
	public void updateBlackUser(User user) throws Exception {
		sqlSession.update("ClaimMapper.updateBlackUser", user);
	}
	
	@Override
	public void updatePostBlind(String userId) throws Exception {
		sqlSession.update("ClaimMapper.updatePostBlind", userId);
	}

	@Override
	public Post getReplyPostLocation(int targetNo) throws Exception {
		int postNo = sqlSession.selectOne("ClaimMapper.getReplyPostLocation", targetNo);
		return sqlSession.selectOne("ClaimMapper.getClaimedPost",postNo);
	}


	

}
