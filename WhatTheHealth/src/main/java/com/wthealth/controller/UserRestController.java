package com.wthealth.controller;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpHost;
import org.apache.http.HttpResponse;
import org.apache.http.auth.AuthScope;
import org.apache.http.auth.UsernamePasswordCredentials;
import org.apache.http.client.AuthCache;
import org.apache.http.client.CredentialsProvider;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.auth.BasicScheme;
import org.apache.http.impl.client.BasicAuthCache;
import org.apache.http.impl.client.BasicCredentialsProvider;
import org.apache.http.impl.client.DefaultHttpClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.wthealth.controller.Config;
import com.wthealth.domain.User;
import com.wthealth.service.user.UserService;

@RestController
@RequestMapping("/user/*")
public class UserRestController {

	///Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	//setter Method 구현 않음
	
	@Resource(name = "mailSender")
	private JavaMailSender javaMailSender;
		
	public UserRestController(){
		System.out.println(this.getClass());
	}
	
	@RequestMapping( value="json/checkId", method=RequestMethod.POST )
	public boolean checkId( @RequestBody User user ) throws Exception{
		
		System.out.println("/user/json/checkId : POST");
		//Business Logic
		boolean result=userService.checkId(user.getUserId());
		

		return result;
	}
	
	@RequestMapping( value="json/checkNickname", method=RequestMethod.POST )
	public boolean checkNickname( @RequestBody User user ) throws Exception{
		
		System.out.println("/user/json/checkNickname : POST");
		//Business Logic
		boolean result=userService.checkNickname(user.getNickName());
		

		return result;
	}
	
	@RequestMapping( value="json/checkAuth/{inputNum}", method=RequestMethod.GET )
	public boolean checkAuth(@PathVariable String inputNum, HttpSession session) throws Exception{
		
		System.out.println("/user/json/checkAuth : GET");
		System.out.println("checkAuth 이메일"+inputNum);
		System.out.println(session.getAttribute("authNum"));
		
		boolean result = false;
	      if (session.getAttribute("authNum").equals(inputNum)) {
	         result=true;
	      }
		
		return result;
	}
	
	@RequestMapping( value="json/sendSMS", method=RequestMethod.POST )
	public void sendSMS(@RequestBody String phone, HttpSession session) throws Exception{
	
		System.out.println("/user/json/sendSMS : POST");
		System.out.println("/user/json/sendSMS : phone "+phone);
		//Business Logic
		//01023923559
		Config config = new Config();
		String[] setphone = phone.split("=");
		config.setReceiver(setphone[1]);
		
		String authNum = "";
		authNum = RandomNum();
		config.setContent("인증번호 ["+authNum+"]를 입력해주세요.");
		
		session.setAttribute("authNum", authNum);
		
		 String hostname = "api.bluehouselab.com";
	        String url = "https://"+hostname+"/smscenter/v1.0/sendsms";

	        CredentialsProvider credsProvider = new BasicCredentialsProvider();
	        credsProvider.setCredentials(
	            new AuthScope(hostname, 443, AuthScope.ANY_REALM),
	            new UsernamePasswordCredentials(Config.appid, Config.apikey)
	        );

	        // Create AuthCache instance
	        AuthCache authCache = new BasicAuthCache();
	        authCache.put(new HttpHost(hostname, 443, "https"), new BasicScheme());

	        // Add AuthCache to the execution context
	        HttpClientContext context = HttpClientContext.create();
	        context.setCredentialsProvider(credsProvider);
	        context.setAuthCache(authCache);
	        
	        //System.out.println(config);

	        DefaultHttpClient client = new DefaultHttpClient();

	        try {
	            HttpPost httpPost = new HttpPost(url);
	            httpPost.setHeader("Content-type", "application/json; charset=utf-8");
	            String json = "{\"sender\":\""+Config.sender+"\",\"receivers\":[\""+config.getReceiver()+"\"],\"content\":\""+Config.content+"\"}";

	            StringEntity se = new StringEntity(json, "UTF-8");
	            httpPost.setEntity(se);

	            HttpResponse httpResponse = client.execute(httpPost, context);
	            System.out.println(httpResponse.getStatusLine().getStatusCode());

	            InputStream inputStream = httpResponse.getEntity().getContent();
	            if(inputStream != null) {
	                BufferedReader bufferedReader = new BufferedReader( new InputStreamReader(inputStream));
	                String line = "";
	                while((line = bufferedReader.readLine()) != null)
	                    System.out.println(line);
	                inputStream.close();
	            }
	        } catch (Exception e) {
	            System.err.println("Error: "+e.getLocalizedMessage());
	        } finally {
	            client.getConnectionManager().shutdown();
	        }

	    }
	
	@RequestMapping(value = "json/sendMail/{email1}/{email2}",  method=RequestMethod.GET) 
	public void sendMail(@PathVariable String email1, @PathVariable String email2, HttpSession session) throws AddressException, MessagingException {
		
		System.out.println("/user/json/sendMail");
		System.out.println("/user/json/sendMail:"+email1+email2);

		String authNum = "";
		authNum = RandomNum();
		
	    sendEmail(email1+"."+email2, authNum);
	    
	    session.setAttribute("authNum", authNum);
	    
	}
	
	public String RandomNum() {
		StringBuffer buffer = new StringBuffer();
		for(int i =0; i<=6; i++) {
			int n = (int)(Math.random()*10);
			buffer.append(n);
		}
		return buffer.toString();
	}
	
	public void sendEmail(String email, String authNum) {
		
		MimeMessagePreparator preparator = new MimeMessagePreparator() {
			
	        @Override
	        public void prepare(MimeMessage paramMimeMessage) throws Exception {
	        	
	            MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(paramMimeMessage, true, "UTF-8");

	            mimeMessageHelper.setTo(email); // 받는사람
	            mimeMessageHelper.setFrom("sh8532k@naver.com"); // 보내는사람
	            mimeMessageHelper.setSubject("인증 메일"); // 메일 제목
	            mimeMessageHelper.setText("인증번호 [ "+authNum+" ]", true); // 메일 내용
	            
	            
	        };
	    }; 
	            
	    try {
	         javaMailSender.send(preparator); // 메일 전송
	    } catch (MailException me) {
	        // 예외처리 코드 (실패시 로그를 남긴다는 지...)
	    	me.printStackTrace();
	    }
		
	}

}
