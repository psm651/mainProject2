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
	public Favorite addLike(Favorite favorite) throws Exception {
		return sqlSession.selectOne("FavoriteMapper.addLike", favorite);

	}

	@Override
	public Favorite addInterest(Favorite favorite) throws Exception {
		return sqlSession.selectOne("FavoriteMapper.addInterest", favorite);
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
	public Favorite getFavorite(Favorite favorite) throws Exception {
		return sqlSession.selectOne("FavoriteMapper.getFavorite", favorite);
	}
	
	@Override
	public List<User> listLikePeople(Search search,int postNo) throws Exception {
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
	public int getTotalCountByUserId(String userId) throws Exception {
		return sqlSession.selectOne("FavoriteMapper.getTotalCountByUserId", userId);
	}
	
	@Override
	public int getTotalCountByPostNo(int postNo) throws Exception {
		return sqlSession.selectOne("FavoriteMapper.getTotalCountByPostNo",postNo);
	}

	@Override
	public List<Favorite> listFavorite(Favorite favorite) throws Exception {
		return sqlSession.selectList("FavoriteMapper.listFavorite", favorite);
	}

	@Override
	public int getTotalCountByFavorite(String userId, int postNo, String favoriteType) throws Exception {				
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("postNo", postNo);
		map.put("favoriteType", favoriteType);
		
		return sqlSession.selectOne("FavoriteMapper.getTotalCountByFavorite",map);
	}

	@Override
	public int getTotalLikeCount(int postNo) throws Exception {
		return sqlSession.selectOne("FavoriteMapper.getTotalLikeCount", postNo);
	}

}
