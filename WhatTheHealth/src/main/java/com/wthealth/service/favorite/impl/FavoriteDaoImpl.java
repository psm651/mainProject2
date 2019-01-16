package com.wthealth.service.favorite.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.wthealth.common.Search;
import com.wthealth.domain.Favorite;
import com.wthealth.domain.Post;
import com.wthealth.domain.User;
import com.wthealth.service.favorite.FavoriteDao;

@Repository("favoriteDaoImpl")
public class FavoriteDaoImpl implements FavoriteDao {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public FavoriteDaoImpl() {
		System.out.println(this.getClass());
	}
	
	@Override
	public Favorite addLike(Favorite like) throws Exception {
		return sqlSession.selectOne("FavoriteMapper.addLike", like);

	}

	@Override
	public Favorite addInterest(Favorite interest) throws Exception {
		return sqlSession.selectOne("FavoriteMapper.addInterest", interest);
	}

	@Override
	public void deleteLike(int favoriteNo) throws Exception {
		sqlSession.delete("FavoriteMapper.deleteLike", favoriteNo);
	}

	@Override
	public void deleteInterest(int favoriteNo) throws Exception {
		sqlSession.delete("FavoriteMapper.deleteInterest", favoriteNo);
	}
	
	@Override
	public void updateLikeCount(String postNo) throws Exception{
		sqlSession.update("FavoriteMapper.updateLikeCount", postNo);
	}
	
	@Override
	public List<User> listLikePeople(Search search,String postNo) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("postNo", postNo);
		
		return sqlSession.selectList("FavoriteMapper.listLikePeople", map);
	}

	@Override
	public List<Favorite> listMyInterest(Search search, String userId) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("userId", userId);
		
		return sqlSession.selectList("FavoriteMapper.listMyInterest", map);
	}
	
	@Override
	public int getTotalCount(String userId) throws Exception {
		return sqlSession.selectOne("FavoriteMapper.getTotalCount", userId);
	}
}
