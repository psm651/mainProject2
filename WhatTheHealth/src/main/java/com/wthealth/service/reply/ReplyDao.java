package com.wthealth.service.reply;

import java.util.List;

import com.wthealth.common.Search;
import com.wthealth.domain.Reply;

public interface ReplyDao {
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
	
	// 게시판 Page 처리를 위한 전체Row(totalCount)  return
	public int getTotalCount(String postNo) throws Exception ;
	
	// 게시판 Page 처리를 위한 전체Row(totalCount)  return -> My List
	public int getTotalCountMyReply(String writerId) throws Exception ;
	
	//SELECT LIST
	public List<Reply> listReply(Search search, String postNo) throws Exception;
	
	//SELECT LIST MY REPLY 
	public List<Reply> listMyReply(Search search, String writerId) throws Exception;
	
}
