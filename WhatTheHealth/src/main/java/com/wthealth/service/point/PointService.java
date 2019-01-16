package com.wthealth.service.point;

import java.util.Map;

import com.wthealth.common.Search;
import com.wthealth.domain.Point;
import com.wthealth.domain.User;

public interface PointService {
	
	public void addPoint(Point point) throws Exception;
	
	public Point getPoint(int pointNo) throws Exception;

	public Map<String,Object> listPoint(Search search, String senderId) throws Exception;

	public void updatePoint(Point point) throws Exception;
	
	public String getPaymentReady(String token, int point) throws Exception;
	
	public Map<String, Object> getPaymentApprove(String token, String pgToken) throws Exception;

}
