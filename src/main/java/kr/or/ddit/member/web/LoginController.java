package kr.or.ddit.member.web;

import com.github.scribejava.core.model.OAuth2AccessToken;

import kr.or.ddit.commons.util.KISA_SHA256;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.member.service.MemberServiceInf;
import kr.or.ddit.oauth.bo.JsonParser;
import kr.or.ddit.oauth.bo.NaverLoginBO;
import kr.or.ddit.work.service.WorkServiceInf;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;

/**
 * LoginController.java
 *
 * @author 나진실
 * @version 1.0
 * @see <pre> << 개정이력(Modification Information) >> 수정자 수정내용 ------ ------------------------ pc07 최초 생성 </pre>
 */

@SessionAttributes(value = {"memberVo"})  // 	model.addAttribute("memberVo",memberVo); 할때 세션에 없으면 세션영역을 할당해준다.
@Controller
public class LoginController {

	// syso 대신 
	Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	private MemberServiceInf memberService;
	
	@Autowired
	private WorkServiceInf workService;

	//NaverLoginBO 
	@Autowired
	private NaverLoginBO naverLoginBO;

	//private String apiResult = "";

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}


	/**
	 * The Email sender.
	 */
	@Autowired
	public JavaMailSender emailSender;

	/**
	 * Method : index
	 * 작성자 : pc07
	 * 변경이력 :
	 *
	 * @return Method  설명 : index 로그인 화면으로
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(HttpServletRequest request, Model model, HttpSession session) {

		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);

		session.setAttribute("url", naverAuthUrl);
		return "login/login";
	}

	/**
	 * Method : loginProcess
	 * 작성자 : 나진실
	 * 변경이력 :
	 *
	 * @param request  the request
	 * @param model    the model
	 * @param memberVo the member vo
	 * @return Method  설명 : 로그인 기능
	 *
	 * @throws UnsupportedEncodingException the unsupported encoding exception
	 */
//	@RequestMapping(value="/loginProcess",method=RequestMethod.POST)
//	public String loginProcess(HttpServletRequest request, Model model, MemberVo memberVo) throws UnsupportedEncodingException {
//		request.setCharacterEncoding("utf-8");
	/*<!--  변찬우(수정 2018.12.09):  리스판스 추가 for node page -->*/
	@RequestMapping(value = "/loginProcess", method = {RequestMethod.POST, RequestMethod.GET})
	public String loginProcess(HttpServletRequest request, HttpServletResponse response, Model model, MemberVo memberVo) throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8");
		String member_mail = request.getParameter("member_mail").toLowerCase();
		String member_pass = request.getParameter("member_pass").toLowerCase(); // 대소문자를 안가린다.
		
		memberVo = memberService.selectUser(member_mail);

		if (memberVo != null && memberVo.getMember_withdrawal().equals("Y")) {
			String msg = "탈퇴한 회원 입니다.";
			model.addAttribute("msg", msg);
			return "/login/login";
		}

		if (memberVo == null || !member_mail.equals(memberVo.getMember_mail()) ||
				!memberVo.getMember_pass().equals(KISA_SHA256.encrypt(member_pass))) {

			//model.addAttribute("member_mail",member_mail);
			//model.addAttribute("member_pass",member_pass);
			model.addAttribute("memberVo", memberVo);
			model.addAttribute("loginResult", "false");
			return "/login/login";
			
		} else {
			model.addAttribute("memberVo", memberVo);

			/*<!--  변찬우(수정 2018.12.09):  쿠키생성 추가 for node page  -->*/
			Cookie cookMember_mail = new Cookie("member_mail", memberVo.getMember_mail());
			cookMember_mail.setMaxAge(60 * 60 * 24); // 기간은 하루로 지정
			response.addCookie(cookMember_mail);

			Cookie cookMember_name = new Cookie("member_name", memberVo.getMember_name());
			cookMember_name.setMaxAge(60 * 60 * 24); // 기간은 하루로 지정
			response.addCookie(cookMember_name);

			return "redirect:/main";
		}
	}

	@RequestMapping(value = "/callback", method = RequestMethod.GET)
	public String callback(@RequestParam String code, @RequestParam String state, HttpSession session, Model model, MemberVo memberVo) throws Exception {
		/* 네아로 인증이 성공적으로 완료되면 code 파라미터가 전달되며 이를 통해 access token을 발급 */

		JsonParser json = new JsonParser();
		OAuth2AccessToken oauthToken = naverLoginBO.getAccessToken(session, code, state);
		logger.debug("naverLoginBO : {}", oauthToken.getAccessToken());


		String apiResult = naverLoginBO.getUserProfile(oauthToken);
		memberVo = json.changeJson(apiResult); // vo에 userEmail, userGender, userNaver 저장
		String member_mail = memberVo.getMember_mail();

		// 값이 다르면..
		if (memberService.selectUser(member_mail) == null) {
			memberService.insertUser(memberVo);
			return "/";
			// 값이 같으면
		} else {
			model.addAttribute("memberVo", memberVo);
			return "main/main";
		}
	}


	/**
	 * Main string.
	 * 작성자: Mr.KKu
	 * 변경이력:
	 *
	 * @param model    the model
	 * @param memberVo the member vo
	 * @return the string
	 * 설명: 메인화면에 프로젝트리스트를 출력해준다. (Member / Project / project_member  Join)
	 */
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(Model model, @ModelAttribute("memberVo") MemberVo memberVo) {

		model.addAttribute("pMemberList", memberService.selectMainView(memberVo.getMember_mail()));
		model.addAttribute("inviteProjectList", memberService.selectInviteProject(memberVo.getMember_mail()));
		// model.addAttribute("workMemberList", workService.workMember(memberVo.getMember_mail()));
		return "main/main";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(SessionStatus status) {
		status.setComplete();
		return "redirect:/";
	}


	/**
	 * Method : idFind
	 * 작성자 : 나진실
	 * 변경이력 :
	 *
	 * @param request  the request
	 * @param memberVo the member vo
	 * @param to       the to
	 * @param subject  the subject
	 * @param content  the content
	 * @return Method  설명 : 아이디 찾기
	 */
	@RequestMapping(value = "/findEmail", method = RequestMethod.POST)
	public String findEmail(HttpServletRequest request, MemberVo memberVo, String to, String subject, String content) {

		String member_name = request.getParameter("member_name");
		// 자신의 진짜 메일 
		String member_email = request.getParameter("member_email");
		SimpleMailMessage message = new SimpleMailMessage();

		// 보낼사람 이메일
		message.setTo(member_email);
		// 제목
		message.setSubject(member_name + "님 안녕하세요 :) < CURRENT 아이디 찾기 >");

		if (memberService.selectfindId(memberVo) != null) {
			// 내용
			message.setText(member_name + "님이 찾으시는 아이디는  [ " + memberService.selectfindId(memberVo).getMember_mail() + "  ]  입니다.");
			emailSender.send(message);

			return "/login/login";
		} else {
			return "/login/login";
		}
	}

	/**
	 * Method : passFind
	 * 작성자 : 나진실
	 * 변경이력 :
	 *
	 * @param request  the request
	 * @param memberVo the member vo
	 * @param model    the model
	 * @param to       the to
	 * @param subject  the subject
	 * @param content  the content
	 * @return Method  설명 : 비밀번호 찾기
	 */
	@RequestMapping(value = "/findPass", method = RequestMethod.POST)
	public String findPass(HttpServletRequest request, MemberVo memberVo, Model model, String to, String subject, String content) {
		// 임의값 받아오는거 
		String member_pass = "";
		String member_name = request.getParameter("member_name");
		String member_mail = request.getParameter("member_mail");

		SimpleMailMessage message = new SimpleMailMessage();

		// 아이디 찾기와 동일하게 보낼사람 이메일 
		message.setTo(member_mail);
		// 제목
		message.setSubject(member_name + "님 안녕하세요 :) < CURRENT 비밀번호 찾기 >");

		// memberVo에 member_pass를 담아준다. 
		// null이 아니면 비밀번호가 전송 
		if (memberService.selectfindPass(member_mail) != null) {
			// random 로직 
			String possible = "abcdefghijklmnopqrstuvwxyz0123456789";
			for (int i = 0; i < 8; i++) {
				member_pass += possible.charAt((int) Math.floor(Math.random() * possible.length()));
			}
			// 임시 비밀번호로 수정
			memberVo.setMember_pass(member_pass);
			memberService.updatePass(memberVo);
			message.setText(member_name + " 님의 임시 비밀번호는  [  " + member_pass + "  ]  입니다. 로그인 후 꼭! 비밀번호를 수정해 주세요. ");
			memberVo.setMember_pass(member_pass);
			emailSender.send(message);
			return "/login/login";
		} else {
			return "/login/login";
		}
	}

	/**
	 * Method : signView
	 * 작성자 : 나진실
	 * 변경이력 :
	 *
	 * @return Method  설명 : 회원가입 화면단
	 */
	@RequestMapping(value = "/signView")
	public String signView() {
		return "/sign/sign";
	}


	/**
	 * Method : signProcess(POST)
	 * 작성자 : 나진실
	 * 변경이력 :
	 *
	 * @param member_mail the member mail
	 * @param member      the member
	 * @return Method  설명 : sign.jsp에서 회원가입 버튼을 눌렀을때
	 */
	@RequestMapping(value = "/signProcess", method = RequestMethod.POST)
	public String signProcess(@RequestParam("member_mail") String member_mail, MemberVo member, HttpServletRequest request) {
		
		String member_pass = request.getParameter("member_pass");
		System.out.println( "ffffff " + KISA_SHA256.encrypt(member_pass).toLowerCase());
		String kisa = KISA_SHA256.encrypt(member_pass).toLowerCase();
		System.out.println(kisa);
		
		member.setMember_pass(kisa);
		System.out.println(member.getMember_pass());
		// 값이 다르면..
		if (memberService.selectUser(member_mail) == null) {
			memberService.insertUser(member);
			return "/login/login";
			// 값이 같으면
		} else {
			return "/sign/sign";
		}
	}


	/**
	 * Method : signProcess(GET)
	 * 작성자 : 나진실
	 * 변경이력 :
	 *
	 * @return Method 설명 : sign.jsp에서 휴대전화 인증 버튼을 눌렀을때
	 */
	@ResponseBody
	@RequestMapping(value = "/signProcessAjax", method = RequestMethod.GET)
	public String signProcessAjax(HttpServletRequest request, Model model) {

		// 핸드폰 번호 입력란 
		String member_tel = request.getParameter("member_tel");

		String api_key = "NCSJQVBNAKBRXLTC";
		String api_secret = "ZNJ2OS1W0F1A4N9FPRUKO8YXWT1RBXKR";
		Coolsms coolsms = new Coolsms(api_key, api_secret);

		HashMap<String, String> set = new HashMap<String, String>();
		set.put("to", member_tel); // 수신
		set.put("from", "01099011334"); // 발신

		// random 로직 
		String number = "0123456789";

		// 인증번호 담아주는 변수 
		String certificationNumber = "";
		for (int i = 0; i < 4; i++) {
			certificationNumber += number.charAt((int) Math.floor(Math.random() * number.length()));
		}
		set.put("text", "CURRENT 인증번호는   [  " + certificationNumber + " ]  입니다. ");
		set.put("type", "sms"); // 문자타입

		//JSONObject result = coolsms.send(set);// 보내기&전송결과받기
		coolsms.send(set);

		// sign.jsp ajax로 보내준다.
		return certificationNumber;
	}
	
	
}
