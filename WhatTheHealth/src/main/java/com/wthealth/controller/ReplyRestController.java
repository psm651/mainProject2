package com.wthealth.controller;

import java.util.Map;

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
	public Reply addReply(@RequestBody Reply reply, @PathVariable String postNo) throws Exception {
		System.out.println("/reply/json/addReply : POST");
		reply.setPostNo(postNo);
		System.out.println(reply);
		replyService.addReply(reply);

		//Search search = new Search();
		//search.setPageSize(pageSize);
		
		//return replyService.listReply(search, postNo);
		return replyService.getReply(reply.getReplyNo());
	}
	
	@RequestMapping(value="json/deleteReply/{replyNo}", method=RequestMethod.GET)
	public void deleteReply(@PathVariable int replyNo) throws Exception{
		System.out.println("/rely/son/deleteReply : GET");
		
		replyService.deleteReply(replyNo);
	}
	
	//getReply도 컨트롤러 필요?(-)
	
	@RequestMapping(value="json/addReReply/{parentReplyNo}", method=RequestMethod.POST)
	public Reply addReReply(@RequestBody Reply reply, @PathVariable int parentReplyNo) throws Exception{
		System.out.println("/reply/json/addReReply : POST");
		reply.setParentReplyNo(parentReplyNo);
		System.out.println(reply);
		replyService.addReReply(reply);
		
		return replyService.getReply(reply.getReplyNo());
	}

}
