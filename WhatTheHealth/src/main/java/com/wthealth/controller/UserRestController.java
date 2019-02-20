package com.wthealth.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.annotation.Resource;
import javax.mail.BodyPart;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Part;
import javax.mail.internet.AddressException;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.codehaus.jackson.JsonNode;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
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
	//setter Method ���� ����
	
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
		System.out.println("checkAuth �̸���"+inputNum);
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
		config.setContent("What The Health ������ȣ ["+authNum+"]�� �Է����ּ���.");
		
		
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
		System.out.println("/user/json/sendMail:"+email1+"."+email2);

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

	            mimeMessageHelper.setTo(email); // �޴»��
	            mimeMessageHelper.setFrom("sh8532k@naver.com"); // �����»��
	            mimeMessageHelper.setSubject("What The Health �̸��� ������ �������ּ���."); // ���� ����
	          //  mimeMessageHelper.setText("������ȣ [ "+authNum+" ]", true); // ���� ����
	            
	         // ���Ե� �ؽ�Ʈ�� HTML�̶�� �ǹ̷� true �÷��׸� ����Ѵ�
	            mimeMessageHelper.setText("<html> <link href='https://fonts.googleapis.com/css?family=Noto+Sans+KR' rel='stylesheet'> <body>"
	            		+ "<div style='margin: 0 auto; width:50%; font-family:Noto Sans KR, sans-serif; font-size:15px; border: 2px solid #ddd'><br/>"
	                    + "<div style='text-align:center; margin-top:30px;'><br/>"
	                    + "<img src='cid:identifier1234' width='300px' height='auto' align='middle'/><br/>"
	                    +"</div><br/><br/><p style='padding:50px'><br/><br/>"
	                    +"What The Health �κ��� ������ȣ�� ���۵Ǿ����ϴ�.<br/><br>"
	                    + "ȸ������ <strong>������ȣ</strong>�� &nbsp;&nbsp;"
	                    + "<strong style='font-size:20px; color:#fd5d7c;'>"+authNum+"</strong> �Դϴ�.<br><br/>"
	                    + "<br><br/>*������ȣ ĭ�� �Է��� �ֽñ� �ٶ��ϴ�.<br><br/><br/></p><br/><br/></div></body></html>", true);

	            // �Ǹ���� �������� Sample ������ ÷������ (���⼭�� c:/ ���� �����Ѵ�)
	            FileSystemResource res = new FileSystemResource(new File("C:\\Users\\bit\\git\\mainProject2\\WhatTheHealth\\WebContent\\resources\\images\\logo.png"));
	            mimeMessageHelper.addInline("identifier1234", res);

	        };
	    }; 
	            
	    try {
	         javaMailSender.send(preparator); // ���� ����
	    } catch (MailException me) {
	        // ����ó�� �ڵ� (���н� �α׸� ����ٴ� ��...)
	    	me.printStackTrace();
	    }
		
	}
	
	@RequestMapping(value = "json/getAccount/{userId}",  method=RequestMethod.GET) 
	public User getAccount(@PathVariable String userId, HttpSession session) throws Exception {
		
		System.out.println("/getAccount : GET");
		
		return userService.getAccount(userId);
	}
	
	@RequestMapping(value = "json/addSNSUser",  method=RequestMethod.POST) 
	public int addSNSUser(@RequestBody User user) throws Exception {
	
		System.out.println("/user/json/addUser : POST");

		userService.addUser(user);
			return 1;
		}
	
	@RequestMapping( value="json/login", method=RequestMethod.POST )
	public String login(@RequestBody User user , HttpSession session, HttpServletResponse response ) throws Exception{
		
		System.out.println("/user/login : POST");
		//Business Logic
		System.out.println("���̵�:"+user.getUserId());
		User dbUser=userService.getUser(user.getUserId());
		
		System.out.println("�α��� �־ȵ�:"+dbUser);
		System.out.println(user.getPassword());
		/*System.out.println(dbUser.getPassword());
		System.out.println(dbUser.getUserStatus());
		*/
		if(dbUser==null){	
			System.out.println("db�� ���� ��");
			System.out.println("���ǿ� ����: "+session.getAttribute("user"));
			return "111";
			
		}  else if( ! user.getPassword().equals(dbUser.getPassword())){
			System.out.println("��ġ����������");
			System.out.println("���ǿ� ����: "+session.getAttribute("user"));
			return "222";
			
		}else if(dbUser.getUserStatus().equals("1")){
			System.out.println("Ż��ȸ��");
			System.out.println("���ǿ� ����: "+session.getAttribute("user"));
			return "333";
			
		}else if(dbUser.getUserStatus().equals("2")){
			System.out.println("������Ʈ");
			System.out.println("���ǿ� ����: "+session.getAttribute("user"));
			return "444";
			
		}else if( user.getPassword().equals(dbUser.getPassword())&& dbUser.getUserStatus().equals("0")){
			session.setAttribute("user", dbUser);
			System.out.println("if�� ���Գ�");
			System.out.println("���ǿ� ����: "+session.getAttribute("user"));

		}
		
		//return "redirect:/";
		return "555";
	}
	
	
	//////////////////////////�ȵ���̵�///////////////////////////////////////
	@RequestMapping(value = "json/getUser/{userId}")
	public User getUser(@PathVariable String userId) throws Exception{
		
		return userService.getUser(userId);
		
	}
	
	/*@RequestMapping(value="json/loginUser", method=RequestMethod.POST) 
	public JSONObject loginUser(@RequestBody User user, HttpSession session, HttpServletResponse response) throws Exception{
		
		System.out.println("json/user/loginUser : POST");
		System.out.println("Android �α����� user : " + user);
		
		User dbUser = userService.getUser(user.getUserId());
		System.out.println("dbUser���� Ȯ��" + dbUser);
		
		String userStatus = "null";
		
		if(dbUser==null){	
			System.out.println("db�� ���� ��");
			System.out.println("���ǿ� ����: "+session.getAttribute("user"));
			userStatus = "3"; //db�� ���� �� 
			
		}  else if( ! user.getPassword().equals(dbUser.getPassword())){
			System.out.println("��ġ����������");
			System.out.println("���ǿ� ����: "+session.getAttribute("user"));
			userStatus = "4"; //��й�ȣ�� ��ġ���� ���� ��
			
		}else if(dbUser.getUserStatus().equals("1")){
			System.out.println("Ż��ȸ��");
			System.out.println("���ǿ� ����: "+session.getAttribute("user"));
			userStatus = "1";
			
		}else if(dbUser.getUserStatus().equals("2")){
			System.out.println("������Ʈ");
			System.out.println("���ǿ� ����: "+session.getAttribute("user"));
			userStatus = "2";
			
		}else if( user.getPassword().equals(dbUser.getPassword())&& dbUser.getUserStatus().equals("0")){
			session.setAttribute("user", dbUser);
			System.out.println("if�� ���Գ�");
			System.out.println("���ǿ� ����: "+session.getAttribute("user"));
			userStatus = "0";
		}
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("userStatus", userStatus);
		
		System.out.println("Login JSONData userStatus : " + jsonObject.toString());
		
		return jsonObject;
	}
	*/
	@RequestMapping(value = "json/loginUserAndroid")
	public User getUser(HttpServletRequest request, HttpSession session) throws Exception {

		System.out.println("json/loginUserAndroid [getUser]����");
		String userId = request.getParameter("userId");
		String password = request.getParameter("password");
		if (userService.getUser(userId) == null) {
			System.out.println("��񿡾����� return ");
			return null;
		} else {
			User user = userService.getUser(userId);
			if (user.getPassword().equals(password)) {
				session.setAttribute("user", user);
				System.out.println("���ǻ���");
				return user;
			} else {
				System.out.println("���ǻ���X");
				return null;
			}
		}
	}

	@RequestMapping(value = "json/logoutUserAndroid")
	public int logOutUser(HttpSession session) throws Exception {
		System.out.println("�������췯���");
		if (session != null) {
			session.removeAttribute("user");
			System.out.println("������");
			return 0;
		} else {
			System.out.println("���� null�ƴ϶� ��������");
			return 1;
		}
	}
	
	@RequestMapping( value="josn/kakaoLogin", produces ="applcation/json", method= {RequestMethod.GET, RequestMethod.POST} )
	public String kakaoLogin(@RequestParam("code") String code , HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model) throws Exception{

		System.out.println("kakaoLogin: GET/POST");
		System.out.println("code: "+code);
		

		JsonNode token = KakaoLogin.getAccessToken(code);

		JsonNode profile = KakaoLogin.getKakaoUserInfo(token.path("access_token").toString());
		System.out.println("īī�������� : "+profile);
		User user = KakaoLogin.changeData(profile);
		System.out.println("īī������1111: "+user);
		user.setUserId("k"+user.getUserId());
		//user.setUserId(user.getEmail());
		user.setAccessToken(token.path("access_token").toString());
		user.setSnsType("1");
		System.out.println("īī������2222: "+user);

		/*System.out.println(session);
		session.setAttribute("user", vo);
		System.out.println("���ǿ� ���� ");
		System.out.println(vo.toString());*/
		
		if(userService.getUser(user.getUserId())==null) {
			//vo.setPassword(vo.getUserId());
			//session.setAttribute("kakaoUser", user);
			model.addAttribute("user", user);
			System.out.println("īī������333: "+user);
			return "forward:/user/addSNSUser.jsp";
			
		} else if(userService.getUser(user.getUserId())!=null) {
			User dbUser=userService.getUser(user.getUserId());
			session.setAttribute("user", dbUser);
			System.out.println("���ǿ� ���� "+session.getAttribute("user"));
			System.out.println(user.toString());
		}
		//userService.addUser(vo);
		
	
		 //vo = service.kakaoLogin(vo);  
		//return "redirect:/main.jsp";
		return "forward:/user/kakaoLogin.jsp";
	}
	
}
