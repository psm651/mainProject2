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
	public Favorite addLike(Favorite favorite) throws Exception {
		return favoriteDao.addLike(favorite);
	}

	@Override
	public Favorite addInterest(Favorite favorite) throws Exception {
		return favoriteDao.addInterest(favorite);
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
	public Favorite getFavorite(Favorite favorite) throws Exception {
		return favoriteDao.getFavorite(favorite);
	}
	
	@Override
	public  Map<String, Object> listLikePeople(Search search,int postNo) throws Exception {
		List<User> list = favoriteDao.listLikePeople(search, postNo);
		int totalCount = favoriteDao.getTotalCountByPostNo(postNo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		return map;
	}
	
	@Override
	public Map<String, Object> listMyInterest(Search search, String userId) throws Exception{
		List<Favorite> list = favoriteDao.listMyInterest(search, userId);
		int totalCount = favoriteDao.getTotalCountByUserId(userId);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		return map;
		
	}

	@Override
	public List<Favorite> listFavorite(Favorite favorite) throws Exception {
		return favoriteDao.listFavorite(favorite);
	}

	@Override
	public int getTotalLikeCount(int postNo) throws Exception {
		return favoriteDao.getTotalLikeCount(postNo);
	}


}
