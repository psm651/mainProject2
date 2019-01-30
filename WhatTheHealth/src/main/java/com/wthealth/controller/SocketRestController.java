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
import com.wthealth.domain.Socket;
import com.wthealth.domain.User;
import com.wthealth.service.socket.SocketService;

@RestController
@RequestMapping("/socket/*")
public class SocketRestController {

	@Autowired
	@Qualifier("socketServiceImpl")
	private SocketService socketService;
	
	public SocketRestController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="json/addLiveStream", method=RequestMethod.POST)
	//public Map<String, Object> addReply(@RequestBody Reply reply, @PathVariable String postNo) throws Exception {
	public int addLiveStream(@RequestBody Socket socket, HttpSession session) throws Exception {
		System.out.println("json/addLiveStream : POST");
		User user = (User)session.getAttribute("user");
		socket.setBjId(user.getUserId());
		socketService.addLiveStream(socket);
		
		//return socket.getSocketNo();
		return 1;
	}
	

}
