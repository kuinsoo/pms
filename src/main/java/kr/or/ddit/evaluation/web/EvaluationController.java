package kr.or.ddit.evaluation.web;

import kr.or.ddit.evaluation.service.EvaluationServiceInf;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.member.service.MemberServiceInf;

import java.util.HashMap;
import java.util.Map;

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
	private EvaluationServiceInf evaluationService;
	
	/**
	 * Method : evaluationView
	 * 작성자 : iks
	 * 변경이력 :
	 *
	 * @return Method 설명 : 능력 및 평가 화면단
	 */
	@RequestMapping(value= "/evaluation", method=RequestMethod.GET)
	public String evaluationView(Model model, @SessionAttribute("memberVo") MemberVo memberVo) {
		model.addAttribute("memberVo",memberVo);
		Map<String, String> evalMap = new HashMap<>();
		evalMap.put("member_mail", memberVo.getMember_mail());
		evalMap.put("member_name", memberVo.getMember_name());
		model.addAttribute("evalProjectList", evaluationService.evaluationProjectList(evalMap));
		model.addAttribute("evalWorkCnt", evaluationService.evaluationWorkCnt(evalMap));
		model.addAttribute("evalIssueCnt", evaluationService.evaluationIssueCnt(evalMap));
		model.addAttribute("evalProjectIssueCnt", evaluationService.evaluationProjectIssueCnt(evalMap));

		return "evaluation/evaluation";
	}

	@RequestMapping(value= "/ajaxEvaluation", method=RequestMethod.GET)
	public String evaluationView(Model model, @SessionAttribute("memberVo") MemberVo memberVo,
								 @RequestParam("project_id")String project_id) {

		model.addAttribute("memberVo",memberVo);
		Map<String, String> evalMap = new HashMap<>();
		evalMap.put("member_mail", memberVo.getMember_mail());
		evalMap.put("project_id", project_id);
		model.addAttribute("evalView", evaluationService.evaluationView(evalMap));

		return "evaluation/ajaxEvaluation";
	}

}