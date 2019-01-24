package com.wthealth.service.refund;

import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;

import com.wthealth.common.Search;
import com.wthealth.domain.Refund;

public interface RefundDao {

	public void addRefund(Refund refund) throws Exception;

	public List<Refund> listRefund(Search search, String userId) throws Exception;

	public Refund getRefund(int refundNo) throws Exception;

	public void updateRefund(Refund refund) throws Exception;

	public List<Refund> listRefundAdmin(Search search) throws Exception;

	// �Խ��� Page ó���� ���� ��üRow(totalCount) return
	public int getTotalCount(Search search, String userId) throws Exception;
	
	public int getTotalCountForAdmin(Search search) throws Exception;

}
