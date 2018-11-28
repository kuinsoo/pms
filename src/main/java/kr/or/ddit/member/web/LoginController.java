package kr.or.ddit.member.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	/**
	 * Method : loginView
	 * 작성자 : 나진실
	 * 변경이력 :
	 * @return
	 * Method 설명 : 처음의 
	 */
	@RequestMapping("/loginView")
	public String loginView() {
		
		return "/login/login";
	}
	
	
	/**
	 * Method : loginProcess
	 * 작성자 : pc07
	 * 변경이력 :
	 * @return
	 * Method 설명 :
	 */
	@RequestMapping(value="/loginProcess",method=RequestMethod.POST)
	public String loginProcess() {
		
		
		return "main";
	}
}
