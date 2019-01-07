package kr.or.ddit.evaluation.web;

import kr.or.ddit.evaluation.service.EvaluationServiceInf;
import kr.or.ddit.issue.service.IssueServiceInf;

import kr.or.ddit.member.service.MemberServiceInf;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.message.service.MessageServiceInf;
import kr.or.ddit.post.service.PostServiceInf;
import kr.or.ddit.work.service.WorkServiceInf;

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
	
	@Autowired
	private PostServiceInf postService;
	
	@Autowired
	private WorkServiceInf workService;
	
	@Autowired
	private MessageServiceInf messageService;
	
	@Autowired
	private IssueServiceInf issueService;

	@Autowired
	private MemberServiceInf memberService;
	
	/**
	 * Method : evaluationView
	 * 작성자 : iks
	 * 변경이력 :
	 *
	 * @return Method 설명 : 능력 및 평가 화면단
	 */
	@RequestMapping(value= "/evaluation", method=RequestMethod.GET)
	public String evaluationView(Model model, @SessionAttribute("memberVo")MemberVo memberVo, @RequestParam("userMail")String userMail) {
		model.addAttribute("memberVo",memberVo);
		Map<String, String> evalMap = new HashMap<>();
		evalMap.put("member_mail", memberVo.getMember_mail());
		evalMap.put("member_name", memberVo.getMember_name());
		evalMap.put("project_id", "0");
		model.addAttribute("evalProjectList", evaluationService.evaluationProjectList(evalMap));
		model.addAttribute("evalChart", evaluationService.evaluationChart(evalMap));

		
		return "evaluation/evaluation";
	}

	@RequestMapping(value= "/evaluationOther", method=RequestMethod.GET)
	public String evaluationOther(Model model, @RequestParam("userMail")String userMail) {
		MemberVo memberVo = memberService.selectUser(userMail);
		model.addAttribute("memberVo",memberVo);
		Map<String, String> evalMap = new HashMap<>();
		evalMap.put("member_mail", memberVo.getMember_mail());
		evalMap.put("member_name", memberVo.getMember_name());
		evalMap.put("project_id", "0");
		model.addAttribute("evalProjectList", evaluationService.evaluationProjectList(evalMap));
		model.addAttribute("evalChart", evaluationService.evaluationChart(evalMap));


		return "evaluation/evaluation";
	}

    @RequestMapping(value= "/ajaxEvaluationChartA", method=RequestMethod.POST)
    public String ajaxEvaluationChartA(Model model, @SessionAttribute("memberVo") MemberVo memberVo,
                                 @RequestParam("project_id")String project_id) {
								  //@RequestBody String project_id) {
        Map<String, String> evalMap = new HashMap<>();
        evalMap.put("member_mail", memberVo.getMember_mail());
        evalMap.put("member_name", memberVo.getMember_name());
        evalMap.put("project_id", project_id);
        model.addAttribute("evalChart", evaluationService.evaluationChart(evalMap));
        
        /* 알림기능 - IKS */
		model.addAttribute("pageCnt", postService.totalPostCnt());
		model.addAttribute("workMemberTotalCnt", workService.workMemberTotalCnt(memberVo.getMember_mail()));
		model.addAttribute("totalMsgReceived", messageService.totalMsgReceived(memberVo.getMember_mail()));
		model.addAttribute("issueMemberTotalCnt", issueService.issueMemberTotalCnt(memberVo.getMember_mail()));
		
        return "evaluation/ajaxEvaluationChartA";
    }

	@RequestMapping(value= "/ajaxEvaluationChartB", method=RequestMethod.POST)
	public String ajaxEvaluationChartB(Model model, @SessionAttribute("memberVo") MemberVo memberVo,
								  @RequestParam("project_id")String project_id) {
		//@RequestBody String project_id) {
		Map<String, String> evalMap = new HashMap<>();
		evalMap.put("member_mail", memberVo.getMember_mail());
		evalMap.put("member_name", memberVo.getMember_name());
		evalMap.put("project_id", project_id);
		model.addAttribute("evalChart", evaluationService.evaluationChart(evalMap));
		
		/* 알림기능 - IKS */
		model.addAttribute("pageCnt", postService.totalPostCnt());
		model.addAttribute("workMemberTotalCnt", workService.workMemberTotalCnt(memberVo.getMember_mail()));
		model.addAttribute("totalMsgReceived", messageService.totalMsgReceived(memberVo.getMember_mail()));
		model.addAttribute("issueMemberTotalCnt", issueService.issueMemberTotalCnt(memberVo.getMember_mail()));
		
		return "evaluation/ajaxEvaluationChartB";
	}

	@RequestMapping(value= "/ajaxEvaluation", method=RequestMethod.GET)
	public String ajaxEvaluation(Model model, @SessionAttribute("memberVo") MemberVo memberVo,
								 @RequestParam("project_id")String project_id) {

		model.addAttribute("memberVo",memberVo);
		Map<String, String> evalMap = new HashMap<>();
		evalMap.put("member_mail", memberVo.getMember_mail());
		evalMap.put("project_id", project_id);
		model.addAttribute("evalView", evaluationService.evaluationView(evalMap));
		
		/* 알림기능 - IKS */
		model.addAttribute("pageCnt", postService.totalPostCnt());
		model.addAttribute("workMemberTotalCnt", workService.workMemberTotalCnt(memberVo.getMember_mail()));
		model.addAttribute("totalMsgReceived", messageService.totalMsgReceived(memberVo.getMember_mail()));
		model.addAttribute("issueMemberTotalCnt", issueService.issueMemberTotalCnt(memberVo.getMember_mail()));

		return "evaluation/ajaxEvaluation";
	}
}