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
	 * @return Method 설명 : Q&A 글 목록 
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
	 * @return Method 설명 : Q&A 글 상세 
	 */
	@RequestMapping(value= "/qnaDetail")
	public String qnaDtailView() {
		return "qna/qnaDetail";
	}
	
	
	/**
	 * Method : qnaFormView
	 * 작성자 : 변찬우 
	 * 변경이력 :
	 *
	 * @return Method 설명 : Q&A 글 작성 
	 */
	@RequestMapping(value= "/qnaForm")
	public String qnaFormView() {
		return "qna/qnaForm";
	}
	
	
	/**
	 * Method : /qnaModyView
	 * 작성자 : 변찬우 
	 * 변경이력 :
	 *
	 * @return Method 설명 : Q&A 글 수정 
	 */
	@RequestMapping(value= "/qnaMody")
	public String qnaModyView() {
		return "qna/qnaMody";
	}	
	
	
	/**
	 * Method : /qnaDel 처리 
	 * 작성자 : 변찬우 
	 * 변경이력 :
	 *
	 * @return Method 설명 : Q&A  글 삭제 
	 */
	@RequestMapping(value= "/qnaDel")
	public String qnaDelView() {
		return "qna/qnaList";
	}
	
	
	/**
	 * Method : /qnaReplyView 
	 * 작성자 : 변찬우 
	 * 변경이력 :
	 *
	 * @return Method 설명 : Q&A  답글  
	 */
	@RequestMapping(value= "/qnaReply")
	public String qnaReplyView() {
		return "qna/qnaForm";
	}
}