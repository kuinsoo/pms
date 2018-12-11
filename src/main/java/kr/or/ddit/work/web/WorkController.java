package kr.or.ddit.work.web;

import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.work.model.WorkVo;
import kr.or.ddit.work.service.WorkServiceInf;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import java.util.HashMap;
import java.util.Map;

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

	@Autowired
	private WorkServiceInf workService;
	
	
	@RequestMapping(value="/ajaxCreateWork",method=RequestMethod.POST)
	public String createWork(Model model, WorkVo workVo, @RequestParam("project_id")String project_id,
							 @SessionAttribute("memberVo")MemberVo memberVo) {

		try{
			workVo.setWork_project(project_id);
			workService.createWork(workVo);
		} catch (Exception e){
			e.printStackTrace();
		}

		Map<String, String> mapWork = new HashMap<>();
		mapWork.put("member_mail", memberVo.getMember_mail());
		mapWork.put("project_id", project_id);
		model.addAttribute("workList",workService.selectWorks(mapWork));
		return "work/ajaxCreateWork";
	}
}
