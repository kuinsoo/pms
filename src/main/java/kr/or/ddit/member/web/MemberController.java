package kr.or.ddit.member.web;

import kr.or.ddit.card.service.CardServiceInf;
import kr.or.ddit.comments.service.CommentsServiceInf;
import kr.or.ddit.commons.mail.service.EmailServiceInf;
import kr.or.ddit.issue.service.IssueServiceInf;
import kr.or.ddit.meeting.model.MeetingVo;
import kr.or.ddit.meeting.service.MeetingServiceInf;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.member.model.PMemberVo;
import kr.or.ddit.member.service.MemberServiceInf;
import kr.or.ddit.message.service.MessageServiceInf;
import kr.or.ddit.post.service.PostServiceInf;
import kr.or.ddit.project.model.InviteProjectVo;
import kr.or.ddit.project.model.ProjectVo;
import kr.or.ddit.project.service.ProjectServiceInf;
import kr.or.ddit.work.service.WorkServiceInf;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * kr.or.ddit.member.web
 * null.java
 * Desc : 회원 컨트롤러
 *
 * @Author : Mr.KKu
 * @Date : 2018-11-27 / 오후 3:08
 * @Version :
 */
@Controller
public class MemberController {

	@Autowired
	private EmailServiceInf emailService;

	@Autowired
	private MemberServiceInf memberService;
	
	@Autowired
	private ProjectServiceInf projectService;

	@Autowired
	private WorkServiceInf workService;

	@Autowired
	private CommentsServiceInf commentsService;

	@Autowired
	private CardServiceInf cardService;

	@Autowired
	private MeetingServiceInf meetingService;
	
	@Autowired
	private MessageServiceInf messageService;
	
	@Autowired
	private PostServiceInf postService;
	
	@Autowired
	private IssueServiceInf issueService;

	@RequestMapping(value = "/inviteTeam" ,method = RequestMethod.POST)
	public String inviteTeam(Model model , @RequestParam("inviteTeam")String[] inviteMails, @RequestParam("project_id")String project_id,
							 @SessionAttribute("memberVo")MemberVo memberVo) {
		String subject = "Current Project 초대 알람 입니다.";
		String content = "프로젝트 주소 : https://127.0.0.1:8081/?teamId="+ project_id ;//+ "https://imgur.com/a/GUN203X"
		InviteProjectVo inviteProjectVo = new InviteProjectVo();
		PMemberVo pMemberVo = new PMemberVo();
		String project_title = "";
		pMemberVo.setPmember_project(project_id);
		try {
			for (String inviteMail :
					inviteMails) {
				pMemberVo.setPmember_member(inviteMail);
				if( memberService.selectUser(inviteMail) == null){
					continue; // 회원이 아닐경우 발송 되지 않는다.
				}else {
					if(memberService.searchTeamMember(pMemberVo) == null && memberService.searchInviteMember(pMemberVo) == null ){
						String to = inviteMail;

						inviteProjectVo.setMember_mail(inviteMail);
						inviteProjectVo.setInvite_mail(memberVo.getMember_mail());
						inviteProjectVo.setInvite_name(memberVo.getMember_name());
						inviteProjectVo.setProject_id(project_id);
						inviteProjectVo.setProject_invite("x");
						memberService.invitedProjects(inviteProjectVo);
						emailService.sendMail(to,subject,content);
					}else {
						continue;
					}

				}
				
			}
		}catch (Exception e){
			e.printStackTrace();
		}
		ProjectVo projectVo = projectService.selectProject(project_id);
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

		Map<String, String> mtMap = new HashMap<>();
		mtMap.put("project_id", project_id);
		model.addAttribute("workCharts",workService.workChart(mtMap));
		/* 변찬우(추가 2018.12.26) 프로젝트 목록 출력 */
		List<MeetingVo> meetingList= meetingService.meetingList(project_id);
		model.addAttribute("meetingList",meetingList );

		model.addAttribute("member_name",memberService.selectUser(project_id) );
		
		/* 알림기능 - IKS */
		model.addAttribute("pageCnt", postService.totalPostCnt());
		model.addAttribute("workMemberTotalCnt", workService.workMemberTotalCnt(memberVo.getMember_mail()));
		model.addAttribute("totalMsgReceived", messageService.totalMsgReceived(memberVo.getMember_mail()));
		model.addAttribute("issueMemberTotalCnt", issueService.issueMemberTotalCnt(memberVo.getMember_mail()));

		return "main/subMain";
	}

}
