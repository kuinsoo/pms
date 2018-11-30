package kr.or.ddit.schedule.web;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String allSchedule(Model model) {
		Map<String, Object> allScheduleList = scheduleService.scheduleList();
		
		logger.debug("allScheduleList : {}", allScheduleList);
		model.addAttribute("allScheduleList", allScheduleList);
		
		return "schedule/schedule";
	}
	
}
