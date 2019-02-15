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
      
      return "forward:/socket/addLiveStream.jsp";
      //return "forward: https://192.168.0.39:6503/webrtc-from-chat/index.html";
   }
   
   /*@RequestMapping(value="addLiveStream", method=RequestMethod.POST)
   public String addLiveStream(@ModelAttribute("socket") Socket socket) throws Exception{
      System.out.println("/addLiveStream: POST");
      socketService.addLiveStream(socket);
      return "forward:/socket/getLiveStream?socketNo="+socket.getSocketNo();
   }*/
   
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
   
   @RequestMapping(value="listSocket")
   public String listSocket(@ModelAttribute("search") Search search, Model model) throws Exception{
      System.out.println("/listSocket");
      
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
   
      return "forward:/socket/listSocket.jsp";
   }
   
   @RequestMapping(value = "addChatting",  method=RequestMethod.GET)
      public String addChating(@RequestParam("userId2") String userId2, Model model, HttpSession session) throws Exception {
         
         
         String userId1 = ((User)session.getAttribute("user")).getUserId();
         System.out.println("/socket/addChating : GET");
         Chatting chatting = new Chatting();

         chatting.setUser1(userId1);
         chatting.setUser2(userId2);
         
      /*   List<Chatting> list1 = chattingService.listChatting1(userId2);
         List<Chatting> list2 = chattingService.listChatting2(userId1);
         */
         
         String roomId1 = userId2 + ";"+((User)session.getAttribute("user")).getUserId();
         String roomId2 = ((User)session.getAttribute("user")).getUserId()+ ";"+userId2;
         
         if(chattingService.getChatting(roomId1) == null && chattingService.getChatting(roomId2) == null) {
            chatting.setRoomId(roomId2);
            
            chattingService.addChatting(chatting);
            
            model.addAttribute("roomId", roomId2);
            
            System.out.println("////////////방추가됨");
         }
         
         
         /*boolean check = false;
         //System.out.println("indexOF:::::"+list1.lastIndexOf(list1));
         System.out.println("size::::"+list1.size());
         System.out.println("roomId :::::"+roomId);*/
         
         /*if(list1 != null && list2 !=null) {
            
            for(int i=0; i<list1.size(); i++) {
               if(list1.get(i).getUser1() != userId1 && list1.get(i).getUser2() != userId1
                     && list2.get(i).getUser1() != userId2 && list2.get(i).getUser2() != userId2) {
               
               System.out.println("방 이름1:::::"+list1.get(i).getRoomId()+"::::::::");
               System.out.println("방 이름2:::::"+list2.get(i).getRoomId());
               
               String roomId1 = list1.get(i).getRoomId();
               String roomId2
               
               
               if(list1.get(i).getUser1() == userId1 || list1.get(i).getUser2() == userId1
                     || list2.get(i).getUser1() == userId2 || list2.get(i).getUser2() == userId2
                     || list1.get(i).getRoomId() == roomId || list2.get(i).getRoomId() == roomId) {
                  
                  System.out.println("////////////방추가 안됨");
                  check = true;
                  break;
                  
                  
                     chatting.setRoomId(roomId);
                  
                  chattingService.addChatting(chatting);
                  
                  model.addAttribute("roomId", roomId);
                  
                   return "forward:/socket/chatting.jsp";
               }
            }*/
         //}
               /*if(check == false) {
                  chatting.setRoomId(roomId);
                  
                  chattingService.addChatting(chatting);
                  
                  model.addAttribute("roomId", roomId);
                  
                  System.out.println("////////////방추가됨");
                  
               }*/
         
         
         
          return "forward:/socket/chatting.jsp";
         
         }
      
      @RequestMapping(value = "getChatting",  method=RequestMethod.GET)
      public String getChatting(@RequestParam("roomId") String roomId, Model model, HttpSession session) {
         
         System.out.println("/socket/getChatting : GET");
         
         //String roomId = userId + "+"+((User)session.getAttribute("user")).getUserId();
         
         model.addAttribute("roomId", roomId);
         
          return "forward:/socket/chatting.jsp";
         }
      
      @RequestMapping(value = "getMeetChatting",  method=RequestMethod.GET)
      public String getMeetChatting(@RequestParam("roomId") String roomId, Model model, HttpSession session) {
         
         System.out.println("/socket/getMeetChatting : GET");
         
         //String roomId = userId + "+"+((User)session.getAttribute("user")).getUserId();
         
         model.addAttribute("roomId", roomId);
         
          return "forward:/socket/groupChatting.jsp";
         }
      //"http://192.168.0.9:8080/socket/deleteSocket"+data.roomId)
      @RequestMapping(value = "deleteSocket",  method=RequestMethod.GET)
      public String deleteSocket(@RequestParam("socketNo") int socketNo) throws Exception{
         
         System.out.println("/socket/deleteSocket : GET");
         
         //String roomId = userId + "+"+((User)session.getAttribute("user")).getUserId();
         socketService.deleteLiveStream(socketNo);
         //model.addAttribute("roomId", roomId);
         
          return "redirect:/socket/listSocket";
         }
}

