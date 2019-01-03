package kr.or.ddit.project.web;

import kr.or.ddit.attachment.service.AttachmentServiceInf;
import kr.or.ddit.card.service.CardServiceInf;
import kr.or.ddit.comments.service.CommentsServiceInf;
import kr.or.ddit.meeting.model.MeetingVo;
import kr.or.ddit.meeting.service.MeetingServiceInf;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.member.model.PMemberVo;
import kr.or.ddit.member.service.MemberServiceInf;
import kr.or.ddit.message.service.MessageServiceInf;
import kr.or.ddit.post.service.PostServiceInf;
import kr.or.ddit.project.model.ProjectVo;
import kr.or.ddit.project.service.ProjectServiceInf;
import kr.or.ddit.work.service.WorkServiceInf;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
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

	@Autowired
	private WorkServiceInf workService;

	@Autowired
	private CommentsServiceInf commentsService;

	@Autowired
	private CardServiceInf cardService;

	@Autowired
	private MeetingServiceInf meetingService;
	
	@Autowired
	private PostServiceInf postService;
	
	@Autowired
	private MessageServiceInf messageService;


	/**
	 * Create project view string.
	 *
	 * @return the string
	 */
	@RequestMapping(value = "/createProject",method = RequestMethod.GET)
	public String createProjectView(Model model, MemberVo memberVo) {
		
		/* 알림기능 - IKS */
		model.addAttribute("pageCnt", postService.totalPostCnt());
		model.addAttribute("workMemberTotalCnt", workService.workMemberTotalCnt(memberVo.getMember_mail()));
		model.addAttribute("totalMsgReceived", messageService.totalMsgReceived(memberVo.getMember_mail()));
		
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
	public String createProject(ProjectVo projectVo, @SessionAttribute("memberVo")MemberVo memberVo, Model model) {
		if(projectVo.getProject_title() != null){
			Map<String,String> mapPMember = new HashMap<>();
			mapPMember.put("member_email", memberVo.getMember_mail());
			mapPMember.put("pmember_position", "1");
			memberService.setTeamLeader(mapPMember, projectVo);
		}
		
		/* 알림기능 - IKS */
		model.addAttribute("pageCnt", postService.totalPostCnt());
		model.addAttribute("workMemberTotalCnt", workService.workMemberTotalCnt(memberVo.getMember_mail()));
		model.addAttribute("totalMsgReceived", messageService.totalMsgReceived(memberVo.getMember_mail()));
		return "redirect:/main";
	}

	/**
	 * Update project string.
	 *
	 * @param projectVo the project vo
	 * @return the string
	 */
	@RequestMapping(value = "/ajaxUpdateProject", method = RequestMethod.POST)
	public String updateProject(ProjectVo projectVo, Model model, MemberVo memberVo) {

		projectService.updateProject(projectVo);
		
		/* 알림기능 - IKS */
		model.addAttribute("pageCnt", postService.totalPostCnt());
		model.addAttribute("workMemberTotalCnt", workService.workMemberTotalCnt(memberVo.getMember_mail()));
		model.addAttribute("totalMsgReceived", messageService.totalMsgReceived(memberVo.getMember_mail()));

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
	public String projectList(Model model, MemberVo memberVo) {
		model.addAttribute("projectList",projectService.selectAllProject());
		
		/* 알림기능 - IKS */
		model.addAttribute("pageCnt", postService.totalPostCnt());
		model.addAttribute("workMemberTotalCnt", workService.workMemberTotalCnt(memberVo.getMember_mail()));
		model.addAttribute("totalMsgReceived", messageService.totalMsgReceived(memberVo.getMember_mail()));

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
		model.addAttribute("inviteProjectList", memberService.selectInviteProject(memberVo.getMember_mail()));
		
		/* 알림기능 - IKS */
		model.addAttribute("pageCnt", postService.totalPostCnt());
		model.addAttribute("workMemberTotalCnt", workService.workMemberTotalCnt(memberVo.getMember_mail()));
		model.addAttribute("totalMsgReceived", messageService.totalMsgReceived(memberVo.getMember_mail()));
		
		return "project/ajaxMainProjectList";
	}


	/**
	 * Sub main string.
	 *
	 * @param model      the model
	 * @param project_id the project id
	 * @param memberVo   the member vo
	 * @param response   the response
	 * @return the string
	 *
	 * @throws UnsupportedEncodingException the unsupported encoding exception
	 */
	@RequestMapping(value = "/subMain", method = RequestMethod.POST)
	public String subMain(Model model, @RequestParam("project_id")String project_id, MeetingVo meetingVo,
						  @SessionAttribute("memberVo")MemberVo memberVo, HttpServletResponse response) throws UnsupportedEncodingException {

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

		/* 첨부파일 목록 */


		Map<String, String> mtMap = new HashMap<>();
		mtMap.put("project_id", project_id);
		model.addAttribute("workCharts",workService.workChart(mtMap));

		/* 변찬우(추가 2018.12.26) 프로젝트 목록 출력 */
		List<MeetingVo> meetingList= meetingService.meetingList(project_id);
		model.addAttribute("meetingList",meetingList );

		model.addAttribute("member_name",memberService.selectUser(project_id) );

		/*<!--  변찬우(수정 2018.12.11):  쿠키생성 추가 for node page  -->*/
		Cookie cookProject_id= new Cookie("project_id",URLEncoder.encode(project_id, "UTF-8"));
		cookProject_id.setMaxAge(6);
		response.addCookie(cookProject_id);

		/*<!--  변찬우(수정 2018.12.22):  쿠키 + 띄어쓰기 에러 및 html 인코딩에러  -->*/
		String project_title = projectVo.getProject_title();
		Cookie cookProject_title= new Cookie("project_title",URLEncoder.encode(project_title, "UTF-8").replace("+", "%20")); 
		cookProject_title.setMaxAge(6); 
		response.addCookie(cookProject_title);
		
		/* 알림기능 - IKS */
		model.addAttribute("pageCnt", postService.totalPostCnt());
		model.addAttribute("workMemberTotalCnt", workService.workMemberTotalCnt(memberVo.getMember_mail()));
		model.addAttribute("totalMsgReceived", messageService.totalMsgReceived(memberVo.getMember_mail()));

		return "main/subMain";
	}

	/**
	 * Invite project ajax string.
	 *
	 * @param model      the model
	 * @param accept     the accept
	 * @param project_id the project id
	 * @param memberVo   the member vo
	 * @return the string
	 */
	@RequestMapping(value = "/inviteProjectAjax", method = RequestMethod.GET)
	public String inviteProjectAjax(Model model,@RequestParam("accept")String accept, @RequestParam("project_id")String project_id, @SessionAttribute("memberVo")MemberVo memberVo) {
		try {
			Map<String, String> delMap = new HashMap<>();
			PMemberVo pMemberVo = new PMemberVo();
			pMemberVo.setPmember_member(memberVo.getMember_mail());
			pMemberVo.setPmember_project(project_id);
			delMap.put("member_mail", memberVo.getMember_mail());
			delMap.put("project_id", project_id);
			if (accept.equals("Y")) {
				memberService.deleteInviteProject(delMap, pMemberVo);
			}
			memberService.deleteInviteProject(delMap);
			model.addAttribute("pMemberList", memberService.selectMainView(memberVo.getMember_mail()));
			model.addAttribute("inviteProjectList", memberService.selectInviteProject(memberVo.getMember_mail()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		/* 알림기능 - IKS */
		model.addAttribute("pageCnt", postService.totalPostCnt());
		model.addAttribute("workMemberTotalCnt", workService.workMemberTotalCnt(memberVo.getMember_mail()));
		model.addAttribute("totalMsgReceived", messageService.totalMsgReceived(memberVo.getMember_mail()));
		
		return "project/ajaxInviteProject";
	}

	/**
	 * Delete project string.
	 *
	 * @param model      the model
	 * @param memberVo   the member vo
	 * @param project_id the project id
	 * @return the string
	 */
	@RequestMapping(value = "/deleteProject", method = RequestMethod.GET)
	public String deleteProject(Model model, @SessionAttribute("memberVo")MemberVo memberVo,
								@RequestParam("project_id")String project_id) {
		try {
			projectService.deleteProject(project_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("pMemberList", memberService.selectMainView(memberVo.getMember_mail()));
		model.addAttribute("inviteProjectList", memberService.selectInviteProject(memberVo.getMember_mail()));
		
		/* 알림기능 - IKS */
		model.addAttribute("pageCnt", postService.totalPostCnt());
		model.addAttribute("workMemberTotalCnt", workService.workMemberTotalCnt(memberVo.getMember_mail()));
		model.addAttribute("totalMsgReceived", messageService.totalMsgReceived(memberVo.getMember_mail()));
		
		return "project/ajaxMainProjectList";
	}


	/**
	 * Ajax main project list string.
	 *
	 * @param model    the model
	 * @param memberVo the member vo
	 * @return the string
	 */
	@RequestMapping(value = "/ajaxMainProjectList", method = RequestMethod.GET)
	public String ajaxMainProjectList(Model model, @SessionAttribute("memberVo")MemberVo memberVo) {

		model.addAttribute("pMemberList", memberService.selectMainView(memberVo.getMember_mail()));
		model.addAttribute("inviteProjectList", memberService.selectInviteProject(memberVo.getMember_mail()));
		
		/* 알림기능 - IKS */
		model.addAttribute("pageCnt", postService.totalPostCnt());
		model.addAttribute("workMemberTotalCnt", workService.workMemberTotalCnt(memberVo.getMember_mail()));
		model.addAttribute("totalMsgReceived", messageService.totalMsgReceived(memberVo.getMember_mail()));
		
		return "project/ajaxMainProjectList";
	}

	/**
	 * Ajax main project list string.
	 *
	 * @param model    the model
	 * @param memberVo the member vo
	 * @return the string
	 */
	@RequestMapping(value = "/ajaxBookMarkMainProjectList", method = RequestMethod.GET)
	public String ajaxBookMarkMainProjectList(Model model, @SessionAttribute("memberVo")MemberVo memberVo) {

		model.addAttribute("pMemberList", projectService.bookMarkProjects(memberVo.getMember_mail()));
		model.addAttribute("inviteProjectList", memberService.selectInviteProject(memberVo.getMember_mail()));
		
		/* 알림기능 - IKS */
		model.addAttribute("pageCnt", postService.totalPostCnt());
		model.addAttribute("workMemberTotalCnt", workService.workMemberTotalCnt(memberVo.getMember_mail()));
		model.addAttribute("totalMsgReceived", messageService.totalMsgReceived(memberVo.getMember_mail()));
		
		return "project/ajaxMainProjectList";
	}
}