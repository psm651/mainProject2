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
import com.wthealth.domain.Chatting;
import com.wthealth.domain.Socket;
import com.wthealth.domain.User;
import com.wthealth.service.chatting.ChattingService;
import com.wthealth.service.socket.SocketService;

@Controller
@RequestMapping("/socket/*")
public class SocketController {
	
	@Autowired
	@Qualifier("socketServiceImpl")
	private SocketService socketService;
	
	@Autowired
	@Qualifier("chattingServiceImpl")
	private ChattingService chattingService;
	
	public SocketController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	// @Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	// @Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;

	
	@RequestMapping(value="addLiveStream", method=RequestMethod.GET)
	public String addLiveStream() throws Exception{
		System.out.println("/addLiveStream : GET");
		
		return "redirect:/socket/addLiveStream.jsp" ;
	}
	
	@RequestMapping(value="addLiveStream", method=RequestMethod.POST)
	public String addLiveStream(@ModelAttribute("socket") Socket socket) throws Exception{
		System.out.println("/addLiveStream: POST");
		socketService.addLiveStream(socket);
		return "forward:/socket/getLiveStream?socketNo="+socket.getSocketNo();
	}
	
	@RequestMapping(value="getLiveStream", method=RequestMethod.GET)
	public String getLiveStream(@RequestParam("socketNo") int socketNo, Model model) throws Exception{
		System.out.println("/getLiveStream: GET");
		Socket socket = socketService.getLiveStream(socketNo);
		model.addAttribute("socket", socket);
		
		return "forward:/socket/getLiveStream.jsp";	
	}
	
	@RequestMapping(value="deleteLiveStream", method=RequestMethod.GET)
	public String deleteLiveStream(@RequestParam("socketNo") int socketNo) throws Exception{
		System.out.println("/deleteLiveStream : GET");
		socketService.deleteLiveStream(socketNo);
		
		return "forward:/socket/listLiveStream"; //forward..?
	}
	
	@RequestMapping(value="listLiveStream")
	public String listLiveStream(@ModelAttribute("search") Search search, Model model) throws Exception{
		System.out.println("/listLiveStream");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String , Object> map=socketService.listLiveStream(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
	
		return "forward:/socket/listLiveStream.jsp";
	}
	
	@RequestMapping(value = "addChatting",  method=RequestMethod.GET)
	public String addChating(@RequestParam("userId2") String userId2, Model model, HttpSession session) throws Exception {
		
		System.out.println("/socket/addChating : GET");
		Chatting chatting = new Chatting();
		chatting.setUser1(((User)session.getAttribute("user")).getUserId());
		chatting.setUser2(userId2);
		String roomId = userId2 + ";"+((User)session.getAttribute("user")).getUserId();
		chatting.setRoomId(roomId);
		
		chattingService.addChatting(chatting);
		
		model.addAttribute("roomId", roomId);
		
	    return "forward:/socket/chatting.jsp";
	   }
	
	@RequestMapping(value = "getChatting",  method=RequestMethod.GET)
	public String getChatting(@RequestParam("roomId") String roomId, Model model, HttpSession session) {
		
		System.out.println("/socket/getChatting : GET");
		
		//String roomId = userId + "+"+((User)session.getAttribute("user")).getUserId();
		
		model.addAttribute("roomId", roomId);
		
	    return "forward:/socket/chatting.jsp";
	   }
}


