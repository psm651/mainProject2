package com.wthealth.service.reply;

import java.util.List;
import java.util.Map;

import com.wthealth.common.Search;
import com.wthealth.domain.Reply;

public interface ReplyService {
	//INSERT
	public void addReply(Reply reply) throws Exception;
		
	//INSERT 대댓글
	public void addReReply(Reply reply) throws Exception;
		
	//SELECT ONE
	public Reply getReply(int replyNo) throws Exception;
	
	//DELETE -> (주의) Update 해야 함
	public void deleteReply(int replyNo) throws Exception;
		
	//DELETE 대댓글 -> (주의) Update 해야 함
	//public void deleteReReply(int replyNo) throws Exception;
	
	//SELECT LIST
	public Map<String , Object> listReply(Search search, String postNo) throws Exception;
	
	//SELECT LIST MY REPLY 
	public Map<String , Object> listMyReply(Search search, String writerId) throws Exception;
		
		
}
