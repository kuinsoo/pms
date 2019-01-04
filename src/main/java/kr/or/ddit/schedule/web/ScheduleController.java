package kr.or.ddit.schedule.web;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.message.service.MessageServiceInf;
import kr.or.ddit.post.service.PostServiceInf;
import kr.or.ddit.schedule.model.ScheduleVo;
import kr.or.ddit.schedule.service.ScheduleServiceInf;
import kr.or.ddit.work.service.WorkServiceInf;
import kr.or.ddit.work.web.WorkController;

/**
 * kr.or.ddit.work.web
 * null.java
 * Desc : 일정 컨트롤러
 *
 * @Author : jerry
 * @Date : 2018-11-29 19:46
 * @Version :
 */
@Controller
public class ScheduleController {
	Logger logger = LoggerFactory.getLogger(WorkController.class);
	
	@Autowired
	private PostServiceInf postService;
	
	@Autowired
	private WorkServiceInf workService;
	
	@Autowired
	private MessageServiceInf messageService;
	
	@Autowired
	private ScheduleServiceInf scheduleService;
	
	@RequestMapping(value="/allSchedule", method={RequestMethod.POST, RequestMethod.GET})
	public String allSchedule(@SessionAttribute("memberVo") MemberVo memberVo, HttpServletRequest request, Model model) {
		String sid = memberVo.getMember_mail();
		String pid = request.getParameter("sel_list");
		
		ScheduleVo scheduleVo = new ScheduleVo(sid, pid);
		
		System.out.println("scheduleVo : " + scheduleVo);
		
		Map<String, Object> allScheduleList = scheduleService.scheduleList(scheduleVo);
		
		model.addAttribute("allScheduleList", allScheduleList);
		model.addAttribute("myProjectList", scheduleService.myProjectList(sid));
		logger.debug("****allScheduleList.projectScheduleList : {}", allScheduleList);
		
		/* 알림기능 - IKS */
		model.addAttribute("pageCnt", postService.totalPostCnt());
		model.addAttribute("workMemberTotalCnt", workService.workMemberTotalCnt(memberVo.getMember_mail()));
		model.addAttribute("totalMsgReceived", messageService.totalMsgReceived(memberVo.getMember_mail()));
		
		return "schedule/schedule";
	}
	
}
