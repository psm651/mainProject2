package com.wthealth.service.refund.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.wthealth.common.Search;
import com.wthealth.common.URLConnection;
import com.wthealth.domain.Refund;
import com.wthealth.service.refund.RefundDao;
import com.wthealth.service.refund.RefundService;

@Service("refundServiceImpl")
public class RefundServiceImpl implements RefundService {
	
	private final static String CLIENT_ID = "l7xx89273312031c4c37a9ff6d29ae9c34f0";
	private final static String CLIENT_SECRET = "c396f9034254409d9da68ab3da3757c8";

	private final static String REDIRECT_URI = "http://127.0.0.1:8080/refund/authorizeAccount";
	private final static String GET_TOKEN_API_URI = "https://testapi.open-platform.or.kr/oauth/2.0/token"; // AccessTokenȹ��
	private final static String REAL_NAME_URI = "https://testapi.open-platform.or.kr/v1.0/inquiry/real_name"; // ���½Ǹ���ȸ
	private final static String DEPOSIT_URI = "https://openapi.open-platform.or.kr/transfer/deposit"; // �Ա���ü1

	@Autowired
	@Qualifier("refundDaoImpl")
	private RefundDao refundDao;

	public void setRefundDao(RefundDao refundDao) {
		this.refundDao = refundDao;
	}

	public RefundServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addRefund(Refund refund) throws Exception {
		refundDao.addRefund(refund);
	}

	@Override
	public Refund getRefund(int refundNo) throws Exception {
		return refundDao.getRefund(refundNo);
	}

	@Override
	public Map<String, Object> listRefund(Search search) throws Exception {
		List<Refund> list = refundDao.listRefund(search);
		int totalCount = refundDao.getTotalCount(search);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));

		return map;
	}

	@Override
	public void updateRefund(Refund refund) throws Exception {
		refundDao.updateRefund(refund);

	}

	@Override
	public Map<String, Object> listRefundAdmin(Search search) throws Exception {
		List<Refund> listAdmin = refundDao.listRefund(search);
		int totalCount = refundDao.getTotalCount(search);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("listAdmin", listAdmin);
		map.put("totalCount", new Integer(totalCount));

		return map;
	}

	/*@Override
	public String getAuthorizationUrl(int authType) throws Exception {
		String url = "redirect:https://testapi.open-platform.or.kr/oauth/2.0/authorize2?response_type=code&client_id="
				+ CLIENT_ID + "&redirect_uri=" + REDIRECT_URI
				+ "&scope=login inquiry oop&client_info=refundPoint&auth_type=" + authType;

		System.out.println(url);

		return url;
	}*/

	/*@Override
	public String getAccessToken2() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}*/

	@Override
	public JSONObject getAccessToken() throws Exception {
		System.out.println("getAccessToken()");

		String param = "client_id=" + CLIENT_ID + "&client_secret=" + CLIENT_SECRET 
				+ "&get_token_api_uri=" + GET_TOKEN_API_URI + "&grant_type=client_credentials";
		
		//+ "&redirect_uri="+ REDIRECT_URI

		System.out.println(GET_TOKEN_API_URI + "?" + param);

		JSONObject obj = URLConnection.getJSON_PARAM("POST", GET_TOKEN_API_URI, param,
				"application/x-www-form-urlencoded;charset=UTF-8");

		String access_token = obj.get("access_token").toString();
		//String user_seq_no = obj.get("user_seq_no").toString();

		System.out.println("������ū :: " + access_token);

		// seq_no DB�� ����
		//System.out.println("����ڹ�ȣ :: " + user_seq_no);

		return obj;
	}

	/*@Override
	public String getUserClientId(String accessToken, String userSeqNo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}*/

	@Override
	public Map<String, Object> getAccount(String accessToken, String accountNum, int accountHolderinfo, int bankCode)
			throws Exception {
		System.out.println("getAccount()");

		Calendar cal = Calendar.getInstance();
		SimpleDateFormat fmt = new SimpleDateFormat("yyyyMMddHHmmss");

		String refundReqDate = fmt.format(cal.getTime());

		JSONObject param = new JSONObject();
		param.put("bank_code_std", bankCode);
		param.put("account_num", accountNum);
		//param.put("account_holder_name", "������"); //�̰� ���� ���� ��.
		param.put("account_holder_info", accountHolderinfo); //dateOfBirth��
		param.put("tran_dtime", refundReqDate); 

		System.out.println(REAL_NAME_URI + "?" + param);

		JSONObject obj = URLConnection.getJSON_PARAM("POST", REAL_NAME_URI, param.toString(),
				"application/json; charset=UTF-8", "Authorization", "Bearer " + accessToken);

		Map<String, Object> map = new HashMap<String, Object>(); //������ �����ϸ� map�� obj.get ���� ����.
		map.put("holder", obj.get("account_holder_name").toString());
		map.put("accountNum", obj.get("account_num").toString());
		map.put("bankName", obj.get("bank_name").toString());
		map.put("bankCode", obj.get("bank_code_std").toString());
		
		System.out.println("map : "+map);
		
		return map;
	}

	@Override
	public List<String> listBankCode() throws Exception {
		List<String> list = new ArrayList<String>();
		list.add("002=�������");
		list.add("003=�������");
		list.add("004=��������");
		list.add("007=�����߾�ȸ");
		list.add("011=�����߾�ȸ");
		list.add("020=�츮����");
		list.add("023=SC��������");
		list.add("027=��Ƽ����");
		list.add("031=�뱸����");
		list.add("032=�λ�����");
		list.add("034=��������");
		list.add("035=��������");
		list.add("037=��������");
		list.add("039=�泲����");
		list.add("081=�ϳ�����");
		list.add("088=��������");
		list.add("097=��������");
		
		
		return list;
	}
	
	//@Scheduled(fixedDelay=1000)
	@Scheduled(cron="0 0 12 * * *")
	public void doSomething() {
		System.out.println("ȸ�� ����ϴ� �ð� ���� 12��");
	}

}
