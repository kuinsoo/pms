package kr.or.ddit.message.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.friendslist.model.FriendListVo;
import kr.or.ddit.friendslist.service.FriendsListServiceInf;
import kr.or.ddit.issue.service.IssueServiceInf;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.message.model.MessageVo;
import kr.or.ddit.message.service.MessageServiceInf;
import kr.or.ddit.post.service.PostServiceInf;
import kr.or.ddit.util.model.PageVo;
import kr.or.ddit.work.service.WorkServiceInf;
import oracle.net.aso.f;

/**
 * kr.or.ddit.message.web
 * null.java
 * Desc : 쪽지 컨트롤러
 *
 * @Author : Mr.KKu
 * @Date : 2018-11-27 / 오후 3:12
 * @Version :
 */
@Controller
public class MessageController {
	
	@Autowired
	private FriendsListServiceInf friendservice;
	
	@Autowired
	private PostServiceInf postService;
	
	@Autowired
	private WorkServiceInf workService;
	
	@Autowired
	private MessageServiceInf messageService;
	
	@Autowired
	private IssueServiceInf issueService;
	
	
	/**
	 * Method : message
	 * 작성자 : pc07
	 * 변경이력 :
	 * @param memberVo
	 * @param model
	 * @return
	 * Method 설명 : header에서 message jsp로 보내기위함  
	 */
	@RequestMapping(value= "/message")
	public String message(@SessionAttribute("memberVo") MemberVo memberVo,
			 HttpServletRequest request ,Model model, FriendListVo friendVo , MessageVo msgVo) {
	
		String messageMember_mail = request.getParameter("member_mail");
		List<FriendListVo> selctMyFriend = friendservice.selectMyFriends(memberVo.getMember_mail());
		model.addAttribute("selctMyFriend",selctMyFriend);
		model.addAttribute("pageCnt", postService.totalPostCnt());
		
		model.addAttribute("messageMember_mail", messageMember_mail);
		
		/* 알림기능 - IKS */
		model.addAttribute("pageCnt", postService.totalPostCnt());
		model.addAttribute("workMemberTotalCnt", workService.workMemberTotalCnt(memberVo.getMember_mail()));
		model.addAttribute("totalMsgReceived", messageService.totalMsgReceived(memberVo.getMember_mail()));
		model.addAttribute("issueMemberTotalCnt", issueService.issueMemberTotalCnt(memberVo.getMember_mail()));
		model.addAttribute("totalyouGiveFriendList", messageService.totalyouGiveFriendList(memberVo.getMember_mail()));
		
		
		
		return "message/message";
	}
	
	//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	/*
	 **** 	@ResponseBody ****** 꼭 해주기  
	 */
	/**
	 * Method : messageReceivedAjax
	 * 작성자 : pc07
	 * 변경이력 :
	 * @param memberVo
	 * @param pageVo
	 * @return
	 * Method 설명 : 받은쪽지 Ajax (페이징 처리 포함)
	 */
	@ResponseBody
	@RequestMapping(value= "/messageReceivedAjax" , method= RequestMethod.GET)
	public Map<String ,Object> messageReceivedAjax(@SessionAttribute("memberVo") MemberVo memberVo ,PageVo pageVo) {
		
		pageVo.setMember_mail(memberVo.getMember_mail());
		
		MessageVo messageVo = new MessageVo();
		messageVo.setMsg_rmember(memberVo.getMember_mail());
		
		List<MessageVo> msgReceiveList = messageService.messageReceived(pageVo);	
		int pageCnt = messageService.totalMsgReceived(memberVo.getMember_mail());

		Map<String, Object> msgReceiveMap = new HashMap<>();
		msgReceiveMap.put("msgReceiveList", msgReceiveList);
		msgReceiveMap.put("pageCnt", (int)Math.ceil((double)pageCnt/pageVo.getPageSize()));
		
		return msgReceiveMap;
	}	
	
	
	
	

	/**
	 * Method : myfriendListAjax
	 * 작성자 : pc07
	 * 변경이력 :
	 * @param memberVo
	 * @param pageVo
	 * @return
	 * Method 설명 : 친구리스트 + 페이징 처리 
	 */  
	@ResponseBody
	@RequestMapping(value="/myfriendListAjax", method= RequestMethod.GET)
	public Map<String, Object>myfriendListAjax (@SessionAttribute("memberVo") MemberVo memberVo , PageVo pageVo){
		
		pageVo.setMember_mail(memberVo.getMember_mail());
		
		FriendListVo freidListVo = new FriendListVo();
		freidListVo.setFriend_myemail(memberVo.getMember_mail());
		
		List<FriendListVo> myFriendList = messageService.MyFriendsList(pageVo);
		
		int pageCnt = messageService.totalFriends(memberVo.getMember_mail());
		
		Map<String, Object> myFriendMap = new HashMap<>();
		myFriendMap.put("myFriendList", myFriendList);
		myFriendMap.put("pageCnt", (int)Math.ceil((double)pageCnt/pageVo.getPageSize()));
		
		return myFriendMap;
	}
	
	// 전체 사용자 
	
	@ResponseBody
	@RequestMapping(value="/AllMemberListAjax", method= RequestMethod.GET)
	public Map<String, Object>AllMemberListAjax (@SessionAttribute("memberVo") MemberVo memberVo , PageVo pageVo){
		
		pageVo.setMember_mail(memberVo.getMember_mail());
		List<MemberVo> myMemberList = messageService.totalMemberSearch(pageVo);
		
		int pageCnt = messageService.totalMember(memberVo.getMember_mail());
		
		Map<String, Object> myMemberMap = new HashMap<>();
		myMemberMap.put("myMemberList", myMemberList);
		myMemberMap.put("pageCnt", (int)Math.ceil((double)pageCnt/pageVo.getPageSize()));
		
		return myMemberMap;
	}
	
	// 친구추가 버튼을 클릭했을때 
	@ResponseBody
	@RequestMapping(value="/youGiveNoAjax", method= RequestMethod.GET)
	public Map<String, Object> youGiveNoAjax (@SessionAttribute("memberVo") MemberVo memberVo , FriendListVo friendVo,
			PageVo pageVo, HttpServletRequest request){
		
		
		pageVo.setMember_mail(memberVo.getMember_mail());
		friendVo.setFriend_myemail(memberVo.getMember_mail());
		pageVo.setFriend_accept(friendVo.getFriend_accept());
		
		String member_mail = request.getParameter("member_mail");
		friendVo.setFriend_member(member_mail);
		
		messageService.insertFriendN(friendVo);

		List<MemberVo> myMemberList = messageService.totalMemberSearch(pageVo);
		int pageCnt = messageService.totalMember(memberVo.getMember_mail());
		
		//List<FriendListVo> memberListN = messageservice.memberListN(friendVo);
		//myMemberMap.put("memberListN", memberListN);

		Map<String, Object> myMemberMap = new HashMap<>();
		myMemberMap.put("myMemberList", myMemberList);
		myMemberMap.put("pageCnt", (int)Math.ceil((double)pageCnt/pageVo.getPageSize()));
		
		return myMemberMap;
	}
	
	// 전체 사용자 검색 부분 
	@ResponseBody
	@RequestMapping(value="/AllMemberListSearchAjax", method= RequestMethod.POST)
	public Map<String, Object> AllMemberListSearchAjax (@SessionAttribute("memberVo") MemberVo memberVo , PageVo pageVo){
		
		pageVo.setMember_mail(memberVo.getMember_mail());
		
		if(pageVo.getSearchTextFriendList() == null) {
			pageVo.setSearchTextFriendList("");
		}
		List<MemberVo> myMemberList = messageService.totalMemberSearch(pageVo);
		
		int searchCnt = messageService.totalMemberListSearch(pageVo);
		
		Map<String, Object> myMemberMap = new HashMap<>();
		myMemberMap.put("myMemberList", myMemberList);
		myMemberMap.put("searchCnt", (int)Math.ceil((double)searchCnt/pageVo.getPageSize()));
		
		return myMemberMap;
	}
	
	@ResponseBody
	@RequestMapping(value="/myFriendsDelete", method = RequestMethod.GET)
	public Map<String , Object> myFriendsDelete(@SessionAttribute("memberVo")MemberVo memberVo, PageVo pageVo, 
								HttpServletRequest request){
		pageVo.setMember_mail(memberVo.getMember_mail());
		
		String friend_code = request.getParameter("friend_code");

		FriendListVo freidListVo = new FriendListVo();
		freidListVo.setFriend_myemail(memberVo.getMember_mail());
		
		messageService.deleteMyfriend(friend_code);
		
		List<FriendListVo> myFriendList = messageService.MyFriendsList(pageVo);
		
		int pageCnt = messageService.totalFriends(memberVo.getMember_mail());
		
		Map<String, Object> myFriendDeleteMap = new HashMap<>();
		myFriendDeleteMap.put("myFriendList", myFriendList);
		myFriendDeleteMap.put("pageCnt", (int)Math.ceil((double)pageCnt/pageVo.getPageSize()));

		return myFriendDeleteMap;
	}
	
	/**
	 * Method : searchTextFriendAjax
	 * 작성자 : pc07
	 * 변경이력 :
	 * @param memberVo
	 * @param pageVo
	 * @return
	 * Method 설명 : 친구리스트 + 페이징 처리  ==> 검색 처리 
	 */
	@ResponseBody
	@RequestMapping(value="/searchTextFriendAjax",method = RequestMethod.POST)
	public Map<String, Object> searchTextFriendAjax (@SessionAttribute("memberVo") MemberVo memberVo , PageVo pageVo){
		
		
		pageVo.setMember_mail(memberVo.getMember_mail());
		
		if(pageVo.getSearchTextFriend() == null) {
			pageVo.setSearchTextFriend("");
		}
		
		FriendListVo friendListVo = new FriendListVo();
		friendListVo.setFriend_myemail(memberVo.getMember_mail());
		
		List<FriendListVo> myFriendList = messageService.MyFriendsList(pageVo);
		
		int pageCnt = messageService.totalFriendsSearch(pageVo);
		
		Map<String, Object> myFriendMap = new HashMap<>();
		myFriendMap.put("myFriendList", myFriendList);
		myFriendMap.put("pageCnt", (int)Math.ceil((double)pageCnt/pageVo.getPageSize()));
		
		return myFriendMap;
	}
	
	
	/**
	 * Method : updateMessageReceived
	 * 작성자 : pc07
	 * 변경이력 :
	 * @return
	 * Method 설명 : 받은 메시지 읽음 / 안읽음 처리하기 
	 * 			    Y - 읽지 않음 , N - 읽음 
	 */
	@ResponseBody
	@RequestMapping(value = "/updateMessageReceivedAjax", method = RequestMethod.GET)
	public MessageVo updateMessageReceivedAjax(@SessionAttribute("memberVo") MemberVo memberVo
							, @RequestParam("msg_id")String msg_id, Model model, MessageVo msgVo, PageVo pageVo) {
		model.addAttribute("msg_id", msg_id);
		
		int updateMessage = messageService.updateMessageReceived(msgVo);
		model.addAttribute("updateMessage", updateMessage);
		
		MessageVo messageVo = messageService.selectOneMessageReceived(msg_id);
		model.addAttribute("messageVo", msgVo);
		
		return messageVo;
	}
	

	
	//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	// ResponseBody : 아작스 처리할때 
	// 보낸 쪽지 
	/**
	 * Method : messageSendAjax
	 * 작성자 : pc07
	 * 변경이력 :
	 * @param memberVo
	 * @param pageVo
	 * @return
	 * Method 설명 : 보낸 쪽지 리스트 ajax
	 */
	@ResponseBody
	@RequestMapping(value= "/messageSendAjax" , method= RequestMethod.GET)
	public Map<String ,Object> messageSendAjax(@SessionAttribute("memberVo") MemberVo memberVo ,PageVo pageVo) {
		
		pageVo.setMember_mail(memberVo.getMember_mail());
		
		MessageVo messageVo = new MessageVo();
		messageVo.setMsg_smember(memberVo.getMember_mail());
		List<MessageVo> msgSendList = messageService.messageSend(pageVo);	
		int pageCnt = messageService.totalMsgSend(messageVo.getMsg_smember());

		Map<String, Object> msgSendMap = new HashMap<>();
		msgSendMap.put("msgSendList", msgSendList);
		msgSendMap.put("pageCnt", (int)Math.ceil((double)pageCnt/pageVo.getPageSize()));
		
		return msgSendMap;
	}	
	
	/**
	 * Method : updateMessageSendAjax
	 * 작성자 : pc07
	 * 변경이력 :
	 * @param memberVo
	 * @param msg_id
	 * @param model
	 * @param pageVo
	 * @return
	 * Method 설명 : 보낸쪽지 클릭했을때 Detail부분 
	 * 		       data를 controller로 보내준다.
	 */
	@ResponseBody
	@RequestMapping(value = "/updateMessageSendAjax", method = RequestMethod.GET)
	public MessageVo updateMessageSendAjax(@SessionAttribute("memberVo") MemberVo memberVo
			, @RequestParam("msg_id")String msg_id, Model model, PageVo pageVo) {
			
		MessageVo messageVo = new MessageVo();
		messageVo.setMsg_id(msg_id);
		messageVo.setMsg_smember(memberVo.getMember_mail());
		MessageVo msgVo = messageService.selectOneMessageSend(messageVo);

		return msgVo;
	}
	
	
	//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	/**
	 * Method : deleteMessageReceived
	 * 작성자 : pc07
	 * 변경이력 :
	 * @param memberVo
	 * @param msgVo
	 * @param msg_id
	 * @return
	 * Method 설명 : 받는거 삭제  
	 */
	@RequestMapping(value= "/deleteMessageReceived", method= RequestMethod.POST)
	public  String deleteMessageReceived(@SessionAttribute("memberVo") MemberVo memberVo , MessageVo msgVo , @RequestParam("msg_id") String msg_id, Model model) {
		messageService.deleteMsgReceived(msg_id);
		
		/* 알림기능 - IKS */
		model.addAttribute("pageCnt", postService.totalPostCnt());
		model.addAttribute("workMemberTotalCnt", workService.workMemberTotalCnt(memberVo.getMember_mail()));
		model.addAttribute("totalMsgReceived", messageService.totalMsgReceived(memberVo.getMember_mail()));
		model.addAttribute("issueMemberTotalCnt", issueService.issueMemberTotalCnt(memberVo.getMember_mail()));
		model.addAttribute("totalyouGiveFriendList", messageService.totalyouGiveFriendList(memberVo.getMember_mail()));
		
		return "redirect:message#tabs2-2";
	}
	
	@RequestMapping(value="/sendYouMessageUpdate" , method= RequestMethod.POST)
	public String sendYouMessageUpdate(@RequestParam("msg_person")String msg_person, RedirectAttributes redirectAttributes,
									Model model, @SessionAttribute("memberVo") MemberVo memberVo ) {
		
		//redirectAttributes.addAttribute("msg_person", msg_person);
		
		/* addFlashAttribute : 리다이렉트 직전 플래시에 저장하는 메소드다. 리다이렉트 이후에는 소멸한다. */
		redirectAttributes.addFlashAttribute("msg_person", msg_person);
		
		/* 알림기능 - IKS */
		model.addAttribute("pageCnt", postService.totalPostCnt());
		model.addAttribute("workMemberTotalCnt", workService.workMemberTotalCnt(memberVo.getMember_mail()));
		model.addAttribute("totalMsgReceived", messageService.totalMsgReceived(memberVo.getMember_mail()));
		model.addAttribute("issueMemberTotalCnt", issueService.issueMemberTotalCnt(memberVo.getMember_mail()));
		model.addAttribute("totalyouGiveFriendList", messageService.totalyouGiveFriendList(memberVo.getMember_mail()));
		
		return "redirect:message#tabs2-1";
	}
	
	/**
	 * Method : deleteMessageSend
	 * 작성자 : pc07
	 * 변경이력 :
	 * @param memberVo
	 * @param msgVo
	 * @param msg_id
	 * @return
	 * Method 설명 : 보낸거 삭제 
	 */
	@RequestMapping(value= "/deleteMessageSend", method= RequestMethod.POST)
	public  String deleteMessageSend(@SessionAttribute("memberVo") MemberVo memberVo , MessageVo msgVo , @RequestParam("msgmember_msg") String msg_id, Model model) {
		messageService.deleteMsgReceived(msg_id);
		
		/* 알림기능 - IKS */
		model.addAttribute("pageCnt", postService.totalPostCnt());
		model.addAttribute("workMemberTotalCnt", workService.workMemberTotalCnt(memberVo.getMember_mail()));
		model.addAttribute("totalMsgReceived", messageService.totalMsgReceived(memberVo.getMember_mail()));
		model.addAttribute("issueMemberTotalCnt", issueService.issueMemberTotalCnt(memberVo.getMember_mail()));
		model.addAttribute("totalyouGiveFriendList", messageService.totalyouGiveFriendList(memberVo.getMember_mail()));
		
		return "redirect:message#tabs2-3";
	}

	/**
	 * Method : insertMessageSend
	 * 작성자 : pc07
	 * 변경이력 :
	 * @param memberVo
	 * @param request
	 * @param msgVo
	 * @return
	 * Method 설명 : 쪽지 보내기 
	 */
	@RequestMapping(value= "/insertMessageSend" , method= RequestMethod.POST)
	public void insertMessageSend(@SessionAttribute("memberVo") MemberVo memberVo,
				HttpServletRequest request ,MessageVo msgVo, Model model) {
		
		String msg_rmember = request.getParameter("textValue");
		String msg_content = request.getParameter("textArea");
	
		msgVo.setMsg_id(msgVo.getMsg_id());
		msgVo.setMsg_content(msg_content);
		msgVo.setMsg_smember(memberVo.getMember_mail());
		msgVo.setMsg_rmember(msg_rmember);
		
		int insertMessage = messageService.insertMessageSend(msgVo);
		
		/* 알림기능 - IKS */
		model.addAttribute("pageCnt", postService.totalPostCnt());
		model.addAttribute("workMemberTotalCnt", workService.workMemberTotalCnt(memberVo.getMember_mail()));
		model.addAttribute("totalMsgReceived", messageService.totalMsgReceived(memberVo.getMember_mail()));
		model.addAttribute("issueMemberTotalCnt", issueService.issueMemberTotalCnt(memberVo.getMember_mail()));
		model.addAttribute("totalyouGiveFriendList", messageService.totalyouGiveFriendList(memberVo.getMember_mail()));
		
	}
	
	//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	// 친구 요청 : 내가 보낸 요청 

	@ResponseBody
	@RequestMapping(value="/myFriendSendListAjax", method= RequestMethod.GET)
	public Map<String, Object> myFriendSendListAjax (@SessionAttribute("memberVo") MemberVo memberVo , FriendListVo friendVo, PageVo pageVo){
		
		pageVo.setMember_mail(memberVo.getMember_mail());
		friendVo.setMember_name(memberVo.getMember_name());
		
		List<FriendListVo> sendFriendList = messageService.mySendFriendList(pageVo);
		
		int pageCnt = messageService.totalmySendFriendList(memberVo.getMember_mail());
		
		Map<String, Object> myFriendsListMap = new HashMap<>();
		myFriendsListMap.put("sendFriendList", sendFriendList);
		myFriendsListMap.put("pageCnt", (int)Math.ceil((double)pageCnt/pageVo.getPageSize()));
		
		return myFriendsListMap;
	}
	
	// 요청 취소부분 ajax처리 
	
	
	// 친구 요청 : 내가 보낸 요청 
	// 검색 부분 
	@ResponseBody
	@RequestMapping(value="/myFriendSendListSearchAjax", method= RequestMethod.POST)
	public Map<String, Object> myFriendSendListSearchAjax (@SessionAttribute("memberVo") MemberVo memberVo , PageVo pageVo){
		
		pageVo.setMember_mail(memberVo.getMember_mail());

		if(pageVo.getSearchTextMySendFriendList()== null) {
			pageVo.setSearchTextMySendFriendList("");
		}
		
		List<FriendListVo> sendFriendList = messageService.mySendFriendList(pageVo);
		
		int tatalCnt = messageService.totalmySendFriendListSearch(pageVo);
		
		Map<String, Object> myFriendsListMap = new HashMap<>();
		myFriendsListMap.put("sendFriendList", sendFriendList);
		myFriendsListMap.put("tatalCnt", (int)Math.ceil((double)tatalCnt/pageVo.getPageSize()));
		
		return myFriendsListMap;
		
	}
	
	
	@ResponseBody
	@RequestMapping(value="/deletemySendFriendAjax", method = RequestMethod.GET)
	public Map<String , Object> deletemySendFriendAjax(@SessionAttribute("memberVo") MemberVo memberVo, PageVo pageVo, FriendListVo friendVo,
								HttpServletRequest request ){
		
		String friend_code = request.getParameter("friend_code");
		
		pageVo.setMember_mail(memberVo.getMember_mail());
		friendVo.setMember_name(memberVo.getMember_name());
		
		List<FriendListVo> sendFriendList = messageService.mySendFriendList(pageVo);
		
		messageService.deletemySendFriendList(friend_code);
		
		int pageCnt = messageService.totalmySendFriendList(memberVo.getMember_mail());
		
		Map<String, Object> myFriendsListMap = new HashMap<>();
		myFriendsListMap.put("sendFriendList", sendFriendList);
		myFriendsListMap.put("pageCnt", (int)Math.ceil((double)pageCnt/pageVo.getPageSize()));
		
		return myFriendsListMap;
	}
	
	//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	// 친구 요청 : 내가 받은 요청 
	
	@ResponseBody
	@RequestMapping(value="/youGiveFriendListAjax", method= RequestMethod.GET)
	public Map<String, Object> youGiveFriendListAjax (@SessionAttribute("memberVo") MemberVo memberVo , FriendListVo friendVo, PageVo pageVo){
		
		pageVo.setMember_mail(memberVo.getMember_mail());
		friendVo.setMember_name(memberVo.getMember_name());
		
		List<FriendListVo> giveFriendList = messageService.youGiveFriendList(pageVo);
		
		int pageCnt = messageService.totalyouGiveFriendList(memberVo.getMember_mail());
		
		Map<String, Object> yougiveListMap = new HashMap<>();
		yougiveListMap.put("giveFriendList", giveFriendList);
		yougiveListMap.put("pageCnt", (int)Math.ceil((double)pageCnt/pageVo.getPageSize()));
		
		return yougiveListMap;
	}
	
	
	
	// 친구 수락 버튼을 클릭했을때 
	@ResponseBody
	@RequestMapping(value="/youGiveYesAjax", method= RequestMethod.GET)
	public Map<String, Object> youGiveYesAjax (@SessionAttribute("memberVo") MemberVo memberVo , FriendListVo friendVo,
							PageVo pageVo, HttpServletRequest request){
		
		String friend_myemail = request.getParameter("friend_myemail");
		
		pageVo.setMember_mail(memberVo.getMember_mail());
		friendVo.setMember_name(memberVo.getMember_name());
		friendVo.setFriend_myemail(memberVo.getMember_mail());
		friendVo.setFriend_member(friend_myemail);
		
		List<FriendListVo> giveFriendList = messageService.youGiveFriendList(pageVo);
		
		String friend_code = request.getParameter("friend_code");
		messageService.updateAcceptFriend(friend_code);
		messageService.insertFriendY(friendVo);
		
		int pageCnt = messageService.totalyouGiveFriendList(memberVo.getMember_mail());
		
		Map<String, Object> yougiveListMap = new HashMap<>();
		yougiveListMap.put("giveFriendList", giveFriendList);
		yougiveListMap.put("pageCnt", (int)Math.ceil((double)pageCnt/pageVo.getPageSize()));
		
		return yougiveListMap;
	}
	
	
	// 친구 거절 버튼을 클릭했을때 
	@ResponseBody
	@RequestMapping(value="/youGiveXXXAjax", method= RequestMethod.GET)
	public Map<String, Object> youGiveXXXAjax (@SessionAttribute("memberVo") MemberVo memberVo , FriendListVo friendVo,
			PageVo pageVo, HttpServletRequest request){
		
		String friend_code = request.getParameter("friend_code");
		
		pageVo.setMember_mail(memberVo.getMember_mail());
		friendVo.setMember_name(memberVo.getMember_name());
		
		List<FriendListVo> giveFriendList = messageService.youGiveFriendList(pageVo);
		
		messageService.updateRefuseFriend(friend_code);
		
		int pageCnt = messageService.totalyouGiveFriendList(memberVo.getMember_mail());
		
		Map<String, Object> yougiveListMap = new HashMap<>();
		yougiveListMap.put("giveFriendList", giveFriendList);
		yougiveListMap.put("pageCnt", (int)Math.ceil((double)pageCnt/pageVo.getPageSize()));
		
		return yougiveListMap;
	}
	

	// 검색 부분
	@ResponseBody
	@RequestMapping(value="/youGiveFriendListSearchAjax", method= RequestMethod.POST)
	public Map<String, Object> youGiveFriendListSearchAjax (@SessionAttribute("memberVo") MemberVo memberVo, FriendListVo friendVo, PageVo pageVo){
		
		pageVo.setMember_mail(memberVo.getMember_mail());
		friendVo.setMember_name(memberVo.getMember_name());
		
		if(pageVo.getSearchTextYouGiveFriendList()==null) {
			pageVo.setSearchTextYouGiveFriendList("");
		}
		
		List<FriendListVo> giveFriendList = messageService.youGiveFriendList(pageVo);
		
		int giveCnt = messageService.totalyouGiveFriendListSearch(pageVo);
		
		Map<String, Object> yougiveListMap = new HashMap<>();
		yougiveListMap.put("giveFriendList", giveFriendList);
		yougiveListMap.put("giveCnt", (int)Math.ceil((double)giveCnt/pageVo.getPageSize()));
		
		return yougiveListMap;
	}
	
	//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	@RequestMapping(value="/friendView")
	public String friendView(Model model,@SessionAttribute("memberVo") MemberVo memberVo, HttpServletRequest request) {
		
		String memberFriendSearch = request.getParameter("member_mail");
		model.addAttribute("memberFriendSearch",memberFriendSearch);
		
		/* 알림기능 - IKS */
		model.addAttribute("pageCnt", postService.totalPostCnt());
		model.addAttribute("workMemberTotalCnt", workService.workMemberTotalCnt(memberVo.getMember_mail()));
		model.addAttribute("totalMsgReceived", messageService.totalMsgReceived(memberVo.getMember_mail()));
		model.addAttribute("issueMemberTotalCnt", issueService.issueMemberTotalCnt(memberVo.getMember_mail()));
		model.addAttribute("totalyouGiveFriendList", messageService.totalyouGiveFriendList(memberVo.getMember_mail()));
		
		return "friend/friend";
	}
	


}

