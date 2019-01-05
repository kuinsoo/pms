package kr.or.ddit.work.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.or.ddit.issue.model.IssueVo;
import kr.or.ddit.issue.service.IssueServiceInf;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.message.model.MessageVo;
import kr.or.ddit.message.service.MessageServiceInf;
import kr.or.ddit.post.model.PostVo;
import kr.or.ddit.post.service.PostServiceInf;
import kr.or.ddit.util.model.PageVo;
import kr.or.ddit.work.model.WorkVo;
import kr.or.ddit.work.service.WorkServiceInf;

/**
 * kr.or.ddit.work.web
 * null.java
 * Desc : 알림 컨트롤러
 *
 * @Author : 임규승
 * @Date : 2018-12-18 / 오후 2:00
 * @Version :
 */
@Controller
public class AlarmController {

	Logger logger = LoggerFactory.getLogger(AlarmController.class);
	
	@Autowired
	private WorkServiceInf workService;

	@Autowired
	private PostServiceInf postService;

	@Autowired
	private MessageServiceInf messageService;
	
	@Autowired
	private IssueServiceInf issueService;
	
	/**
	* Method : ajaxMessageAlarm
	* 작성자 : iks
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 쪽지 알림 조회
	*/
	@RequestMapping(value="/ajaxMessageAlarm", method=RequestMethod.GET)
	public String ajaxMessageAlarm(Model model, PageVo pageVo, @SessionAttribute("memberVo") MemberVo memberVo){
		
		pageVo.setMember_mail(memberVo.getMember_mail());
		
		List<MessageVo> messageMemberList = messageService.messageReceived(pageVo);
		
		Map<String, Object> messageMap = new HashMap<>();
		int totalMsgReceived = messageService.totalMsgReceived(memberVo.getMember_mail());
		
		messageMap.put("messageMemberList", messageMemberList);
		messageMap.put("totalMsgReceived", (int)Math.ceil((double)totalMsgReceived/pageVo.getPageSize()));
		
		model.addAttribute("messageMap", messageMap);
		model.addAttribute("totalMsgReceived", totalMsgReceived);
		
		return "alarm/ajaxMessageAlarm";
	}
	
	/**
	* Method : ajaxWorkAlarm
	* 작성자 : iks
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 업무 알림 조회
	*/
	@RequestMapping(value="/ajaxWorkAlarm", method=RequestMethod.GET)
	public String ajaxWorkAlarm(Model model, PageVo pageVo, @SessionAttribute("memberVo") MemberVo memberVo){
		
		pageVo.setMember_mail(memberVo.getMember_mail());
		
		List<WorkVo> workMemberList = workService.getWorkPageList(pageVo);
		// List<WorkVo> workList = workService.workMember(memberVo.getMember_mail());
		
		Map<String, Object> workMap = new HashMap<>();
		int workMemberTotalCnt = workService.workMemberTotalCnt(memberVo.getMember_mail());
		
		workMap.put("workMemberList", workMemberList);
		workMap.put("workMemberTotalCnt", (int)Math.ceil((double)workMemberTotalCnt/pageVo.getPageSize()));
		
		model.addAttribute("workMap", workMap);
		model.addAttribute("workMemberTotalCnt", workMemberTotalCnt);
		
		return "alarm/ajaxWorkAlarm";
	}
	
	/**
	* Method : ajaxNoticeAlarm
	* 작성자 : iks
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 공지 알림 조회
	*/
	@RequestMapping(value="/ajaxNoticeAlarm", method=RequestMethod.GET)
	public String ajaxNoticeAlarm(Model model, PageVo pageVo, @SessionAttribute("memberVo") MemberVo memberVo){		

		pageVo.setMember_mail(memberVo.getMember_mail());

		List<PostVo> noticeList = postService.getPostPageList(pageVo);
		
		Map<String, Object> noticeMap = new HashMap<>();
		int pageCnt = postService.totalPostCnt();
		
		noticeMap.put("noticeList", noticeList);
		noticeMap.put("pageCnt", (int)Math.ceil((double)pageCnt/pageVo.getPageSize()));
		
		model.addAttribute("noticeMap", noticeMap);
		model.addAttribute("pageCnt", pageCnt);
		
		return "alarm/ajaxNoticeAlarm";
	}
	
	/**
	* Method : ajaxIssueAlarm
	* 작성자 : iks
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 이슈 알림 조회
	*/
	@RequestMapping(value="/ajaxIssueAlarm", method=RequestMethod.GET)
	public String ajaxIssueAlarm(Model model, PageVo pageVo, @SessionAttribute("memberVo") MemberVo memberVo){		

		pageVo.setMember_mail(memberVo.getMember_mail());

		List<IssueVo> issueMemberList = issueService.getIssuePageList(pageVo);
		
		Map<String, Object> issueMap = new HashMap<>();
		int issueMemberTotalCnt = issueService.issueMemberTotalCnt(memberVo.getMember_mail());
		
		issueMap.put("issueMemberList", issueMemberList);
		issueMap.put("issueMemberTotalCnt", (int)Math.ceil((double)issueMemberTotalCnt/pageVo.getPageSize()));
		
		model.addAttribute("issueMap", issueMap);
		model.addAttribute("issueMemberTotalCnt", issueMemberTotalCnt);
		
		return "alarm/ajaxIssueAlarm";
	}
	
	@RequestMapping(value="/alarmNotice", method=RequestMethod.GET)
	@ResponseBody
	public int alarmNotice(Model model) {
		
		int pageCnt = postService.totalPostCnt();
		
		return pageCnt;
	}
	
	@RequestMapping(value="/alarmWork", method=RequestMethod.GET)
	@ResponseBody
	public int alarmWork(Model model, @SessionAttribute("memberVo") MemberVo memberVo) {
		
		int workMemberTotalCnt = workService.workMemberTotalCnt(memberVo.getMember_mail());
		
		return workMemberTotalCnt;
	}
	
	@RequestMapping(value="/alarmMessage", method=RequestMethod.GET)
	@ResponseBody
	public int alarmMessage(Model model, @SessionAttribute("memberVo") MemberVo memberVo) {
		
		int totalMsgReceived = messageService.totalMsgReceived(memberVo.getMember_mail());
		
		return totalMsgReceived;
	}
	
	@RequestMapping(value="/alarmIssue", method=RequestMethod.GET)
	@ResponseBody
	public int alarmIssue(Model model, @SessionAttribute("memberVo") MemberVo memberVo) {
		
		int issueMemberTotalCnt = issueService.issueMemberTotalCnt(memberVo.getMember_mail());
		
		return issueMemberTotalCnt;
	}
	
	
}