package com.wthealth.service.refund;

import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;

import com.wthealth.common.Search;
import com.wthealth.domain.Refund;

public interface RefundService {

	public void addRefund(Refund refund) throws Exception;

	public Map<String, Object> listRefund(Search search) throws Exception;

	public Refund getRefund(int refundNo) throws Exception;

	public void updateRefund(Refund refund) throws Exception;

	public Map<String, Object> listRefundAdmin(Search search) throws Exception;
	
	public String getAuthorizationUrl(int authType) throws Exception;

	public String getAccessToken2() throws Exception;

	public JSONObject getAccessToken(String code) throws Exception;

	public String getUserClientId(String accessToken, String userSeqNo) throws Exception;

	public Map<String, Object> getAccount(String accessToken, String accountNum, int accountHolderinfo,
			String bankCode) throws Exception;

	public List<String> listBankCode() throws Exception;
}
