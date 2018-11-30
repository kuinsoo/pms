package kr.or.ddit.project.web;

import kr.or.ddit.project.model.ProjectVo;
import kr.or.ddit.project.service.ProjectServiceInf;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

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
	Logger logger = LoggerFactory.getLogger(ProjectController.class);
	
	@Autowired
	private ProjectServiceInf projectService;

	@RequestMapping(value = "/projectCreate",method = RequestMethod.GET)
	public String projectCreateView() {
		return "project/projectCreate";
	}

	@RequestMapping(value = "/projectCreate",method = RequestMethod.POST)
	public String projectCreate(ModelAndView modelAndView, ProjectVo projectVo) {
		if(projectVo.getProject_title() != null){
			projectService.createProject(projectVo);
		}

		String url = "redirect:/projectList";

		return "redirect:/projectList";
	}

	@RequestMapping("/projectList")
	public String projectList(Model model) {
		model.addAttribute("projectList",projectService.selectAllProject());

		return "project/projectList";
	}
	
}
