package kr.or.ddit.schedule.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.schedule.model.ScheduleVo;
import kr.or.ddit.schedule.service.ScheduleServiceInf;
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
	private ScheduleServiceInf scheduleService;
	
	@RequestMapping(value="/allSchedule")
	public String allSchedule(HttpServletRequest request, Model model) {
		MemberVo memberVo = (MemberVo) request.getSession().getAttribute("memberVo");
		String sid = memberVo.getMember_mail();
		
		Map<String, Object> allScheduleList = scheduleService.scheduleList(sid);
		List<ScheduleVo> myProjectList = scheduleService.myProjectList(sid);
		
		logger.debug("allScheduleList : {}", allScheduleList);
		model.addAttribute("allScheduleList", allScheduleList);
		model.addAttribute("myProjectList", myProjectList);
		
		return "schedule/schedule";
	}
	
}
