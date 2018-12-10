package kr.or.ddit.project.web;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.member.model.PMemberVo;
import kr.or.ddit.member.service.MemberServiceInf;
import kr.or.ddit.project.model.ProjectVo;
import kr.or.ddit.project.service.ProjectServiceInf;

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
	 * @param projectVo the project vo
	 * @param memberVo  the member vo
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
	 *
	 * @param model the model
	 * @return the string
	 */
	@RequestMapping(value = "/projectList" ,method = RequestMethod.GET)
	public String projectList(Model model) {
		model.addAttribute("projectList",projectService.selectAllProject());

		return "project/projectList";
	}

	/**
	 * Project bookmark ajax string.
	 *
	 * @param project_id the project id
	 * @param memberVo   the member vo
	 * @param model      the model
	 * @return the string
	 */
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

			model.addAttribute("pMemberList",memberService.selectMainView(memberVo.getMember_mail()));
		return "project/ajaxProjectList";
	}


	@RequestMapping(value = "/subMain", method = RequestMethod.GET)
	public String subMain(Model model, @RequestParam("project_id")String proejct_id) {
		model.addAttribute("project_id", proejct_id);
		return "main/subMain";
	}

//	@RequestMapping(value = "/acceptInvitation", method = RequestMethod.GET)
//	public String acceptInvitation(@RequestParam("accept")String accept, @RequestParam("id")String project_id, @SessionAttribute("memberVo")MemberVo memberVo) {
//		try {
//			PMemberVo pMemberVo = new PMemberVo();
//			pMemberVo.setPmember_member(memberVo.getMember_mail());
//			pMemberVo.setPmember_project(project_id);
//			if(accept.equals("Y")) {
//				memberService.deleteInviteProject(memberVo.getMember_mail(), pMemberVo);
//			}
//			memberService.deleteInviteProject(memberVo.getMember_mail());
//		}catch (Exception e){
//			e.printStackTrace();
//		}
//		return "redirect:/main";
//	}


	@RequestMapping(value = "/inviteProjectAjax", method = RequestMethod.GET)
	public String inviteProjectAjax(Model model,@RequestParam("accept")String accept, @RequestParam("project_id")String project_id, @SessionAttribute("memberVo")MemberVo memberVo) {
		try {
			Map<String, String> delMap = new HashMap<>();
			PMemberVo pMemberVo = new PMemberVo();
			pMemberVo.setPmember_member(memberVo.getMember_mail());
			pMemberVo.setPmember_project(project_id);
			delMap.put("member_mail",memberVo.getMember_mail());
			delMap.put("project_id",project_id);
			if(accept.equals("Y")) {
				memberService.deleteInviteProject(delMap, pMemberVo);
			}
			memberService.deleteInviteProject(delMap);
			model.addAttribute("pMemberList",memberService.selectMainView(memberVo.getMember_mail()));
			model.addAttribute("inviteProjectList", memberService.selectInviteProject(memberVo.getMember_mail()));
		}catch (Exception e){
			e.printStackTrace();
		}
		return "project/ajaxInviteProject";
	}




}
