package kr.or.ddit.issue.web;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.or.ddit.issue.service.IssueServiceInf;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.project.model.ProjectVo;
import kr.or.ddit.schedule.model.ScheduleVo;

/**
 * kr.or.ddit.issue.web
 * null.java
 * Desc : 이슈 컨트롤러
 *
 * @Author : Mr.KKu
 * @Date : 2018-11-27 / 오후 2:54
 * @Version :
 */
@Controller
public class IssueController {
	Logger logger = LoggerFactory.getLogger(IssueController.class);
	
	@Autowired
	private IssueServiceInf issueService;
	
	@RequestMapping(value="/issueHistory")
	public String issueHistory(@SessionAttribute("memberVo") MemberVo memberVo, Model model) {
		ScheduleVo scheduleVo = new ScheduleVo();
		scheduleVo.setSid(memberVo.getMember_mail());
		
		List<ProjectVo> history_myProjectList = issueService.myProjectList(scheduleVo);
		
		model.addAttribute("history_myProjectList", history_myProjectList);
		return "history/issueHistory";
	}
	
}
