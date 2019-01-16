package com.wthealth.service.main.impl;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.wthealth.common.Search;
import com.wthealth.domain.Post;
import com.wthealth.service.main.MainDao;

@Repository("mainDaoImpl")
public class MainDaoImpl implements MainDao {

	//Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	
	//Constructor
	public MainDaoImpl() {
		System.out.println(this.getClass());
	}
	
	@Override
	public List<Post> listSearchMain(Search search) throws Exception {
		return sqlSession.selectList("MainMapper.listSearchMain", search);
	}

	@Override
	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("MainMapper.getTotalCount", search);
	}

}
