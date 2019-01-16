package com.wthealth.service.favorite;

import java.util.List;
import java.util.Map;

import com.wthealth.common.Search;
import com.wthealth.domain.Favorite;
import com.wthealth.domain.Post;
import com.wthealth.domain.Refund;
import com.wthealth.domain.User;

public interface FavoriteService {
	
	public Favorite addLike(Favorite like) throws Exception;

	public Favorite addInterest(Favorite interest) throws Exception;

	public void deleteLike(int favoriteNo) throws Exception;

	public void deleteInterest(int favoriteNo) throws Exception;
	
	public  Map<String, Object> listLikePeople(Search search,String postNo) throws Exception;
	
	public Map<String, Object> listMyInterest(Search search, String userId) throws Exception;
	
	public void updateLikeCount(String postNo) throws Exception;
	
}
