package com.wthealth.service.point.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.parser.JSONParser;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.wthealth.common.Search;
import com.wthealth.domain.Point;
import com.wthealth.service.point.PointDao;
import com.wthealth.controller.URLConnection;

@Repository("pointDaoImpl")
public class PointDaoImpl implements PointDao {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	private final String REST_API_KEY = "11723e59094c12e0f6ad95a132887387";
	private final String ADMIN_KEY = "54ebcb423af0a54257b01efe086cf92f";
	private final String REDIRECT_URI = "http://127.0.0.1:8080/point/kakaoPay";
	private final String GET_TOKEN_API_URL = "https://kauth.kakao.com/oauth/token";

	private final String PAYMENT_READY_URL = "https://kapi.kakao.com/v1/payment/ready";
	private final String PAYMENT_APPROVE_URL = "https://kapi.kakao.com//v1/payment/approve";
	
	private final String PAYMENT_TEST_PARAM = "cid=TC0ONETIME&partner_order_id=partner_order_id&partner_user_id=partner_user_id";
	
	private static String accessToken;
	private static String refreshToken;


	private String tid;
	
	private JSONParser parser;
	
	public PointDaoImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addPoint(Point point) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("PointMapper.addPoint", point);
	}
	
	@Override
	public Point getPoint(int pointNo) throws Exception {
		return sqlSession.selectOne("PointMapper.getPoint", pointNo);
	}

	@Override
	public List<Point> listPoint(Search search, String senderId) throws Exception {
		// TODO Auto-generated method stub
		Map<String , Object>  map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("senderId", senderId);
		
		List<Point> list = sqlSession.selectList("PointMapper.listPoint", map);
		
		System.out.println("listPoint: "+list);
		
		return list;
	}

	@Override
	public void updatePoint(Point point) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("PointMapper.updatePoint", point);
	}

	@Override
	public int getTotalCount(String senderId) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("PointMapper.getTotalCount", senderId);
	}
	
	// accessToken 으로 카카오페이 준비
	@Override
	public String getKakaoPayReady(String token, int point) throws Exception {
		System.out.println("kakao.getPaymentReady()");

		String item = "point";
		int quantity = 1;

	       String param = PAYMENT_TEST_PARAM+"&item_name="+item+"&quantity="+quantity+"&total_amount="+point
	        			+ "&tax_free_amount=0&approval_url=http://127.0.0.1:8080/point/kakaoPay/success"
	        			+ "&fail_url=http://127.0.0.1:8080/point/kakaoPay/fail&cancel_url=http://127.0.0.1:8080/point/kakaoPay/cancel";
	
	       JSONObject obj = URLConnection.getJSON_PARAM(URLConnection.HTTPMETHOD_POST, PAYMENT_READY_URL, param,
	       		"application/x-www-form-urlencoded; charset=utf-8",
	        	"Authorization","Bearer "+token);
	       
		this.tid = obj.get("tid").toString();
			
		return obj.get("next_redirect_pc_url").toString();
	}

	@Override
	public String getKakaoPayReady(int point) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("kakao.getPaymentReady()");

		String item = "point";
		int quantity = 1;

        String param = PAYMENT_TEST_PARAM+"&item_name="+item+"&quantity="+quantity+"&total_amount="+point
        				+ "&tax_free_amount=0&approval_url=http://127.0.0.1:8080/payment/kakaoPay/success"
        				+ "&fail_url=http://127.0.0.1:8080/payment/kakaoPay/fail&cancel_url=http://127.0.0.1:8080/payment/kakaoPay/cancel";
		
        //System.out.println(param);
        
        JSONObject obj = URLConnection.getJSON_PARAM(URLConnection.HTTPMETHOD_POST, PAYMENT_READY_URL, param,
        		"application/x-www-form-urlencoded; charset=utf-8",
        		"Authorization","KakaoAK "+ADMIN_KEY);
		this.tid = obj.get("tid").toString();
		
		return obj.get("next_redirect_pc_url").toString();
	}

	@Override
	public Map<String, Object> getKakaoPayApprove(String token, String pgToken) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("kakao.getPaymentApprove()");
        
        String param = PAYMENT_TEST_PARAM+"&tid="+tid+"&pg_token="+pgToken;
        
        //System.out.println(param);

		JSONObject obj = URLConnection.getJSON_PARAM(URLConnection.HTTPMETHOD_POST, PAYMENT_APPROVE_URL, param, 
        		"application/x-www-form-urlencoded; charset=utf-8",
        		"Authorization","Bearer "+token);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("approvedDate",(Date)obj.get("approved_at"));
		System.out.println("DATE :: "+(Date)obj.get("approved_at"));
		map.put("point", (int)((JSONObject)obj.get("amount")).get("total"));
		
		return map;
	}

	@Override
	public Map<String, Object> getKakaoPayApprove(String pgToken) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("kakao.getPaymentApprove()");
        
        String param = PAYMENT_TEST_PARAM+"&tid="+tid+"&pg_token="+pgToken;
        
        //System.out.println(param);

		JSONObject obj = URLConnection.getJSON_PARAM(URLConnection.HTTPMETHOD_POST, PAYMENT_APPROVE_URL, param, 
        		"application/x-www-form-urlencoded; charset=utf-8",
        		"Authorization","KakaoAK "+ADMIN_KEY);

		Map<String, Object> map = new HashMap<String, Object>();

		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
		Date date = transFormat.parse((String)obj.get("approved_at"));
		
		map.put("approvedDate",date);
		map.put("point", ((Long)((JSONObject)obj.get("amount")).get("total")).intValue());
		
		return map;
	}
	

}
