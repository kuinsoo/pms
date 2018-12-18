package kr.or.ddit.evaluation.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import kr.or.ddit.member.web.LoginController;

/**
 * kr.or.ddit.vote.web
 * null.java
 * Desc : 능력 및 평가 컨트롤러
 *
 * @Author : iks
 * @Date : 2018-12-18 / 오후 5:18
 * @Version :
 */
@Controller
public class EvaluationController {
	 
	Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	/**
	 * Method : evaluationView
	 * 작성자 : iks
	 * 변경이력 :
	 *
	 * @return Method 설명 : 능력 및 평가 화면단
	 */
	@RequestMapping(value= "/evaluation")
	public String evaluationView() {
		return "evaluation/evaluation";
	}
}