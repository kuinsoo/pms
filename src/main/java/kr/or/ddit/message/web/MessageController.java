package kr.or.ddit.message.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.or.ddit.friendslist.model.FriendListVo;
import kr.or.ddit.friendslist.service.FriendsListServiceInf;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.message.model.MessageVo;
import kr.or.ddit.message.service.MessageServiceInf;
import kr.or.ddit.util.model.PageVo;

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
	private MessageServiceInf messageservice;
	
	
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
	public String message(@SessionAttribute("memberVo") MemberVo memberVo, Model model, FriendListVo friendVo , MessageVo msgVo) {
	
		List<FriendListVo> selctMyFriend = friendservice.selectMyFriends(memberVo.getMember_mail());
		model.addAttribute("selctMyFriend",selctMyFriend);
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
		
		List<MessageVo> msgReceiveList = messageservice.messageReceived(pageVo);	
		int pageCnt = messageservice.totalMsgReceived(memberVo.getMember_mail());

		Map<String, Object> msgReceiveMap = new HashMap<>();
		msgReceiveMap.put("msgReceiveList", msgReceiveList);
		msgReceiveMap.put("pageCnt", (int)Math.ceil((double)pageCnt/pageVo.getPageSize()));
		
		return msgReceiveMap;
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
		
		int updateMessage = messageservice.updateMessageReceived(msgVo);
		model.addAttribute("updateMessage", updateMessage);
		
		MessageVo messageVo = messageservice.selectOneMessageReceived(msg_id);
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
		List<MessageVo> msgSendList = messageservice.messageSend(pageVo);	
		int pageCnt = messageservice.totalMsgSend(messageVo.getMsg_smember());

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
		MessageVo msgVo = messageservice.selectOneMessageSend(messageVo);

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
	public  String deleteMessageReceived(@SessionAttribute("memberVo") MemberVo memberVo , MessageVo msgVo , @RequestParam("msg_id") String msg_id) {
		messageservice.deleteMsgReceived(msg_id);
		return "redirect:message#tabs2-2";
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
	public  String deleteMessageSend(@SessionAttribute("memberVo") MemberVo memberVo , MessageVo msgVo , @RequestParam("msgmember_msg") String msg_id) {
		messageservice.deleteMsgReceived(msg_id);
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
	public String insertMessageSend(@SessionAttribute("memberVo") MemberVo memberVo,
				HttpServletRequest request ,MessageVo msgVo) {
		
		String msg_rmember = request.getParameter("textValue");
		String msg_content = request.getParameter("textArea");
		
		System.out.println("받는사람" + msg_rmember);
		System.out.println( " 보낸내용" + msg_content);
		
		msgVo.setMsg_id(msgVo.getMsg_id());
		msgVo.setMsg_content(msg_content);
		msgVo.setMsg_smember(memberVo.getMember_mail());
		msgVo.setMsg_rmember(msg_rmember);
		
		System.out.println("member_mail의 값" + memberVo.getMember_mail());
		
		int insertMessage = messageservice.insertMessageSend(msgVo);
		
		return "message/message";
	}

}











