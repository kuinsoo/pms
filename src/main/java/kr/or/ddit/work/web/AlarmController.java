package kr.or.ddit.work.web;

import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.work.model.WorkVo;
import kr.or.ddit.work.service.WorkServiceInf;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

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
	
	@Autowired
	private WorkServiceInf workService;
	
	@RequestMapping(value="/ajaxAlarm", method=RequestMethod.POST)
	public String ajaxAlarm(Model model, WorkVo workVo, @SessionAttribute("memberVo") MemberVo memberVo, String work_project) {

		Map<String, String> mapWork = new HashMap<>();
		mapWork.put("member_mail", memberVo.getMember_mail());

		model.addAttribute("workList",workService.workMember(work_project));
		
		return "alarm/ajaxAlarm";
	}
}