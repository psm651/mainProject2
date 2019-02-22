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
	//setter Method 구현 않음
	
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
		System.out.println("아이디:"+user.getUserId());
		User dbUser=userService.getUser(user.getUserId());
		
		System.out.println("로그인 왜안돼:"+dbUser);
		System.out.println(user.getPassword());
		/*System.out.println(dbUser.getPassword());
		System.out.println(dbUser.getUserStatus());
		*/
		if(dbUser==null){	
			System.out.println("db에 없을 때");
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = response.getWriter();	 
			out.println("<script>alert('존재하지 않는 회원입니다.');</script>");
			out.flush();
			System.out.println("세션에 들어갔나: "+session.getAttribute("user"));
			return "../";
			
		}  else if( ! user.getPassword().equals(dbUser.getPassword())){
			System.out.println("일치하지않을때");
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = response.getWriter();	 
			out.println("<script>alert('아이디 혹은 비밀번호가 틀렸습니다.');</script>");
			out.flush();
			System.out.println("세션에 들어갔나: "+session.getAttribute("user"));
			return "../";
			
		}else if(dbUser.getUserStatus().equals("1")){
			System.out.println("탈퇴회원");
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = response.getWriter();	 
			out.println("<script>alert('탈퇴한 회원입니다.');</script>");
			out.flush();
			System.out.println("세션에 들어갔나: "+session.getAttribute("user"));
			return "../";
			
		}else if(dbUser.getUserStatus().equals("2")){
			System.out.println("블랙리스트");
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = response.getWriter();	 
			out.println("<script>alert('블랙리스트 처리된 회원입니다.');</script>");
			out.flush();
			System.out.println("세션에 들어갔나: "+session.getAttribute("user"));
			return "../";
			
		}else if( user.getPassword().equals(dbUser.getPassword())&& dbUser.getUserStatus().equals("0")){
			session.setAttribute("user", dbUser);
			System.out.println("if문 들어왔나");
			System.out.println("세션에 들어갔나: "+session.getAttribute("user"));
			
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
			System.out.println("사진 있을 때: "+user.getUserImage());
			
		} else if(uploadFile.getOriginalFilename().equals("")) {
			
			user.setUserImage("");
			userService.addUser(user);
			System.out.println("없을때: "+user.getUserImage());
		}
		
		return "redirect:/";
	}
	
	@RequestMapping( value="kakaoLogin", produces ="applcation/json", method= {RequestMethod.GET, RequestMethod.POST} )
	public String kakaoLogin(@RequestParam("code") String code , HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model) throws Exception{

		System.out.println("kakaoLogin: GET/POST");
		System.out.println("code: "+code);
		

		JsonNode token = KakaoLogin.getAccessToken(code);

		JsonNode profile = KakaoLogin.getKakaoUserInfo(token.path("access_token").toString());
		System.out.println("카카오프로필 : "+profile);
		User user = KakaoLogin.changeData(profile);
		System.out.println("카카오유저1111: "+user);
		user.setUserId("k"+user.getUserId());
		//user.setUserId(user.getEmail());
		user.setAccessToken(token.path("access_token").toString());
		user.setSnsType("1");
		System.out.println("카카오유저2222: "+user);

		/*System.out.println(session);
		session.setAttribute("user", vo);
		System.out.println("세션에 들어갔나 ");
		System.out.println(vo.toString());*/
		
		if(userService.getUser(user.getUserId())==null) {
			//vo.setPassword(vo.getUserId());
			//session.setAttribute("kakaoUser", user);
			model.addAttribute("user", user);
			System.out.println("카카오유저333: "+user);
			return "forward:/user/addSNSUser.jsp";
			
		} else if(userService.getUser(user.getUserId())!=null) {
			User dbUser=userService.getUser(user.getUserId());
			session.setAttribute("user", dbUser);
			System.out.println("세션에 들어갔나 "+session.getAttribute("user"));
			System.out.println(user.toString());
		}
		//userService.addUser(vo);
		
	
		 //vo = service.kakaoLogin(vo);  
		//return "redirect:/main.jsp";
		return "forward:/user/kakaoLogin.jsp";
	}
	
	@RequestMapping(value="naverLogin")
	public String naverLogin(HttpSession session, Model model) {
		/* 네아로 인증 URL을 생성하기 위하여 getAuthorizationUrl을 호출 */
		String naverAuthUrl = naverLogin.getAuthorizationUrl(session);
		System.out.println("controller 호출");
		System.out.println(naverAuthUrl);
		
		//model.addAttribute("user/naverLogin", naverAuthUrl);
		model.addAttribute("url", naverAuthUrl);
		return "forward:/user/loginNaver.jsp";
	}

	@RequestMapping(value="callback")
	public String callback(@RequestParam String code, @RequestParam String state, HttpSession session, Model model) throws Exception {
		/* 네아로 인증이 성공적으로 완료되면 code 파라미터가 전달되며 이를 통해 access token을 발급 */
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
			System.out.println("네이버유저333: "+user);
			return "forward:/user/addSNSUser.jsp";
			
		} else if(userService.getUser(user.getUserId())!=null) {
			User dbUser=userService.getUser(user.getUserId());
			session.setAttribute("user", dbUser);
			System.out.println("세션에 들어갔나 "+session.getAttribute("user"));
			System.out.println(user.toString());
		}
	
		return "forward:/";
	}
	
	@RequestMapping( value="getUser", method=RequestMethod.GET )
	public String getUser( @RequestParam("userId") String userId , Model model ) throws Exception {
		
		System.out.println("/user/getUser : GET");
		//Business Logic
		User user = userService.getUser(userId);
		/////////////////////채팅리스트 추가추가///////////////////
		List<Chatting> list1 = chattingService.listChatting1(userId);
		List<Chatting> list2 = chattingService.listChatting2(userId);
		/////////////////////////////////////////////////////
		
		// Model 과 View 연결
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
		/////////////////////채팅리스트 추가추가///////////////////
		List<Chatting> list1 = chattingService.listChatting1(userId);
		List<Chatting> list2 = chattingService.listChatting2(userId);
		/////////////////////////////////////////////////////
		
		// Model 과 View 연결
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
		// Model 과 View 연결
		model.addAttribute("user", user);
		
		return "forward:/user/updateUser.jsp";
	}

	@RequestMapping( value="updateUser", method=RequestMethod.POST )
	public String updateUser( @ModelAttribute("user") User user , @RequestParam("uploadFile") MultipartFile uploadFile, Model model , HttpSession session) throws Exception{

		System.out.println("이건처음유젇니다!!!!!"+user);
		System.out.println("/user/updateUser : POST");
		//Business Logic
		
		if(uploadFile.getOriginalFilename().equals("")) {
			user.setUserImage(uploadFile.getOriginalFilename());
			userService.updateUser(user);
			System.out.println("같을때: "+user.getUserImage());
		} else if(! uploadFile.getOriginalFilename().equals("")) {
			String filePath = "C:\\Users\\bit\\git\\mainProject2\\WhatTheHealth\\WebContent\\resources\\images\\userImage\\";
			File file = new File(filePath , uploadFile.getOriginalFilename());
			uploadFile.transferTo(file); 
			user.setUserImage(uploadFile.getOriginalFilename());
			userService.updateUser(user);
			System.out.println("다를때: "+user.getUserImage());
		}
		//위대한 성민오빠님 추가문 
		user=userService.getUser(user.getUserId());
		System.out.println("이러니까 안되지 으이구으이구으유!!"+user);
		//여기까지- 근데 세션에 유저업데이트된거 넣을필요있나??아이디나 롤만있음되자나...아닌가 뚱카롱먹고싶다
		String sessionId=((User)session.getAttribute("user")).getUserId();
		if(sessionId.equals(user.getUserId())){
			session.setAttribute("user", user);
			System.out.println("세션에 들어갔나: "+session.getAttribute("user"));
		}
		
		return "redirect:/user/getUser?userId="+user.getUserId();
	}
	
	@RequestMapping( value="deleteUser", method=RequestMethod.GET )
	public String deleteUser( @RequestParam("userId") String userId , Model model ) throws Exception{

		System.out.println("/user/deleteUser : GET");
		//Business Logic
		User user = userService.getUser(userId);
		// Model 과 View 연결
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
			System.out.println("탈퇴하기");
			
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = response.getWriter();	 
			out.println("<script>alert('탈퇴가 완료되었습니다.');</script>");
			out.flush();

			return "/";
		} else
			//session.invalidate();
			System.out.println("탈퇴하기 실패");
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = response.getWriter();	 
			out.println("<script>alert('아이디 혹은 비밀번호가 일치하지 않습니다.');</script>");
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
			System.out.println("아이디 찾기 실패");
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = response.getWriter();	 
			out.println("<script>alert('닉네임 혹은 이메일이 일치하지 않습니다.');</script>");
			out.flush();
			return "/user/findId.jsp";
			
		} else if(user.getNickName().equals(dbUser.getNickName()) && user.getEmail().equals(dbUser.getEmail())) {
			//String findId = dbUser.getUserId();
			System.out.println("아이디 찾기 성공");
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = response.getWriter();	 
			out.println("<script>alert('회원님의 아이디는 "+dbUser.getUserId()+"입니다.');</script>");
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
			System.out.println("비밀번호 찾기 실패");
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = response.getWriter();	 
			out.println("<script>alert('닉네임 혹은 이메일이 일치하지 않습니다.');</script>");
			out.flush();
			return "/user/findPassword.jsp";
			
		} else if(user.getNickName().equals(dbuser.getNickName()) && user.getEmail().equals(dbuser.getEmail())) {
			//String findId = dbUser.getUserId();
			System.out.println("비밀번호 찾기 성공");
			
			sendPassword(user.getEmail(), authNum);
			user.setPassword(authNum);
			userService.findPassword(user);
			
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = response.getWriter();	 
			out.println("<script>alert('임시 비밀번호가 이메일로 전송되었습니다.');</script>");
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

	            mimeMessageHelper.setTo(email); // 받는사람
	            mimeMessageHelper.setFrom("sh8532k@naver.com"); // 보내는사람
	            mimeMessageHelper.setSubject("임시 비밀번호 전송"); // 메일 제목
	            mimeMessageHelper.setText("임시 비밀번호 [ "+authNum+" ]", true); // 메일 내용	            
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
