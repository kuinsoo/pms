package kr.or.ddit.member.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
@RequestMapping("/user")
@Controller
public class LoginController {
	
	@Autowired
	private MemberServiceInf memberservice;
	
	@RequestMapping(value="/")
	public String index() {
		return "/login/login";
	}
	
	
	/**
	 * Method : loginView
	 * 작성자 : 나진실
	 * 변경이력 :
	 * @return
	 * Method 설명 : 로그인 화면단 보여주기 
	 */
	@RequestMapping(value="/loginView")
	public String loginView() {
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
		
		MemberVo memberVo = memberservice.seletUser(member_mail);
		
		if(memberVo==null || !member_mail.equals(memberVo.getMember_mail())||
							 !member_pass.equals(memberVo.getMember_pass())) {
			return "login/login";
		
		}else {
			session.setAttribute("memberVo",memberVo);
		}
		return "main";
	}
	
	@RequestMapping(value="")
	public String signProcess() {
		return"";
	}
	
}
