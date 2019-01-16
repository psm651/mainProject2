package com.wthealth.service.refund.impl;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.wthealth.common.Search;
import com.wthealth.common.URLConnection;
import com.wthealth.domain.Refund;
import com.wthealth.service.refund.RefundDao;

@Repository("refundDaoImpl")
public class RefundDaoImpl implements RefundDao {

	private final static String CLIENT_ID = "l7xx89273312031c4c37a9ff6d29ae9c34f0";
	private final static String CLIENT_SECRET = "c396f9034254409d9da68ab3da3757c8";

	private final static String REDIRECT_URI = "http://127.0.0.1:8080/refund/oauthAccount";
	private final static String GET_TOKEN_API_URI = "https://testapi.open-platform.or.kr/oauth/2.0/token"; // AccessToken획득
	private final static String REAL_NAME_URI = "https://testapi.open-platform.or.kr/v1.0/inquiry/real_name"; // 계좌실명조회
	private final static String USER_ME_URI = "https://testapi.open-platform.or.kr/user/me"; // 사용자정보조회
	private final static String DEPOSIT_URI = "https://openapi.open-platform.or.kr/transfer/deposit"; // 입금이체1

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public RefundDaoImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addRefund(Refund refund) throws Exception {
		sqlSession.selectOne("RefundMapper.addRefund", refund);
	}

	@Override
	public List<Refund> listRefund(Search search) throws Exception {
		System.out.println("search : " + search);
		System.out.println("listRefund : " + sqlSession.selectList("RefundMapper.listRefund", search));

		return sqlSession.selectList("RefundMapper.listRefund", search);
	}

	@Override
	public Refund getRefund(int refundNo) throws Exception {
		return sqlSession.selectOne("RefundMapper.getRefund", refundNo);
	}

	@Override
	public void updateRefund(Refund refund) throws Exception {
		sqlSession.update("refundMapper.updateRefund", refund);
	}

	@Override
	public List<Refund> listRefundAdmin(Search search) throws Exception {
		System.out.println("search : " + search);
		System.out.println("listRefundAdmin : " + sqlSession.selectList("RefundMapper.listRefundAdmin", search));

		return sqlSession.selectList("RefundMapper.listRefundAdmin", search);
	}

	@Override
	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("RefundMapper.getTotalCount", search);
	}

	// authType : 0는 최초인증, 1은 재인증, 2는 인증생략
	@Override
	public String getAuthorizationUrl(int authType) throws Exception {
		String url = "redirect:https://testapi.open-platform.or.kr/oauth/2.0/authorize2?response_type=code&client_id="
				+ CLIENT_ID + "&redirect_uri=" + REDIRECT_URI
				+ "&scope=login inquiry oop&client_info=refundPoint&auth_type=" + authType;

		System.out.println(url);

		return url;
	}

	@Override
	public JSONObject getAccessToken(String code) throws Exception {
		System.out.println("getAccessToken()");

		String param = "code=" + code + "&client_id=" + CLIENT_ID + "&client_secret=" + CLIENT_SECRET + "&redirect_uri="
				+ REDIRECT_URI + "&grant_type=authorization_code";

		System.out.println(GET_TOKEN_API_URI + "?" + param);

		JSONObject obj = URLConnection.getJSON_PARAM("POST", GET_TOKEN_API_URI, param,
				"application/x-www-form-urlencoded;charset=UTF-8");

		String access_token = obj.get("access_token").toString();
		String user_seq_no = obj.get("user_seq_no").toString();

		System.out.println("인증토큰 :: " + access_token);

		// seq_no DB에 저장
		System.out.println("사용자번호 :: " + user_seq_no);

		return obj;
	}

	@Override
	public String getAccessToken2() throws Exception {
		String param = "client_id=" + CLIENT_ID + "&client_secret=" + CLIENT_SECRET
				+ "&scope=oob&grant_type=client_credentials";

		JSONObject obj = URLConnection.getJSON_PARAM("POST", "https://testapi.open-platform.or.kr/oauth/2.0/token",
				param, "application/x-www-form-urlencoded;charset=UTF-8");

		return obj.get("access_token").toString();
	}

	@Override
	public String getUserClientId(String accessToken, String userSeqNo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> getAccount(String accessToken, String accountNum, int accountHolderinfo, String bankCode)
			throws Exception {
		
		System.out.println("getAccessToken()");

		Calendar cal = Calendar.getInstance();
		SimpleDateFormat fmt = new SimpleDateFormat("yyyyMMddHHmmss");

		String dtime = fmt.format(cal.getTime());

		JSONObject param = new JSONObject();
		param.put("bank_code_std", bankCode);
		param.put("account_num", accountNum);
		param.put("account_holder_info", accountHolderinfo);
		param.put("tran_dtime", dtime);

		System.out.println(REAL_NAME_URI + "?" + param);

		JSONObject obj = URLConnection.getJSON_PARAM("POST", REAL_NAME_URI, param.toString(),
				"application/json; charset=UTF-8", "Authorization", "Bearer " + accessToken);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("realName", obj.get("account_holder_name").toString());
		map.put("accountNum", obj.get("account_num").toString());
		map.put("bankName", obj.get("bank_name").toString());

		return map;
	}

	@Override
	public List<String> listBankCode() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
