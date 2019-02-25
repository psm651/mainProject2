package com.wthealth.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.wthealth.domain.Meeting;
import com.wthealth.domain.Refund;
import com.wthealth.domain.User;
import com.wthealth.service.refund.RefundService;
import com.wthealth.service.user.UserService;

@RestController
@RequestMapping("/refund/*")
public class RefundRestController {

   @Autowired
   @Qualifier("refundServiceImpl")
   private RefundService refundService;
   
   @Autowired
   @Qualifier("userServiceImpl")
   private UserService userService;
   
   @Value("#{commonProperties['pageUnit']}")
   int pageUnit;
   
   @Value("#{commonProperties['pageSize']}")
   int pageSize;
   
   public RefundRestController() {
      System.out.println(this.getClass());
   }
   
   @RequestMapping(value = "json/updateRefundStatus/{refundNo}", method = RequestMethod.GET)
   public Refund updateRefundStatus(@ModelAttribute Refund refund, @PathVariable int refundNo,
         @ModelAttribute User user, HttpSession session) throws Exception{
      System.out.println("/refund/json/updateRefundStatus : GET");
      
      refund = refundService.getRefund(refundNo);
            
      user = userService.getUser(refund.getUserId());
      int havingPoint = user.getHavingPoint() - refund.getRefundMoney();
      user.setHavingPoint(havingPoint);
      userService.updateHavingPoint(user);
      
      User admin = (User)session.getAttribute("user");
      int havingPointAdmin =admin.getHavingPoint() - refund.getRefundMoney();
      admin.setHavingPoint(havingPointAdmin);
      userService.updateHavingPoint(admin);
      
      refundService.updateRefund(refund);
      
      return refundService.getRefund(refundNo);
      
   }
   
   @RequestMapping(value="json/authorizeAccount", method=RequestMethod.POST)
   public int authorizeAccount(@RequestBody Refund refund, HttpSession session) throws Exception{

      System.out.println("authorize");
      String bankCode = refundService.getBankCode(refund.getBankName());
      System.out.println("bankCode"+bankCode);
      
      String userId = ((User)session.getAttribute("user")).getUserId();
      User user = userService.getUser(userId);
      
      Map<String, Object> accessToken = refundService.getAccessToken(); //token È¹µæ
      
      Map<String, Object> map = 
            refundService.getAccount((String)accessToken.get("access_token"), refund.getAccountNum(), 9404162, bankCode); 

      if(map.size()<1) {
         System.out.println("true");
         return 0;
      }else {
      
      User owner = userService.getUser(userId);
         if(owner.getAccountNum() == null || owner.getAccountNum() == "") {
            
            System.out.println("@@@@@@@@@@@@@@@@@2ifµé¾î¿È@@@@@@@@@@@@@@@@@");
            owner.setAccountNum(refund.getAccountNum());
            owner.setDateOfBirth(refund.getDateOfBirth());
            owner.setHolder(refund.getHolder());
            owner.setBankCode(bankCode);
            owner.setBankName(refund.getBankName());
            userService.updateAccount(owner);
            
            System.out.println("À¯Àú¿¡ °èÁÂÁ¤º¸ ¾÷µ¥ÀÌÆ® ¿Ï·á");
         }
      }
      return 1;
   }
}