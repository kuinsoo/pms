package kr.or.ddit.project.web;

import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.member.service.MemberServiceInf;
import kr.or.ddit.project.model.ProjectVo;
import kr.or.ddit.project.service.ProjectServiceInf;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * kr.or.ddit.project.web
 * null.java
 * Desc : 프로젝트 컨트롤러
 *
 * @Author : Mr.KKu
 * @Date : 2018-11-27 / 오후 3:23
 * @Version :
 */
@Controller
public class ProjectController {
	/**
	 * The Logger.
	 */
	Logger logger = LoggerFactory.getLogger(ProjectController.class);
	
	@Autowired
	private ProjectServiceInf projectService;

	@Autowired
	private MemberServiceInf memberService;


	/**
	 * Create project view string.
	 *
	 * @return the string
	 */
	@RequestMapping(value = "/createProject",method = RequestMethod.GET)
	public String createProjectView() {
		return "project/createProject";
	}


	/**
	 * Create project string.
	 *
	 * @param projectVo    the project vo
	 * @return the string
	 */
	@RequestMapping(value = "/createProject",method = RequestMethod.POST)
	public String createProject(ProjectVo projectVo, @SessionAttribute("memberVo")MemberVo memberVo) {
		if(projectVo.getProject_title() != null){
				Map<String,String> mapPMember = new HashMap<>();
				mapPMember.put("member_email", memberVo.getMember_mail());
				mapPMember.put("pmember_position", "1");
				memberService.setTeamLeader(mapPMember, projectVo);
		}
		return "redirect:/main";
	}

	/**
	 * Project list string.
	 * 접속한 회원의 참여중인 프로젝트 리스트
	 * @param model the model
	 * @return the string
	 */
	@RequestMapping(value = "/projectList" ,method = RequestMethod.GET)
	public String projectList(Model model) {
		model.addAttribute("projectList",projectService.selectAllProject());

		return "project/projectList";
	}

	@RequestMapping(value = "/projectBookmarkAjax", method = RequestMethod.POST)
	public String projectBookmarkAjax(@RequestParam("project_id")String project_id,
									  @SessionAttribute("memberVo")MemberVo memberVo,
									  Model model) {

		ProjectVo projectVo = (ProjectVo) projectService.selectProjectList(project_id);
		if(projectVo.getProject_bookmark().equals("Y")) {
			projectVo.setProject_bookmark("N");
			projectService.updateProject(projectVo);
		} else {
			projectVo.setProject_bookmark("Y");
			projectService.updateProject(projectVo);
		}

			model.addAttribute("memberProjectList",memberService.selectMainView(memberVo.getMember_mail()));
		return "project/ajaxProjectList";
	}






}
