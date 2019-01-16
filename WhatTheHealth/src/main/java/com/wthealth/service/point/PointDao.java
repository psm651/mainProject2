package com.wthealth.service.point;

import java.util.List;
import java.util.Map;

import com.wthealth.common.Search;
import com.wthealth.domain.Point;


public interface PointDao {
	
		// INSERT
		public void addPoint(Point point) throws Exception ;
		
		// SELECT ONE
		public Point getPoint(int pointNo) throws Exception ;

		// SELECT LIST
		public List<Point> listPoint(Search search, String senderId) throws Exception ;

		// UPDATE
		public void updatePoint(Point point) throws Exception ;
		
		// 게시판 Page 처리를 위한 전체Row(totalCount)  return
		public int getTotalCount(String senderId) throws Exception ;
		
		public String getKakaoPayReady(String token, int point) throws Exception;
		
		public String getKakaoPayReady(int point) throws Exception;
		
		public Map<String, Object> getKakaoPayApprove(String token, String pgToken) throws Exception;
		
		public Map<String, Object> getKakaoPayApprove(String pgToken) throws Exception;
		
}
