package com.wthealth.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.wthealth.common.Search;
import com.wthealth.domain.Reply;
import com.wthealth.domain.User;
import com.wthealth.service.reply.ReplyService;

@RestController
@RequestMapping("/reply/*")
public class ReplyRestController {

	@Autowired
	@Qualifier("replyServiceImpl")
	private ReplyService replyService;
	
	public ReplyRestController() {
		System.out.println(this.getClass());
	}
	
	/*@Value("#{commonProperties['pageUnit']}")
	// @Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	// @Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;*/
	
	@RequestMapping(value="json/addReply/{postNo}", method=RequestMethod.POST)
	//public Map<String, Object> addReply(@RequestBody Reply reply, @PathVariable String postNo) throws Exception {
	public int addReply(@RequestBody Reply reply, @PathVariable String postNo, HttpSession session) throws Exception {
		System.out.println("json/addReply : POST");
		User user = (User)session.getAttribute("user");
		reply.setWriterId(user.getUserId());
		reply.setPostNo(postNo);
		System.out.println(reply);
		replyService.addReply(reply);

		//Search search = new Search();
		//search.setPageSize(pageSize);

		//return replyService.listReply(search, postNo);
		//return replyService.getReply(reply.getReplyNo());
		return 1;
	}
	
	@RequestMapping(value="json/deleteReply/{replyNo}", method=RequestMethod.GET)
	public int deleteReply(@PathVariable int replyNo) throws Exception{
		System.out.println("/reply/json/deleteReply : GET");
		
		replyService.deleteReply(replyNo);
		return 1;
	}
	
	@RequestMapping(value="json/updateReply", method=RequestMethod.POST)
	public int updateReply(@RequestBody Reply reply) throws Exception{
		System.out.println("/reply/json/updateReply : POST");
		replyService.updateReply(reply);
		return 1;
	}
	
	//getReply도 컨트롤러 필요?(-)
	
	@RequestMapping(value="json/addReReply/{parentReplyNo}", method=RequestMethod.POST)
	public int addReReply(@RequestBody Reply reply, @PathVariable int parentReplyNo, HttpSession session) throws Exception{
		System.out.println("/reply/json/addReReply : POST");
		User user = (User)session.getAttribute("user");
		reply.setWriterId(user.getUserId());
		reply.setParentReplyNo(parentReplyNo);
		System.out.println(reply);
		replyService.addReReply(reply);
		
		//return replyService.getReply(reply.getReplyNo());
		return 1;
	}
	
	@RequestMapping(value="json/listReply/{postNo}", method=RequestMethod.GET)
	public List<Reply> listReply(@PathVariable String postNo) throws Exception{
		System.out.println("/reply/json/listReply : GET");
		return replyService.listReply(postNo);
	}
}
