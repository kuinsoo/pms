package kr.or.ddit.work.web;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.work.model.WorkVo;
import kr.or.ddit.work.service.WorkServiceInf;

/**
 * kr.or.ddit.work.web
 * null.java
 * Desc : 알림 컨트롤러
 *
 * @Author : 임규승
 * @Date : 2018-12-18 / 오후 2:00
 * @Version :
 */
@Controller
public class AlarmController {
	
	Logger logger = LoggerFactory.getLogger(AlarmController.class);
	
	@Autowired
	private WorkServiceInf workService;
	
	@RequestMapping(value="/ajaxAlarm", method=RequestMethod.POST)
	public String ajaxAlarm(Model model, String work_project) {		
		
		List<WorkVo> workList = workService.workMember(work_project);
		
		logger.debug("workList sizes : {}", workList.size());
		
		model.addAttribute("workList", workList);
		
		return "alarm/ajaxAlarm";
	}
}