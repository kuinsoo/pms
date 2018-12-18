package kr.or.ddit.qna.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import kr.or.ddit.member.web.LoginController;

/**
 * kr.or.ddit.qna.web
 * null.java
 * Desc : Q&A 컨트롤러
 *
 * @Author : iks
 * @Date : 2018-12-12 / 오후 6:59
 * @Version :
 */
@Controller
public class QnAController {
	 
	Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	/**
	 * Method : qnaView
	 * 작성자 : iks
	 * 변경이력 : 변찬우 
	 *
	 * @return Method 설명 : Q&A 화면단
	 */
	@RequestMapping(value= "/qnaList")
	public String qnaView() {
		return "qna/qnaList";
	}
	
	
	/**
	 * Method : qnaFormView
	 * 작성자 : 변찬우 
	 * 변경이력 :
	 *
	 * @return Method 설명 : Q&A 화면단
	 */
	@RequestMapping(value= "/qnaForm")
	public String qnaFormView() {
		return "qna/qnaForm";
	}
}