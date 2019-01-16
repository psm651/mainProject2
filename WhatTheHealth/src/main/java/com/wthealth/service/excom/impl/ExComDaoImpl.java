package com.wthealth.service.excom.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.wthealth.common.Search;
import com.wthealth.domain.Post;
import com.wthealth.service.excom.ExComDao;

@Repository("exComDaoImpl")
public class ExComDaoImpl implements ExComDao {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public ExComDaoImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addExCom(Post post) throws Exception {
		sqlSession.insert("ExComMapper.addExCom", post);
	}

	@Override
	public Post getExCom(String postNo) throws Exception {
		return sqlSession.selectOne("ExComMapper.getExCom", postNo);
	}

	@Override
	public List<Post> listExCom(Search search) throws Exception {
		System.out.println("search : " + search);
		System.out.println("listExCom : " + sqlSession.selectList("ExComMapper.listExCom", search));

		return sqlSession.selectList("ExComMapper.listExCom", search);
	}

	@Override
	public void updateExCom(Post post) throws Exception {
		sqlSession.update("ExComMapper.updateExCom", post);

	}

	@Override
	public void deleteExCom(String postNo) throws Exception {
		sqlSession.update("ExComMapper.deleteExCom", postNo);

	}

	@Override
	public List<Post> listExComRecom(Search search) throws Exception {
		System.out.println("search : " + search);
		System.out.println("listExComRecom : " + sqlSession.selectList("ExComMapper.listExComRecom", search));

		return sqlSession.selectList("ExComMapper.listExComRecom", search);
	}

	@Override
	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("ExComMapper.getTotalCount", search);
	}

}
