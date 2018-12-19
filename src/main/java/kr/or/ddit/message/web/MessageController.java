package kr.or.ddit.message.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		System.out.println(pageVo.toString());
		
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
		
		System.out.println(msg_id + " ajax에서 ");
		
		int updateMessage = messageservice.updateMessageReceived(msgVo);
		model.addAttribute("updateMessage", updateMessage);
		
		MessageVo messageVo = messageservice.selectOneMessageReceived(msgVo.getMsg_id());
		model.addAttribute("messageVo", msgVo);
		
		System.out.println(messageVo + "messageVo");
		
		return messageVo;
	}
	
	
	
	//ResponseBody : 아작스 처리할때 
	@ResponseBody
	@RequestMapping(value= "/messageSendAjax" , method= RequestMethod.GET)
	public Map<String ,Object> messageSendAjax(@SessionAttribute("memberVo") MemberVo memberVo ,PageVo pageVo) {
		
		pageVo.setMember_mail(memberVo.getMember_mail());
		System.out.println(pageVo.toString());
		
		MessageVo messageVo = new MessageVo();
		messageVo.setMsg_smember(memberVo.getMember_mail());
		
		List<MessageVo> msgSendList = messageservice.messageSend(pageVo);	
		
		System.out.println(msgSendList + "msgSendList");
		int pageCnt = messageservice.totalMsgSend(messageVo.getMsg_smember());

		Map<String, Object> msgSendMap = new HashMap<>();
		msgSendMap.put("msgSendList", msgSendList);
		msgSendMap.put("pageCnt", (int)Math.ceil((double)pageCnt/pageVo.getPageSize()));
		
		return msgSendMap;
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
	 * Method 설명 : 삭제부분  
	 */
	@RequestMapping(value= "/deleteMessageReceived", method= RequestMethod.POST)
	public  String deleteMessageReceived(@SessionAttribute("memberVo") MemberVo memberVo , MessageVo msgVo , @RequestParam("msg_id") String msg_id) {
		
		System.out.println(" 여기는 delete " + " 값 " +  msg_id + "msg_id");
		messageservice.deleteMsgReceived(msg_id);
		
		return "message/message";
	}
	
	@RequestMapping(value= "insertMessageSend" , method= RequestMethod.POST)
	public String insertMessageSend(@SessionAttribute("memberVo") MemberVo memberVo, MessageVo msgVo) {
		
		messageservice.insertMessageSend(msgVo);
		
		return "";
	}

}





























