package com.wthealth.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonNode;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.wthealth.domain.Chatting;
import com.wthealth.domain.NaverLogin;
import com.wthealth.domain.User;
import com.wthealth.service.chatting.ChattingService;
import com.wthealth.service.user.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {
	
	///Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	//setter Method ���� ����
	
	///Field
	@Autowired
	@Qualifier("chattingServiceImpl")
	private ChattingService chattingService;
	
	@Resource(name = "mailSender")
	private JavaMailSender javaMailSender;
	
	private NaverLogin naverLogin;
	
	@Resource(name = "naverLogin")
	private void setNaverLogin(NaverLogin naverLogin){
		this.naverLogin = naverLogin;
	}

	
	private String apiResult = null;
	
	JsonStringParse jsonparse = new JsonStringParse();


	public UserController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	
	@RequestMapping( value="login", method=RequestMethod.GET )
	public String login() throws Exception{
		
		System.out.println("/user/login : GET");

		return "forward:/user/login.jsp";
	}


	@RequestMapping( value="login", method=RequestMethod.POST )
	public String login(@ModelAttribute("user") User user , HttpSession session, HttpServletResponse response ) throws Exception{
		
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
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = response.getWriter();	 
			out.println("<script>alert('�������� �ʴ� ȸ���Դϴ�.');</script>");
			out.flush();
			System.out.println("���ǿ� ����: "+session.getAttribute("user"));
			return "../";
			
		}  else if( ! user.getPassword().equals(dbUser.getPassword())){
			System.out.println("��ġ����������");
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = response.getWriter();	 
			out.println("<script>alert('���̵� Ȥ�� ��й�ȣ�� Ʋ�Ƚ��ϴ�.');</script>");
			out.flush();
			System.out.println("���ǿ� ����: "+session.getAttribute("user"));
			return "../";
			
		}else if(dbUser.getUserStatus().equals("1")){
			System.out.println("Ż��ȸ��");
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = response.getWriter();	 
			out.println("<script>alert('Ż���� ȸ���Դϴ�.');</script>");
			out.flush();
			System.out.println("���ǿ� ����: "+session.getAttribute("user"));
			return "../";
			
		}else if(dbUser.getUserStatus().equals("2")){
			System.out.println("������Ʈ");
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = response.getWriter();	 
			out.println("<script>alert('������Ʈ ó���� ȸ���Դϴ�.');</script>");
			out.flush();
			System.out.println("���ǿ� ����: "+session.getAttribute("user"));
			return "../";
			
		}else if( user.getPassword().equals(dbUser.getPassword())&& dbUser.getUserStatus().equals("0")){
			session.setAttribute("user", dbUser);
			System.out.println("if�� ���Գ�");
			System.out.println("���ǿ� ����: "+session.getAttribute("user"));
			
		}
		
		return "redirect:/";

		
	}
		
	
	@RequestMapping( value="logout", method=RequestMethod.GET )
	public String logout(HttpSession session ) throws Exception{
		
		System.out.println("/user/logout : POST");
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	@RequestMapping( value="addUser", method=RequestMethod.GET )
	public String addUser() throws Exception{
	
		System.out.println("/user/addUser : GET");
		
		return "redirect:/user/addUser.jsp";
	}
	
	@RequestMapping( value="addUser", method=RequestMethod.POST )
	public String addUser( @ModelAttribute("user") User user, @RequestParam("uploadFile") MultipartFile uploadFile ) throws Exception {

		System.out.println("/user/addUser : POST");
		//Business Logic
		if(! uploadFile.getOriginalFilename().equals("")) {
			String filePath = "C:\\Users\\bit\\git\\mainProject2\\WhatTheHealth\\WebContent\\resources\\images\\userImage\\";
			File file = new File(filePath , uploadFile.getOriginalFilename());
			uploadFile.transferTo(file); 
			user.setUserImage(uploadFile.getOriginalFilename());
			userService.addUser(user);
			System.out.println("���� ���� ��: "+user.getUserImage());
			
		} else if(uploadFile.getOriginalFilename().equals("")) {
			
			user.setUserImage("");
			userService.addUser(user);
			System.out.println("������: "+user.getUserImage());
		}
		
		return "redirect:/";
	}
	
	@RequestMapping( value="kakaoLogin", produces ="applcation/json", method= {RequestMethod.GET, RequestMethod.POST} )
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
	
	@RequestMapping(value="naverLogin")
	public String naverLogin(HttpSession session, Model model) {
		/* �׾Ʒ� ���� URL�� �����ϱ� ���Ͽ� getAuthorizationUrl�� ȣ�� */
		String naverAuthUrl = naverLogin.getAuthorizationUrl(session);
		System.out.println("controller ȣ��");
		System.out.println(naverAuthUrl);
		
		//model.addAttribute("user/naverLogin", naverAuthUrl);
		model.addAttribute("url", naverAuthUrl);
		return "forward:/user/loginNaver.jsp";
	}

	@RequestMapping(value="callback")
	public String callback(@RequestParam String code, @RequestParam String state, HttpSession session, Model model) throws Exception {
		/* �׾Ʒ� ������ ���������� �Ϸ�Ǹ� code �Ķ���Ͱ� ���޵Ǹ� �̸� ���� access token�� �߱� */
		System.out.println("callbackkkkk");
		OAuth2AccessToken oauthToken = naverLogin.getAccessToken(session, code, state);
		apiResult = naverLogin.getUserProfile(oauthToken);
		//System.out.println(apiResult);

		JSONObject jsonobj = jsonparse.stringToJson(apiResult, "response");
		String gender = jsonparse.JsonToString(jsonobj, "gender");
		String snsId = jsonparse.JsonToString(jsonobj, "id");
		String name = jsonparse.JsonToString(jsonobj, "name");

		User user = new User();
		user.setUserId("n"+snsId);
		user.setIdToken(snsId);
		user.setNickName(name);
		//user.setGender(gender);
		
		if(gender.equals("F")) {
			user.setGender("0");
		} else {
			user.setGender("1");
		}
		
		
		user.setSnsType("2");
		user.setPassword(snsId);
		System.out.println(name);
		/*try {
			userService.addUser(user);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		
		if(userService.getUser(user.getUserId())==null) {
			//vo.setPassword(vo.getUserId());
			//session.setAttribute("kakaoUser", user);
			model.addAttribute("user", user);
			System.out.println("���̹�����333: "+user);
			return "forward:/user/addSNSUser.jsp";
			
		} else if(userService.getUser(user.getUserId())!=null) {
			User dbUser=userService.getUser(user.getUserId());
			session.setAttribute("user", dbUser);
			System.out.println("���ǿ� ���� "+session.getAttribute("user"));
			System.out.println(user.toString());
		}
	
		return "forward:/";
	}
	
	@RequestMapping( value="getUser", method=RequestMethod.GET )
	public String getUser( @RequestParam("userId") String userId , Model model ) throws Exception {
		
		System.out.println("/user/getUser : GET");
		//Business Logic
		User user = userService.getUser(userId);
		/////////////////////ä�ø���Ʈ �߰��߰�///////////////////
		List<Chatting> list1 = chattingService.listChatting1(userId);
		List<Chatting> list2 = chattingService.listChatting2(userId);
		/////////////////////////////////////////////////////
		
		// Model �� View ����
		model.addAttribute("user", user);
		model.addAttribute("chattinglist1", list1);
		model.addAttribute("chattinglist2", list2);
		
		return "forward:/user/getUser.jsp";
	}
	
	@RequestMapping( value="getUserMeeting", method=RequestMethod.GET )
	public String getUserMeeting( @RequestParam("userId") String userId , Model model ) throws Exception {
		
		System.out.println("/user/getUserMeeting : GET");
		//Business Logic
		User user = userService.getUser(userId);
		/////////////////////ä�ø���Ʈ �߰��߰�///////////////////
		List<Chatting> list1 = chattingService.listChatting1(userId);
		List<Chatting> list2 = chattingService.listChatting2(userId);
		/////////////////////////////////////////////////////
		
		// Model �� View ����
		model.addAttribute("user", user);
		model.addAttribute("chattinglist1", list1);
		model.addAttribute("chattinglist2", list2);
		
		return "forward:/user/getUserMeeting.jsp";
	}
	
	
	@RequestMapping( value="updateUser", method=RequestMethod.GET )
	public String updateUser( @RequestParam("userId") String userId , Model model ) throws Exception{

		System.out.println("/user/updateUser : GET");
		//Business Logic
		User user = userService.getUser(userId);
		// Model �� View ����
		model.addAttribute("user", user);
		
		return "forward:/user/updateUser.jsp";
	}

	@RequestMapping( value="updateUser", method=RequestMethod.POST )
	public String updateUser( @ModelAttribute("user") User user , @RequestParam("uploadFile") MultipartFile uploadFile, Model model , HttpSession session) throws Exception{

		System.out.println("�̰�ó�������ϴ�!!!!!"+user);
		System.out.println("/user/updateUser : POST");
		//Business Logic
		
		if(uploadFile.getOriginalFilename().equals("")) {
			user.setUserImage(uploadFile.getOriginalFilename());
			userService.updateUser(user);
			System.out.println("������: "+user.getUserImage());
		} else if(! uploadFile.getOriginalFilename().equals("")) {
			String filePath = "C:\\Users\\bit\\git\\mainProject2\\WhatTheHealth\\WebContent\\resources\\images\\userImage\\";
			File file = new File(filePath , uploadFile.getOriginalFilename());
			uploadFile.transferTo(file); 
			user.setUserImage(uploadFile.getOriginalFilename());
			userService.updateUser(user);
			System.out.println("�ٸ���: "+user.getUserImage());
		}
		//������ ���ο����� �߰��� 
		user=userService.getUser(user.getUserId());
		System.out.println("�̷��ϱ� �ȵ��� ���̱����̱�����!!"+user);
		//�������- �ٵ� ���ǿ� ����������Ʈ�Ȱ� �����ʿ��ֳ�??���̵� �Ѹ��������ڳ�...�ƴѰ� ��ī�ո԰�ʹ�
		String sessionId=((User)session.getAttribute("user")).getUserId();
		if(sessionId.equals(user.getUserId())){
			session.setAttribute("user", user);
			System.out.println("���ǿ� ����: "+session.getAttribute("user"));
		}
		
		return "redirect:/user/getUser?userId="+user.getUserId();
	}
	
	@RequestMapping( value="deleteUser", method=RequestMethod.GET )
	public String deleteUser( @RequestParam("userId") String userId , Model model ) throws Exception{

		System.out.println("/user/deleteUser : GET");
		//Business Logic
		User user = userService.getUser(userId);
		// Model �� View ����
		model.addAttribute("user", user);
		
		return "forward:/user/deleteUser.jsp";
	}

	@RequestMapping( value="deleteUser", method=RequestMethod.POST )
	public String deleteUser( @ModelAttribute("user") User user , Model model , HttpSession session, HttpServletResponse response) throws Exception{

		System.out.println("/user/deleteUser : POST");
		//Business Logic
		
		
		String sessionId=((User)session.getAttribute("user")).getUserId();
		String sessionPw = ((User)session.getAttribute("user")).getPassword();
		if(sessionId.equals(user.getUserId()) && sessionPw.equals(user.getPassword())){
			userService.deleteUser(user);	
			session.removeAttribute("user");
			System.out.println("Ż���ϱ�");
			
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = response.getWriter();	 
			out.println("<script>alert('Ż�� �Ϸ�Ǿ����ϴ�.');</script>");
			out.flush();

			return "/";
		} else
			//session.invalidate();
			System.out.println("Ż���ϱ� ����");
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = response.getWriter();	 
			out.println("<script>alert('���̵� Ȥ�� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.');</script>");
			out.flush();

		return "/user/deleteUser.jsp";
	}
	
	@RequestMapping( value="findId", method=RequestMethod.GET )
	public String findId() throws Exception {
		
		System.out.println("/user/findId : GET");
		
		return "redirect:/user/findId.jsp";
	}
	
	@RequestMapping( value="findId", method=RequestMethod.POST )
	public String findId(@RequestParam("nickName") String nickName, @ModelAttribute("user") User user, HttpServletResponse response) throws Exception{

		System.out.println("/user/findId : POST");
		//Business Logic
		User dbUser=userService.findId(nickName);
		System.out.println(dbUser);
		
		if(dbUser == null) {
			System.out.println("���̵� ã�� ����");
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = response.getWriter();	 
			out.println("<script>alert('�г��� Ȥ�� �̸����� ��ġ���� �ʽ��ϴ�.');</script>");
			out.flush();
			return "/user/findId.jsp";
			
		} else if(user.getNickName().equals(dbUser.getNickName()) && user.getEmail().equals(dbUser.getEmail())) {
			//String findId = dbUser.getUserId();
			System.out.println("���̵� ã�� ����");
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = response.getWriter();	 
			out.println("<script>alert('ȸ������ ���̵�� "+dbUser.getUserId()+"�Դϴ�.');</script>");
			out.flush();
			return "/";
			
		}
		return "/";
	}
	
	
	@RequestMapping( value="findPassword", method=RequestMethod.GET )
	public String findPassword() throws Exception {
		
		System.out.println("/user/findPassword : GET");
		
		return "redirect:/user/findPassword.jsp";
	}
	
	@RequestMapping( value="findPassword", method=RequestMethod.POST )
	public String findPassword(@RequestParam("nickName") String nickName, @ModelAttribute("user") User user, HttpServletResponse response) throws Exception{

		System.out.println("/user/findPassword : POST");
		//Business Logic
		User dbuser = userService.findId(nickName);
		System.out.println(dbuser);
		
		String authNum = "";
		authNum = RandomNum();
		
	    		
		if(dbuser == null) {
			System.out.println("��й�ȣ ã�� ����");
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = response.getWriter();	 
			out.println("<script>alert('�г��� Ȥ�� �̸����� ��ġ���� �ʽ��ϴ�.');</script>");
			out.flush();
			return "/user/findPassword.jsp";
			
		} else if(user.getNickName().equals(dbuser.getNickName()) && user.getEmail().equals(dbuser.getEmail())) {
			//String findId = dbUser.getUserId();
			System.out.println("��й�ȣ ã�� ����");
			
			sendPassword(user.getEmail(), authNum);
			user.setPassword(authNum);
			userService.findPassword(user);
			
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = response.getWriter();	 
			out.println("<script>alert('�ӽ� ��й�ȣ�� �̸��Ϸ� ���۵Ǿ����ϴ�.');</script>");
			out.flush();
			return "/";
			
		}
		
		return "/";
	}
	
	public String RandomNum() {
		StringBuffer buffer = new StringBuffer();
		for(int i =0; i<=6; i++) {
			int n = (int)(Math.random()*10);
			buffer.append(n);
		}
		return buffer.toString();
	}
	
	public void sendPassword(String email, String authNum) {
		
		MimeMessagePreparator preparator = new MimeMessagePreparator() {
			
	        @Override
	        public void prepare(MimeMessage paramMimeMessage) throws Exception {
	        	
	            MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(paramMimeMessage, true, "UTF-8");

	            mimeMessageHelper.setTo(email); // �޴»��
	            mimeMessageHelper.setFrom("sh8532k@naver.com"); // �����»��
	            mimeMessageHelper.setSubject("�ӽ� ��й�ȣ ����"); // ���� ����
	            mimeMessageHelper.setText("�ӽ� ��й�ȣ [ "+authNum+" ]", true); // ���� ����	            
	        };
	    }; 
	            
	    try {
	         javaMailSender.send(preparator); // ���� ����
	    } catch (MailException me) {
	        // ����ó�� �ڵ� (���н� �α׸� ����ٴ� ��...)
	    	me.printStackTrace();
	    }
		
	}

}
