package com.wthealth.service.favorite;

import java.util.List;
import java.util.Map;

import com.wthealth.common.Search;
import com.wthealth.domain.Favorite;
import com.wthealth.domain.Post;
import com.wthealth.domain.Refund;
import com.wthealth.domain.User;

public interface FavoriteService {
	
	public Favorite addLike(Favorite favorite) throws Exception;

	public Favorite addInterest(Favorite favorite) throws Exception;
	
	public void deleteLike(int favoriteNo) throws Exception;

	public void deleteInterest(int favoriteNo) throws Exception;
	
	public Favorite getFavorite(Favorite favorite) throws Exception;
	
	public  Map<String, Object> listLikePeople(Search search,int postNo) throws Exception;
	
	public Map<String, Object> listMyInterest(Search search, String userId) throws Exception;
	
	public List<Favorite> listFavorite(Favorite favorite) throws Exception;
	
	public int getTotalLikeCount(int postNo) throws Exception;
	
}
