package com.wthealth.service.reply.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.wthealth.common.Search;
import com.wthealth.domain.Reply;
import com.wthealth.service.reply.ReplyDao;
import com.wthealth.service.reply.ReplyService;

@Service("replyServiceImpl")
public class ReplyServiceImpl implements ReplyService {

	///Field
	@Autowired
	@Qualifier("replyDaoImpl")
	private ReplyDao replyDao;
	public void setReplyDao(ReplyDao replyDao) {
		this.replyDao = replyDao;
	}
	
	///Constructor
	public ReplyServiceImpl() {
		System.out.println(this.getClass());
	}
	
	///Method
	@Override
	public void addReply(Reply reply) throws Exception {
		replyDao.addReply(reply);
	}

	@Override
	public void addReReply(Reply reply) throws Exception {
		replyDao.addReReply(reply);
	}

	@Override
	public Reply getReply(int replyNo) throws Exception {
		return replyDao.getReply(replyNo);
	}

	@Override
	public void deleteReply(int replyNo) throws Exception {
		replyDao.deleteReply(replyNo);
	}

	/*@Override
	public void deleteReReply(int replyNo) throws Exception {
		// TODO Auto-generated method stub

	}*/

	@Override
	public  Map<String , Object> listReply(Search search, String postNo) throws Exception {
		List<Reply> list = replyDao.listReply(search, postNo);
		int totalCount = replyDao.getTotalCount(postNo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	@Override
	public Map<String, Object> listMyReply(Search search, String writerId) throws Exception {
		List<Reply> list = replyDao.listMyReply(search, writerId);
		int totalCount = replyDao.getTotalCountMyReply(writerId);
		
		Map<String, Object>	map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

}
