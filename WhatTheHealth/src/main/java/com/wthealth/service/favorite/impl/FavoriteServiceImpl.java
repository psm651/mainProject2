package com.wthealth.service.favorite.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.wthealth.common.Search;
import com.wthealth.domain.Favorite;
import com.wthealth.domain.Post;
import com.wthealth.domain.Refund;
import com.wthealth.domain.User;
import com.wthealth.service.favorite.FavoriteDao;
import com.wthealth.service.favorite.FavoriteService;

@Service("favoriteServiceImpl")
public class FavoriteServiceImpl implements FavoriteService {
	
	@Autowired
	@Qualifier("favoriteDaoImpl")
	private FavoriteDao favoriteDao;
	public void setFavoriteDao(FavoriteDao favoriteDao) {
		this.favoriteDao = favoriteDao;
	}
	
	public FavoriteServiceImpl() {
		System.out.println(this.getClass());
	}
	
	@Override
	public Favorite addLike(Favorite like) throws Exception {
		return favoriteDao.addLike(like);
	}

	@Override
	public Favorite addInterest(Favorite interest) throws Exception {
		return favoriteDao.addInterest(interest);
	}

	@Override
	public void deleteLike(int favoriteNo) throws Exception {
		favoriteDao.deleteLike(favoriteNo);
	}

	@Override
	public void deleteInterest(int favoriteNo) throws Exception {
		favoriteDao.deleteInterest(favoriteNo);
	}
	
	@Override
	public void updateLikeCount(String postNo) throws Exception{
		favoriteDao.updateLikeCount(postNo);
	}
	
	@Override
	public  Map<String, Object> listLikePeople(Search search,String postNo) throws Exception {
		List<User> list = favoriteDao.listLikePeople(search, postNo);
		int totalCount = favoriteDao.getTotalCount(postNo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		return map;
	}
	
	@Override
	public Map<String, Object> listMyInterest(Search search, String userId) throws Exception{
		List<Favorite> list = favoriteDao.listMyInterest(search, userId);
		int totalCount = favoriteDao.getTotalCount(userId);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		return map;
		
	}
	
}
