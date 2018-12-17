package kr.or.ddit.facing.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import kr.or.ddit.member.web.LoginController;

/**
 * kr.or.ddit.facing.web
 * null.java
 * Desc : 쪽지 컨트롤러
 *
 * @Author : iks
 * @Date : 2018-12-17 / 오후 4:20
 * @Version :
 */
@Controller
public class FacingController {
	 
	Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	/**
	 * Method : facingView
	 * 작성자 : iks
	 * 변경이력 :
	 *
	 * @return Method 설명 : 쪽지 화면단
	 */
	@RequestMapping(value= "/facing")
	public String facingView() {
		return "facing/facing";
	}
}