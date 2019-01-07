package kr.or.ddit.meeting.web;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import kr.or.ddit.issue.service.IssueServiceInf;
import kr.or.ddit.meeting.model.MeetingVo;
import kr.or.ddit.meeting.service.MeetingServiceInf;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.message.service.MessageServiceInf;
import kr.or.ddit.post.service.PostServiceInf;
import kr.or.ddit.qna.web.QnAController;
import kr.or.ddit.work.service.WorkServiceInf;

/**
 * kr.or.ddit.meeting.web
 * null.java
 * Desc : 회의 컨트롤러
 *
 * @Author : Mr.KKu
 * @Date : 2018-11-27 / 오후 2:59
 * @Version :
 */
@Controller
public class MeetingController {
	
	@Autowired
	private PostServiceInf postService;
	
	@Autowired
	private WorkServiceInf workService;
	
	@Autowired
	private MessageServiceInf messageService;

	@Autowired
	private MeetingServiceInf meetingService;
	
	@Autowired
	private IssueServiceInf issueService;
	
	Logger logger = LoggerFactory.getLogger(QnAController.class);
	
	@CrossOrigin
	@RequestMapping(value= "/meetingList", 
									method= {RequestMethod.GET,RequestMethod.POST},
									headers="Accept=application/json") 
	public String meetingListView(@RequestParam("project_id")String project_id, MeetingVo meetingVo, Model model, @SessionAttribute("memberVo")MemberVo memberVo) {
		
		List<MeetingVo> meetingList= meetingService.meetingList(project_id);

		model.addAttribute("meetingList", meetingList );
		
		/* 알림기능 - IKS */
		model.addAttribute("pageCnt", postService.totalPostCnt());
		model.addAttribute("workMemberTotalCnt", workService.workMemberTotalCnt(memberVo.getMember_mail()));
		model.addAttribute("totalMsgReceived", messageService.totalMsgReceived(memberVo.getMember_mail()));
		model.addAttribute("issueMemberTotalCnt", issueService.issueMemberTotalCnt(memberVo.getMember_mail()));

		return "main/meetListAjax";
	}
}
