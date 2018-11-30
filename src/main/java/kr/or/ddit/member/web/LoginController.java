package kr.or.ddit.member.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.member.service.MemberServiceInf;

/**
 * LoginController.java
 *
 * @author 나진실
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 * 수정자 수정내용
 * ------ ------------------------
 * pc07 최초 생성
 *
 * </pre>
 */
@Controller
public class LoginController {
	@Autowired
	private MemberServiceInf memberservice;
	
	/**
	 * Method : index
	 * 작성자 : pc07
	 * 변경이력 :
	 * @return
	 * Method 설명 : index 로그인 화면으로 
	 */
	@RequestMapping(value="/")
	public String index() {
		return "/login/login";
	}
	
	/**
	 * Method : loginProcess
	 * 작성자 : 나진실
	 * 변경이력 :
	 * @return
	 * Method 설명 : 로그인 기능 
	 */
	@RequestMapping(value="/loginProcess",method=RequestMethod.POST)
	public String loginProcess(HttpServletRequest request , Model model, HttpSession session) {
		
		String member_mail = request.getParameter("member_mail");
		String member_pass = request.getParameter("member_pass");
		MemberVo memberVo = memberservice.selectUser(member_mail);
		
		if(memberVo==null || !member_mail.equals(memberVo.getMember_mail())||
							 !member_pass.equals(memberVo.getMember_pass())) {
			return "login/login";
		}else {
			session.setAttribute("memberVo",memberVo);
		}
		return "main";
	}
	
	/**
	 * Method : idFind
	 * 작성자 : 나진실
	 * 변경이력 :
	 * @return
	 * Method 설명 : 아이디 찾기 
	 */
	@RequestMapping(value="/idFind",method=RequestMethod.POST)
	public String idFind() {
		
		return "/login/login";
	}
	
	
	
	/**
	 * Method : passFind
	 * 작성자 : 나진실
	 * 변경이력 :
	 * @return
	 * Method 설명 : 비밀번호 찾기 
	 */
	@RequestMapping(value="/passFind",method=RequestMethod.POST)
	public String passFind() {
		
		return "/login/login";
	}
	
	
	/**
	 * Method : signView
	 * 작성자 : 나진실
	 * 변경이력 :
	 * @return
	 * Method 설명 : 회원가입 화면단 
	 */
	@RequestMapping(value="/signView")
	public String signView() {
		return"/sign/sign";
	}	
	
	/**
	 * Method : signProcess
	 * 작성자 : 나진실
	 * 변경이력 :
	 * @return
	 * Method 설명 : sign.jsp에서 회원가입 버튼을 눌렀을때  
	 */
	@RequestMapping(value="/signProcess",method=RequestMethod.POST)
	public String signProcess(@RequestParam("member_mail") String member_mail ,MemberVo member) {
		
		// 값이 다르면..
		if(memberservice.selectUser(member_mail)==null) {
			int insertUser = memberservice.insertUser(member);		
			return"/login/login";
		
		// 값이 같으면 
		}else {
			return "/sign/sign";
		}
	}
	
	
}
