package kr.or.ddit.project.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.card.service.CardServiceInf;
import kr.or.ddit.comments.model.CommentsVo;
import kr.or.ddit.comments.service.CommentsServiceInf;
import kr.or.ddit.work.service.WorkServiceInf;
import org.apache.commons.collections.map.HashedMap;
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

	@Autowired
	private WorkServiceInf workService;

	@Autowired
	private CommentsServiceInf commentsService;

	@Autowired
	private CardServiceInf cardService;

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
	@RequestMapping(value = "/projectBookmarkAjax", method = RequestMethod.GET)
	public String projectBookmarkAjax(@RequestParam("project_id")String project_id,
									  @SessionAttribute("memberVo")MemberVo memberVo,
									  Model model) {

		Map<String, String> mapBook = new HashMap<>();
		mapBook.put("pmember_project", project_id);
		mapBook.put("pmember_member",  memberVo.getMember_mail());
		PMemberVo pMemberVo = (PMemberVo) memberService.selectBookmarkProject(mapBook);
		pMemberVo.setPmember_member(memberVo.getMember_mail());
		pMemberVo.setPmember_project(project_id);
		if(pMemberVo.getPmember_bookmark().equals("Y")) {
			pMemberVo.setPmember_bookmark("N");
			memberService.updateBookmark(pMemberVo);
		} else {
			pMemberVo.setPmember_bookmark("Y");
			memberService.updateBookmark(pMemberVo);
		}

			model.addAttribute("pMemberList",memberService.selectMainView(memberVo.getMember_mail()));
		return "project/ajaxProjectList";
	}


	@RequestMapping(value = "/subMain", method = {RequestMethod.POST, RequestMethod.GET})
	public String subMain(Model model, @RequestParam("project_id")String project_id,
						  @SessionAttribute("memberVo")MemberVo memberVo, HttpServletResponse response) {

		ProjectVo projectVo =  projectService.selectProject(project_id);
		/* 프로젝트 객체  */
		model.addAttribute("projectVo", projectVo);

		/* 프로젝트에 포함된 멤버 정보 */
		model.addAttribute("projectMemberList", memberService.projectMemberList(project_id));

		/* 업무 출력 */
		model.addAttribute("workList",workService.selectWorks(project_id));

		/* 업무에 달린 댓글 출력 */
		model.addAttribute("cmtList", commentsService.cmtList(project_id));

		/* 업무 카드 출력 */
		model.addAttribute("wcList", cardService.selectWorkCard(project_id));
		

		/*<!--  변찬우(수정 2018.12.11):  쿠키생성 추가 for node page  -->*/
		Cookie cookProject_id= new Cookie("project_id", project_id); 
		cookProject_id.setMaxAge(60*60*24); // 기간은 하루로 지정
		response.addCookie(cookProject_id);
		
		Cookie cookProject_title = new Cookie("project_title", projectVo.getProject_title());
		cookProject_title.setMaxAge(60*60*24); // 기간은 하루로 지정
		response.addCookie(cookProject_title);
		
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
