package kr.or.ddit.work.web;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.work.model.WorkVo;
import kr.or.ddit.work.service.WorkServiceInf;

/**
 * kr.or.ddit.work.web
 * null.java
 * Desc : 업무 컨트롤러
 *
 * @Author : Mr.KKu
 * @Date : 2018-11-27 / 오후 3:34
 * @Version :
 */
@Controller
public class WorkController {
	Logger logger = LoggerFactory.getLogger(WorkController.class);
	
	@Autowired
	private WorkServiceInf workService;
	
	@RequestMapping(value="/workSchedule")
	public String workAllSchedule(Model model) {
		List<WorkVo> workScheduleList = workService.workAllSchedule();
		
		//logger.debug("workScheduleList : {}", workScheduleList);
		model.addAttribute("workScheduleList", workScheduleList);
		
		return "schedule/schedule";
	}
	
}
