package kr.or.ddit.chatting.web;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.chatting.service.ChattingService;
import kr.or.ddit.issue.service.IssueServiceInf;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.message.service.MessageServiceInf;
import kr.or.ddit.post.service.PostServiceInf;
import kr.or.ddit.qna.web.QnAController;
import kr.or.ddit.work.service.WorkServiceInf;
import org.springframework.web.bind.annotation.SessionAttribute;

/**
 * kr.or.ddit.chatting.web
 * null.java
 * Desc : 채팅 컨트롤러
 *
 * @Author : Mr.KKu
 * @Date : 2018-11-27 / 오후 2:43
 * @Version :
 */
@Controller
public class ChattingController {
	
	@Autowired
	private ChattingService chattingService;
	
	@Autowired
	private PostServiceInf postService;
	
	@Autowired
	private WorkServiceInf workService;
	
	@Autowired
	private MessageServiceInf messageService;
	
	@Autowired
	private IssueServiceInf issueService;
	
	Logger logger = LoggerFactory.getLogger(QnAController.class);
	
	@RequestMapping(value= "/chatListAjax", method= {RequestMethod.GET,RequestMethod.POST}) 
	public String meetingListView(@RequestParam("meeting_id")String meeting_id, Model model, @SessionAttribute("memberVo")MemberVo memberVo) {
		
		model.addAttribute("chatList", chattingService.chattingList(meeting_id));
		
		/* 알림기능 - IKS */
		model.addAttribute("pageCnt", postService.totalPostCnt());
		model.addAttribute("workMemberTotalCnt", workService.workMemberTotalCnt(memberVo.getMember_mail()));
		model.addAttribute("totalMsgReceived", messageService.totalMsgReceived(memberVo.getMember_mail()));
		model.addAttribute("issueMemberTotalCnt", issueService.issueMemberTotalCnt(memberVo.getMember_mail()));

		return "main/chatListAjax";
	}
	
}
