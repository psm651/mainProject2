package com.wthealth.service.dietcom.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.wthealth.common.Search;
import com.wthealth.domain.Post;
import com.wthealth.service.dietcom.DietComDao;

@Repository("dietComDaoImpl")
public class DietComDaoImpl implements DietComDao {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public DietComDaoImpl() {
		System.out.println(this.getClass());
	}
	
	@Override
	public void addDietCom(Post post) throws Exception {
		sqlSession.insert("DietComMapper.addDietCom", post);
	}
	
	@Override
	public Post getDietCom(String postNo) throws Exception {
		return sqlSession.selectOne("DietComMapper.getDietCom", postNo);
	}

	@Override
	public List<Post> listDietCom(Search search) throws Exception {
		System.out.println("search : " + search);
		System.out.println("listExCom : " + sqlSession.selectList("DietComMapper.listDietCom", search));

		return sqlSession.selectList("DietComMapper.listDietCom", search);
	}

	@Override
	public void updateDietCom(Post post) throws Exception {
		sqlSession.update("DietComMapper.updateDietCom", post);
	}

	@Override
	public void deleteDietCom(String postNo) throws Exception {
		sqlSession.update("DietComMapper.deleteDietCom", postNo);
	}

	@Override
	public List<Post> listDietComRecom(Search search) throws Exception {
		System.out.println("search : " + search);
		System.out.println("listDietComRecom : " + sqlSession.selectList("DietComMapper.listDietComRecom", search));

		return sqlSession.selectList("DietComMapper.listDietComRecom", search);
	}

	@Override
	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("DietComMapper.getTotalCount", search);
	}


}
