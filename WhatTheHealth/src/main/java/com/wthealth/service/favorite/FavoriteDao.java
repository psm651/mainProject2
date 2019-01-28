package com.wthealth.service.favorite;

import java.util.List;

import com.wthealth.common.Search;
import com.wthealth.domain.Favorite;
import com.wthealth.domain.User;

public interface FavoriteDao {
	
	public Favorite addLike(Favorite favorite) throws Exception;

	public Favorite addInterest(Favorite favorite) throws Exception;
	
	public void deleteLike(int favoriteNo) throws Exception;

	public void deleteInterest(int favoriteNo) throws Exception;
	
	public Favorite getFavorite(Favorite favorite) throws Exception;
	
	public List<Favorite> listFavorite(Favorite favorite) throws Exception;
	
	public List<User> listLikePeople(Search search,int postNo) throws Exception;
	
	public List<Favorite> listMyInterest(Search search, String userId) throws Exception;
	
	public int getTotalCountByUserId(String userId) throws Exception;
	
	public int getTotalCountByPostNo(int postNo) throws Exception;
	
	public int getTotalCountByFavorite(String userId, int postNo, String favoriteType) throws Exception;
	
	public int getTotalLikeCount(int postNo) throws Exception;
	
}
