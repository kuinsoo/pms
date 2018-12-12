package kr.or.ddit.issue.web;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");

		String sdate = "";	//시작일 선언 및 초기화
		String edate = "";	//종료일 선언 및 초기화
		int current = Integer.parseInt(sdf.format(new Date()));	//현재날짜
		int pjtPeriod = -1;		//프로젝트 총기간 선언 및 초기화
		int currentPeriod = -1;	//지난 기간 선언 및 초기화
		List<Integer> percentList = new ArrayList<Integer>();		//지난 기간 퍼센트
		
		int cnt = 0;
		/* 예상종료일과 실종료일의 null 유무를 체크해서 원하는 패턴("yyyyMMdd")으로 값 변환 */
		for(ProjectVo pjtvo : history_myProjectList) {
			
			sdate = sdf.format(pjtvo.getProject_sdate());
			
			if(pjtvo.getProject_eedate() != null) {
				edate = sdf.format(pjtvo.getProject_eedate());
			} else if(pjtvo.getProject_edate() != null) {
				edate = sdf.format(pjtvo.getProject_edate());
			}
			
			/* 프로젝트 총 기간 : 종료일 - 시작일 */
			pjtPeriod = (Integer.parseInt(edate) - Integer.parseInt(sdate));

			/* 지난 기간 : 현재날짜 - 시작일 */
			currentPeriod = (current - (Integer.parseInt(sdate)));
			
			/* 지난 기간 퍼센트 : (지난 기간 * 100) / 총 기간 */
			percentList.add((currentPeriod * 100) / pjtPeriod);

		}
		
		model.addAttribute("percentList", percentList);
		model.addAttribute("history_myProjectList", history_myProjectList);
		return "history/issueHistory";
	}
	
}
