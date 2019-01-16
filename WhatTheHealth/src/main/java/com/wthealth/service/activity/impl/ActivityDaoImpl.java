package com.wthealth.service.activity.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.wthealth.common.Search;
import com.wthealth.domain.Post;
import com.wthealth.service.activity.ActivityDao;

@Repository("activityDaoImpl")
public class ActivityDaoImpl implements ActivityDao {
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public ActivityDaoImpl() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}

	@Override
	public List<Post> listMyPost(Search search, String postId) throws Exception {
		// TODO Auto-generated method stub
		Map<String , Object>  map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("postId", postId);
		
		List<Post> list = sqlSession.selectList("ActivityMapper.listMyPost", map);
		
		System.out.println("listPost: "+list);
		return list;
	}

	@Override
	public int getTotalCount(String postId) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("ActivityMapper.getTotalCount", postId);
	}

}

