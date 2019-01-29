package com.wthealth.service.community.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.wthealth.common.Search;
import com.wthealth.domain.Post;
import com.wthealth.service.community.CommunityDao;

@Repository("communityDaoImpl")
public class CommunityDaoImpl implements CommunityDao {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public CommunityDaoImpl() {
		System.out.println(this.getClass());
	}
	
	@Override
	public void addExCom(Post post) throws Exception {
		sqlSession.insert("CommunityMapper.addExCom", post);
	}
	
	@Override
	public void addDietCom(Post post) throws Exception {
		sqlSession.insert("CommunityMapper.addDietCom", post);
	}
	
	@Override
	public Post getCommunity(int postNo) throws Exception {
		return sqlSession.selectOne("CommunityMapper.getCommunity", postNo);
	}

	@Override
	public List<Post> listExCom(Search search) throws Exception {
		System.out.println("search : " + search);
		System.out.println("listExCom : " + sqlSession.selectList("CommunityMapper.listExCom", search));

		return sqlSession.selectList("CommunityMapper.listExCom", search);
	}
	
	@Override
	public List<Post> listDietCom(Search search) throws Exception {
		System.out.println("search : " + search);
		System.out.println("listDietCom : " + sqlSession.selectList("CommunityMapper.listDietCom", search));

		return sqlSession.selectList("CommunityMapper.listDietCom", search);
	}

	@Override
	public void updateCommunity(Post post) throws Exception {
		sqlSession.update("CommunityMapper.updateCommunity", post);
	}
	
	@Override
	public void updateClickCount(Post post) throws Exception {
		sqlSession.update("CommunityMapper.updateClickCount", post);
		
	}
	
	@Override
	public void updateLikeCount(Post post) throws Exception {
		sqlSession.update("CommunityMapper.updateLikeCount", post);
	}

	@Override
	public void deleteCommunity(int postNo) throws Exception {
		sqlSession.update("CommunityMapper.deleteCommunity", postNo);
	}

	@Override
	public List<Post> listExComRecom(Search search) throws Exception {
		System.out.println("search : " + search);
		System.out.println("listExComRecom : " + sqlSession.selectList("CommunityMapper.listExComRecom", search));

		return sqlSession.selectList("CommunityMapper.listExComRecom", search);
	}
	
	@Override
	public List<Post> listDietComRecom(Search search) throws Exception {
		System.out.println("search : " + search);
		System.out.println("listDietComRecom : " + sqlSession.selectList("CommunityMapper.listDietComRecom", search));

		return sqlSession.selectList("CommunityMapper.listDietComRecom", search);
	}

	@Override
	public int getTotalCountForEC(Search search) throws Exception {
		return sqlSession.selectOne("CommunityMapper.getTotalCountForEC", search);
	}
	
	@Override
	public int getTotalCountForDC(Search search) throws Exception {
		return sqlSession.selectOne("CommunityMapper.getTotalCountForDC", search);
	}

	
}
