package com.wthealth.service.exinfo;

import java.util.List;
import java.util.Map;

import com.wthealth.common.Search;
import com.wthealth.domain.Post;
import com.wthealth.domain.Weather;

public interface ExInfoDao {

   
   public void addExInfo(Post post) throws Exception;
   
   
   public void updateExInfo(Post post) throws Exception;

   
   public Post getExInfo(int postNo) throws Exception;

   public List<Post> listExInfo(Search search) throws Exception;

   public List<Post> listWeatherRecom(Weather weather) throws Exception;

   public int getTotalCount(Search search) throws Exception;
   
   public void deleteStatus(String postNo) throws Exception;
   
   public List<Post> listExInfoRecom(Search search) throws Exception;

}