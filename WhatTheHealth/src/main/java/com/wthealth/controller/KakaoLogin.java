package com.wthealth.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;

import com.wthealth.common.Search;
import com.wthealth.domain.User;
import com.wthealth.service.user.UserService;
import com.wthealth.service.user.impl.UserServiceImpl;
import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.map.ObjectMapper;

public class KakaoLogin {
	
	public static JsonNode getAccessToken(String autorize_code) {
		final String RequestUrl = "https://kauth.kakao.com/oauth/token";

		final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
		postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));
		postParams.add(new BasicNameValuePair("client_id", "11723e59094c12e0f6ad95a132887387")); // REST API KEY
		postParams.add(new BasicNameValuePair("redirect_uri", "http://192.168.0.10:8080/user/kakaoLogin")); // �����̷�Ʈ URI
		postParams.add(new BasicNameValuePair("code", autorize_code)); // �α��� ������ ���� code ��

		final HttpClient client = HttpClientBuilder.create().build();
		final HttpPost post = new HttpPost(RequestUrl);
		JsonNode returnNode = null;

		try {
			post.setEntity(new UrlEncodedFormEntity(postParams));
			final HttpResponse response = client.execute(post);
			final int responseCode = response.getStatusLine().getStatusCode();

			System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
			System.out.println("Post parameters : " + postParams);
			System.out.println("Response Code : " + responseCode);

			// JSON ���� ��ȯ�� ó��
			ObjectMapper mapper = new ObjectMapper();
			returnNode = mapper.readTree(response.getEntity().getContent());

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			// clear resources
		}

		return returnNode;

	}

	public static JsonNode getKakaoUserInfo(String autorize_code) {

		final String RequestUrl = "https://kapi.kakao.com/v1/user/me";

		final HttpClient client = HttpClientBuilder.create().build();
		final HttpPost post = new HttpPost(RequestUrl);

		// add header
		post.addHeader("Authorization", "Bearer " + autorize_code);

		JsonNode returnNode = null;

		try {
			final HttpResponse response = client.execute(post);
			final int responseCode = response.getStatusLine().getStatusCode();

			System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
			System.out.println("Response Code : " + responseCode);

			// JSON ���� ��ȯ�� ó��
			ObjectMapper mapper = new ObjectMapper();
			returnNode = mapper.readTree(response.getEntity().getContent());

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			// clear resources
		}
		return returnNode;

	}

	public static User changeData(JsonNode userInfo) throws Exception {
		User user = new User();

		user.setUserId(userInfo.path("id").asText());
		user.setIdToken(userInfo.path("id").asText());// id -> vo �ֱ�
		user.setPassword(userInfo.path("password").asText());

		if (userInfo.path("kaccount_email_verified").asText().equals("true")) { // �̸��� �ޱ� ��� �� ���
			user.setEmail(userInfo.path("kaccount_email").asText()); // email -> vo �ֱ�

		} 
		if (userInfo.path("kaccount_gender_verified").asText().equals("true")) { // �̸��� �ޱ� ��� �� ���
			user.setEmail(userInfo.path("kaccount_gender").asText()); // email -> vo �ֱ�

		} 

		JsonNode properties = userInfo.path("properties"); // �߰����� �޾ƿ���
		if (properties.has("nickname"))
			user.setNickName(properties.path("nickname").asText());
			user.setUserImage(properties.path("profile_image").asText());
			
	/*	UserServiceImpl userService = new UserServiceImpl();
		
		System.out.println("����11111");
		userService.addUser(vo);
		
		System.out.println("����222222");
		*/
		
		return user;
	}
}