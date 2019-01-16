package com.wthealth.service.hashtag.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.wthealth.common.Search;
import com.wthealth.domain.HashTag;
import com.wthealth.service.hashtag.HashTagDao;

@Repository("hashTagDaoImpl")
public class HashTagDaoImpl implements HashTagDao {
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public HashTagDaoImpl() {
		System.out.println(this.getClass());
	}

	///Method
	@Override
	public void addHashTag(HashTag hashTag) throws Exception {
		sqlSession.insert("HashTagMapper.addHashTag", hashTag);
	}

	@Override
	public List<HashTag> listHashTag(Search search) throws Exception {
		
		return sqlSession.selectList("HashTagMapper.listHashTag", search);
	}

	@Override
	public void updateHashTag(List<HashTag> hashTag) throws Exception {
		sqlSession.delete("HashTagMapper.deleteHashTag", hashTag.get(0).getPostNo());
		for (int i = 0; i < hashTag.size(); i++) {
			sqlSession.insert("HashTagMapper.addHashTag", hashTag.get(i));
		}
		
	}

	@Override
	public void deleteHashTag(int postNo) {
		sqlSession.delete("HashTagMapper.deleteHashTag", postNo);		
	}

}
