package kr.or.ddit.evaluation.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.member.service.MemberServiceInf;

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
	 
	Logger logger = LoggerFactory.getLogger(EvaluationController.class);
	
	@Autowired
	private MemberServiceInf memberservice;
	
	/**
	 * Method : evaluationView
	 * 작성자 : iks
	 * 변경이력 :
	 *
	 * @return Method 설명 : 능력 및 평가 화면단
	 */
	@RequestMapping(value= "/evaluation", method=RequestMethod.GET)
	public String evaluationView(Model model, @SessionAttribute("memberVo") MemberVo memberVo) {
		
		memberservice.selectUser(memberVo.getMember_mail());
		model.addAttribute("memberVo",memberVo);
		
		return "evaluation/evaluation";
	}
}