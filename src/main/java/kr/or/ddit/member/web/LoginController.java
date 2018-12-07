package kr.or.ddit.member.web;

import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.member.service.MemberServiceInf;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
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
	@Autowired
	private MemberServiceInf memberservice;


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
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String index() {
		return "/login/login";
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
	@RequestMapping(value="/loginProcess",method=RequestMethod.POST)
	public String loginProcess(HttpServletRequest request, Model model, MemberVo memberVo) throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8");

		String member_mail = request.getParameter("member_mail").toLowerCase();
		String member_pass = request.getParameter("member_pass").toLowerCase(); // 대소문자를 안가린다.

		memberVo = memberservice.selectUser(member_mail);

		if(memberVo==null || !member_mail.equals(memberVo.getMember_mail())||
							 !member_pass.equals(memberVo.getMember_pass())){
			model.addAttribute("member_mail",member_mail);
			model.addAttribute("member_pass",member_pass);
			return "login/login";
		}else {
			model.addAttribute("memberVo",memberVo);

			return "redirect:/main";
		}
	}

	/**
	 * Main string.
	 * 작성자: Mr.KKu
	 * 변경이력:
	 * @param model    the model
	 * @param memberVo the member vo
	 * @return the string
	 * 설명: 메인화면에 프로젝트리스트를 출력해준다. (Member / Project / project_member  Join)
	 */
	@RequestMapping(value="/main",method=RequestMethod.GET)
	public String main(Model model, @ModelAttribute("memberVo")MemberVo memberVo) {

		model.addAttribute("pMemberList",memberservice.selectMainView(memberVo.getMember_mail()));
		model.addAttribute("inviteProjectList", memberservice.selectInviteProject(memberVo.getMember_mail()));
		return "main/main";
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
	@RequestMapping(value="/findEmail",method=RequestMethod.POST)
	public String findEmail(HttpServletRequest request, MemberVo memberVo,String to, String subject, String content){
		
		String member_name = request.getParameter("member_name");
		// 자신의 진짜 메일 
		String member_email = request.getParameter("member_email");
		SimpleMailMessage message = new SimpleMailMessage();
		
		// 보낼사람 이메일
		message.setTo(member_email);
		// 제목
		message.setSubject(member_name + "님 안녕하세요 :) < CURRENT 아이디 찾기 >");
		
		if(memberservice.selectfindId(memberVo)!=null) {
			// 내용
			message.setText(member_name + "님이 찾으시는 아이디는  [  " + memberservice.selectfindId(memberVo).getMember_mail() + "  ]  입니다.");
			
			emailSender.send(message);
			
			return "/login/login";
		}else {
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
	@RequestMapping(value="/findPass",method=RequestMethod.POST)
	public String findPass(HttpServletRequest request, MemberVo memberVo,Model model ,String to, String subject, String content) {
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
		if(memberservice.selectfindPass(member_mail)!=null) {		
			// random 로직 
			String possible ="abcdefghijklmnopqrstuvwxyz0123456789";
			for(int i = 0; i<8; i++) {
				member_pass += possible.charAt((int) Math.floor(Math.random()* possible.length()));
			}
				// 임시 비밀번호로 수정
				memberVo.setMember_pass(member_pass);
				int update_pass = memberservice.updatePass(memberVo);
				message.setText(member_name +" 님의 임시 비밀번호는  [  " + member_pass + "  ]  입니다. 로그인 후 꼭! 비밀번호를 수정해 주세요. ");				
				memberVo.setMember_pass(member_pass);
				emailSender.send(message);
				return "/login/login";
		}else {
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
	@RequestMapping(value="/signView")
	public String signView() {
		return"/sign/sign";
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
	@RequestMapping(value="/signProcess",method=RequestMethod.POST)
	public String signProcess(@RequestParam("member_mail") String member_mail ,MemberVo member, HttpServletRequest request) {
	
		// 값이 다르면..
		if(memberservice.selectUser(member_mail)==null) {
			int insertUser = memberservice.insertUser(member);		
			return"/login/login";
		// 값이 같으면 
		}else {
			return "/sign/sign";
		}
	}
	/**
	 * Method : signProcess(GET)
	 * 작성자 : 나진실
	 * 변경이력 :
	 * @return
	 * Method 설명 : sign.jsp에서 휴대전화 인증 버튼을 눌렀을때 
	 */
	@ResponseBody
	@RequestMapping(value="/signProcessAjax",method=RequestMethod.GET)
	public String signProcessAjax(HttpServletRequest request, Model model) {
		
		// 핸드폰 번호 입력란 
		String member_tel = request.getParameter("member_tel");
		
		// ajax로 값이 넘어왔는지 확인하는 
		System.out.println( "ajax " + member_tel);
		
		String api_key = "NCSJQVBNAKBRXLTC";
		String api_secret ="ZNJ2OS1W0F1A4N9FPRUKO8YXWT1RBXKR";
		Coolsms coolsms = new Coolsms(api_key, api_secret);
	
		HashMap<String, String> set = new HashMap<String, String>();
		set.put("to", member_tel); // 수신
		set.put("from", "01099011334"); // 발신
		
		// random 로직 
		String number ="0123456789";	
		
		// 인증번호 담아주는 변수 
		String certificationNumber = "";
		for(int i = 0; i < 4; i++) {
			certificationNumber += number.charAt((int) Math.floor(Math.random()* number.length()));
		}
		set.put("text", "CURRENT 인증번호는   [  " + certificationNumber + " ]  입니다. ");
		System.out.println( " 인증번호 4자리 숫자  " + certificationNumber);
		set.put("type", "sms"); // 문자타입
		
		JSONObject result = coolsms.send(set);// 보내기&전송결과받기
		
		// session에 랜덤값을 담아준다.
//		model.addAttribute("certificationNumber", certificationNumber);
//
		System.out.println("certificationNumber값 확인하기 : " + certificationNumber);
		
//		// 메시지 보내기 성공 및 전송결과 출력
//		if ((boolean)result.get("status") == true) {
//	      System.out.println("성공");
//	      System.out.println(result.get("group_id")); // 그룹아이디
//	      System.out.println(result.get("result_code")); // 결과코드
//	      System.out.println(result.get("result_message")); // 결과 메시지
//	      System.out.println(result.get("success_count")); // 메시지아이디
//	      System.out.println(result.get("error_count")); // 여러개 보낼시 오류난 메시지 수
//
//	    // 메시지 보내기 실패
//	    } else {
//	      System.out.println("실패");
//	      System.out.println(result.get("code")); // REST API 에러코드
//	      System.out.println(result.get("message")); // 에러메시지
//	    }

	    return certificationNumber;
	}
}
