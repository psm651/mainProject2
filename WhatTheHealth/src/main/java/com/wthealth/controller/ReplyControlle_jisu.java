package com.wthealth.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.wthealth.common.Page;
import com.wthealth.common.Search;
import com.wthealth.domain.User;
import com.wthealth.service.reply.ReplyService;

@Controller
@RequestMapping("/reply/*")
public class ReplyControlle_jisu {
	
	@Autowired
	@Qualifier("replyServiceImpl")
	private ReplyService replyService;
	
	public ReplyControlle_jisu() {
		System.out.println(this.getClass());
	}
	
	// ==> classpath:config/common.properties , classpath:config/commonservice.xml
	// ���� �Ұ�
	// ==> �Ʒ��� �ΰ��� �ּ��� Ǯ�� �ǹ̸� Ȯ�� �Ұ�
	@Value("#{commonProperties['pageUnit']}")
	// @Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	// @Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	
	@RequestMapping(value = "listMyReply11")
	public String listMyReply(@ModelAttribute("search") Search search, HttpSession session, Model model) throws Exception{
		System.out.println("/listMyReply: 1111");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		String userId = ((User)session.getAttribute("user")).getUserId();
		Map<String , Object> map=replyService.listMyReply(search, userId);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		model.addAttribute("replyList", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/activity/listMyReply.jsp";
	}
	
}
