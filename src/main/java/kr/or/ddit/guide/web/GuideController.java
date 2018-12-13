package kr.or.ddit.guide.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import kr.or.ddit.member.web.LoginController;

/**
 * kr.or.ddit.guide.web
 * null.java
 * Desc : 가이드 컨트롤러
 *
 * @Author : iks
 * @Date : 2018-12-13 / 오후 1:44
 * @Version :
 */
@Controller
public class GuideController {
	 
	Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	/**
	 * Method : guideView
	 * 작성자 : iks
	 * 변경이력 :
	 *
	 * @return Method 설명 : 가이드 화면단
	 */
	@RequestMapping(value= "/guide")
	public String guideView() {
		return "guide/guide";
	}
}