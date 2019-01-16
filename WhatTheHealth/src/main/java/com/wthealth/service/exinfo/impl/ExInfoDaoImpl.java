package com.wthealth.service.exinfo.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.wthealth.common.Search;
import com.wthealth.domain.Post;
import com.wthealth.service.exinfo.ExInfoDao;

@Repository("exInfoDaoImpl")
public class ExInfoDaoImpl implements ExInfoDao{

	//Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	
	//Constructor
	public ExInfoDaoImpl() {
		System.out.println(this.getClass());
	}
	@Override
	public int addExInfo(Post post) throws Exception {		
		return sqlSession.insert("ExInfoMapper.addExInfo", post);
	}

	@Override
	public void addPost(Post post) throws Exception{
		sqlSession.insert("ExInfoMapper.addPost", post);
	}
	
	@Override
	public Post getExInfo(String postNo) throws Exception {
		return sqlSession.selectOne("ExInfoMapper.getExInfo", postNo);
	}

	@Override
	public void updateExInfo(Post post) throws Exception {
		sqlSession.update("ExInfoMapper.updateExInfo", post);
	}

	@Override
	public void updatePost(Post post) throws Exception {
		sqlSession.update("ExInfoMapper.updatePost", post);
	}

	@Override
	public List<Post> listExInfo(Search search) throws Exception {
		return sqlSession.selectList("ExInfoMapper.listExInfoPost", search);
	}

	//@Override
	public List<Post> listExInfo(String Weather) throws Exception {
		return sqlSession.selectList("ExInfoMapper.listExInfoPost", Weather);
	}
	@Override
	public int getTotalCount(Search search) throws Exception{
		return sqlSession.selectOne("ExInfoMapper.getTotalCount", search);
	}
	




	
	

}
