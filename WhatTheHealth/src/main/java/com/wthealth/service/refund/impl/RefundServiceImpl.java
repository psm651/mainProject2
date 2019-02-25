package com.wthealth.service.refund.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.wthealth.common.Search;
import com.wthealth.common.URLConnection;
import com.wthealth.domain.Refund;
import com.wthealth.service.refund.RefundDao;
import com.wthealth.service.refund.RefundService;

@Service("refundServiceImpl")
public class RefundServiceImpl implements RefundService {
   
   private final static String CLIENT_ID = "l7xx89273312031c4c37a9ff6d29ae9c34f0";
   private final static String CLIENT_SECRET = "c396f9034254409d9da68ab3da3757c8";

   private final static String REDIRECT_URI = "http://127.0.0.1:8080/refund/authorizeAccount";
   private final static String GET_TOKEN_API_URI = "https://testapi.open-platform.or.kr/oauth/2.0/token"; // AccessToken획占쏙옙
   private final static String REAL_NAME_URI = "https://testapi.open-platform.or.kr/v1.0/inquiry/real_name"; // 怨꾩쥖�떎紐낆“�쉶
   //private final static String DEPOSIT_URI = "https://testapi.open-platform.or.kr/transfer/deposit2"; // �엯湲덉씠泥�

   @Autowired
   @Qualifier("refundDaoImpl")
   private RefundDao refundDao;

   public void setRefundDao(RefundDao refundDao) {
      this.refundDao = refundDao;
   }

   public RefundServiceImpl() {
      System.out.println(this.getClass());
   }

   @Override
   public void addRefund(Refund refund) throws Exception {
      refundDao.addRefund(refund);
   }

   @Override
   public Refund getRefund(int refundNo) throws Exception {
      return refundDao.getRefund(refundNo);
   }

   @Override
   public Map<String, Object> listRefund(Search search, String userId) throws Exception {
      List<Refund> list = refundDao.listRefund(search, userId);
      int totalCount = refundDao.getTotalCount(search, userId);

      Map<String, Object> map = new HashMap<String, Object>();
      map.put("list", list);
      map.put("totalCount", new Integer(totalCount));

      return map;
   }

   @Override
   public void updateRefund(Refund refund) throws Exception {
      refundDao.updateRefund(refund);
   }

   @Override
   public Map<String, Object> listRefundAdmin(Search search) throws Exception {
      List<Refund> listAdmin = refundDao.listRefundAdmin(search);
      int totalCount = refundDao.getTotalCountForAdmin(search);

      Map<String, Object> map = new HashMap<String, Object>();
      map.put("listAdmin", listAdmin);
      map.put("totalCount", new Integer(totalCount));

      return map;
   }

   @Override
   public JSONObject getAccessToken() throws Exception {
      System.out.println("getAccessToken()");

      String param = "client_id=" + CLIENT_ID + "&client_secret=" + CLIENT_SECRET 
            + "&get_token_api_uri=" + GET_TOKEN_API_URI + "&grant_type=client_credentials";

      System.out.println(GET_TOKEN_API_URI + "?" + param);

      JSONObject obj = URLConnection.getJSON_PARAM("POST", GET_TOKEN_API_URI, param,
            "application/x-www-form-urlencoded;charset=UTF-8");

      String access_token = obj.get("access_token").toString();
      //String user_seq_no = obj.get("user_seq_no").toString();

      System.out.println("accessToken :: " + access_token);

      // seq_no DB占쏙옙 占쏙옙占쏙옙
      //System.out.println("占쏙옙占쏙옙薇占싫� :: " + user_seq_no);

      return obj;
   }
   
   @Override
   public Map<String, Object> getAccount(String accessToken, String accountNum, int accountHolderinfo, String bankCode)
         throws Exception {
      System.out.println("getAccount()");

      Calendar cal = Calendar.getInstance();
      SimpleDateFormat fmt = new SimpleDateFormat("yyyyMMddHHmmss");

      String refundReqDate = fmt.format(cal.getTime());

      JSONObject param = new JSONObject();
      param.put("bank_code_std", bankCode);
      param.put("account_num", accountNum);
      param.put("account_holder_info", accountHolderinfo); //dateOfBirth占쏙옙
      param.put("tran_dtime", refundReqDate); 

      System.out.println(REAL_NAME_URI + "?" + param);

      JSONObject obj = URLConnection.getJSON_PARAM("POST", REAL_NAME_URI, param.toString(),
            "application/json; charset=UTF-8", "Authorization", "Bearer " + accessToken);
      Map<String, Object> map = new HashMap<String, Object>();
      System.out.println("서비스임플:::"+obj.get("rsp_code"));
      if(obj.get("rsp_code").toString().equals("A0004")) {
         return map;
         
      }else {
      map.put("holder", obj.get("account_holder_name").toString());
      map.put("accountNum", obj.get("account_num").toString());
      map.put("bankName", obj.get("bank_name").toString());
      map.put("bankCode", obj.get("bank_code_std").toString());
      
      System.out.println("map : "+map);
      }
      return map;
   }

   @Override
   public String getBankCode(String bankName) throws Exception {
      System.out.println("listBankCode() ");
      Map<String, Object> map = new HashMap<String, Object>();
      map.put("국민은행", "004");
      map.put("기업은행", "003");
      map.put("새마을금고", "045");
      map.put("농협", "011");
      map.put("신한은행", "088");
      map.put("우리은행", "020");
      map.put("외환은행", "005");
      map.put("카카오뱅크", "090");
      map.put("SC제일은행", "023");
      map.put("씨티은행", "027");
      map.put("우체국", "071");
      
      return (String)map.get(bankName);
   }
   
   

   /*@Override
   public Map<String, Object> deposit(String accessToken, String accountNum, int accountHolderinfo, String bankCode)
         throws Exception {
      System.out.println("deposit() Service!!!!!!");
      
      Calendar cal = Calendar.getInstance();
      SimpleDateFormat fmt = new SimpleDateFormat("yyyyMMddHHmmss");

      String refundReqDate = fmt.format(cal.getTime());

      JSONObject param = new JSONObject();
      param.put("bank_code_std", bankCode);
      param.put("account_num", accountNum);
      //param.put("account_holder_name", "占쏙옙占쏙옙占쏙옙"); //占싱곤옙 占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙.
      param.put("account_holder_info", accountHolderinfo); //dateOfBirth占쏙옙
      param.put("tran_dtime", refundReqDate); 
      param.put("wd_pass_phrase", "NONE");   
      param.put("wd_print_content   ", "占쌈댐옙占쏙스");   
      param.put("req_cnt", 1);
      
      List<Object> list = new ArrayList<Object>();
      list.add(1);
      list.add(004);
      list.add("84860204104911");
      list.add("占쌈댐옙占쏙스");
      list.add(1000);
      list.add(refundReqDate);
      
      param.put("req_list", list);
      
      Map<String, Object> map2 = new HashMap<String, Object>();
      map2.put("tran_no", "1");
      map2.put("bank_code_std", "004");
      map2.put("account_num", "84860204104911");
      map2.put("account_holder_name", "占쏙옙占쏙옙占쏙옙");
      map2.put("print_content", "占쌈댐옙占쏙스");
      map2.put("tran_amt", "1000");
      //map2.put("cms_no", "123456789123");
      //map2.put("tran_dtime", refundReqDate);

      param.put("req_list", map2);
      
      System.out.println(DEPOSIT_URI + "?" + param);

      JSONObject obj = URLConnection.getJSON_PARAM("POST", DEPOSIT_URI, param.toString(),
            "application/json; charset=UTF-8", "Authorization", "Bearer " + accessToken);

      Map<String, Object> map = new HashMap<String, Object>(); //占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占싹몌옙 map占쏙옙 obj.get 占쏙옙占쏙옙 占쏙옙載ｏ옙占�.
      map.put("holder", obj.get("account_holder_name").toString());
      map.put("accountNum", obj.get("account_num").toString());
      map.put("bankName", obj.get("bank_name").toString());
      map.put("bankCode", obj.get("bank_code_std").toString());
      
      System.out.println("map2 : "+map2);
      
      return map;
   }*/

   

}