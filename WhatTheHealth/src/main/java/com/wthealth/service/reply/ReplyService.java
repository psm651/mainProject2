package com.wthealth.service.reply;

import java.util.List;
import java.util.Map;

import com.wthealth.common.Search;
import com.wthealth.domain.Reply;

public interface ReplyService {
	//INSERT
	public void addReply(Reply reply) throws Exception;
		
	//INSERT ����
	public void addReReply(Reply reply) throws Exception;
		
	//SELECT ONE
	public Reply getReply(int replyNo) throws Exception;
	
	//DELETE -> (����) Update �ؾ� ��
	public void deleteReply(int replyNo) throws Exception;
		
	//DELETE ���� -> (����) Update �ؾ� ��
	//public void deleteReReply(int replyNo) throws Exception;
	
	//SELECT LIST
	public Map<String , Object> listReply(Search search, String postNo) throws Exception;
	
	//SELECT LIST MY REPLY 
	public Map<String , Object> listMyReply(Search search, String writerId) throws Exception;
		
		
}
