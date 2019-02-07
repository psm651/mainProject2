package com.wthealth.domain;


import org.json.simple.JSONObject;

import com.wthealth.common.URLConnection;

public class PapaGo {

	//Field
	private final static String requestURL = "https://openapi.naver.com/v1/language/translate";
	private final static String propertyName = "X-Naver-Client-Id";
	private final static String propertyValue = "8y0TvH4hNVoucYmnqfhP";
	private final static String propertyName2 = "X-Naver-Client-Secret";
	private final static String propertyValue2 = "1EwZ_cZNgc";
	private final static String contentType = null;
	private String resultTranslate = "";
	//Constructor
	public PapaGo() {		
	}
	
	public PapaGo(String param) throws Exception {
		
		JSONObject json = URLConnection.getJSON_PARAMS(URLConnection.HTTPMETHOD_POST,  requestURL,  param,  contentType,
				 propertyName,  propertyValue,  propertyName2,  propertyValue2);
		
		
		JSONObject message =(JSONObject)json.get("message");
		JSONObject result = (JSONObject)message.get("result");
		this.resultTranslate = (String)result.get("translatedText");
		
	}
	
	public String getResultTranslate() {
		return resultTranslate;
	}
	
}
