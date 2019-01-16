package com.wthealth.service.refund.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.wthealth.common.Search;
import com.wthealth.domain.Refund;
import com.wthealth.service.refund.RefundDao;
import com.wthealth.service.refund.RefundService;

@Service("refundServiceImpl")
public class RefundServiceImpl implements RefundService {

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

	@Override
	public String getAuthorizationUrl(int authType) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getAccessToken2() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public JSONObject getAccessToken(String code) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getUserClientId(String accessToken, String userSeqNo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> getAccount(String accessToken, String accountNum, int accountHolderinfo, String bankCode)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<String> listBankCode() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
