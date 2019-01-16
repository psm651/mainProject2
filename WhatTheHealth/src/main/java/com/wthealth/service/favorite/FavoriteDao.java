package com.wthealth.service.favorite;

import java.util.List;

import com.wthealth.common.Search;
import com.wthealth.domain.Favorite;
import com.wthealth.domain.Post;
import com.wthealth.domain.Refund;
import com.wthealth.domain.User;

public interface FavoriteDao {
	
	public Favorite addLike(Favorite like) throws Exception;

	public Favorite addInterest(Favorite interest) throws Exception;

	public void deleteLike(int favoriteNo) throws Exception;

	public void deleteInterest(int favoriteNo) throws Exception;
	
	public List<User> listLikePeople(Search search,String postNo) throws Exception;
	
	public List<Favorite> listMyInterest(Search search, String userId) throws Exception;
	
	public int getTotalCount(String userId) throws Exception;

	public void updateLikeCount(String postNo) throws Exception;
}
