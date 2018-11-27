package kr.or.ddit.project.web;

import kr.or.ddit.project.model.ProjectVo;
import kr.or.ddit.project.service.ProjectServiceInf;
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

	@Autowired
	private ProjectServiceInf projectService;

	@RequestMapping(name = "/create",method = RequestMethod.GET)
	public String projectCreateView() {
		return "project/projectCreate";
	}

	@RequestMapping(name = "/projectCreate",method = RequestMethod.POST)
	public String projectCreate(ModelAndView modelAndView, ProjectVo projectVo) {
		if(projectVo.getProject_title() != null){
			projectService.createProject(projectVo);
		}

		return "redirect:project/projectList";
	}
}
