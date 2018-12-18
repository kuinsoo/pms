package kr.or.ddit.message.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	public String message(@SessionAttribute("memberVo") MemberVo memberVo, Model model, FriendListVo friendVo) {
		
		/*MessageVo msgVo = new MessageVo();
		msgVo.setMsg_rmember(memberVo.getMember_mail());*/

		//String msg_id = msgVo.getMsg_id();
		
		List<FriendListVo> selctMyFriend = friendservice.selectMyFriends(memberVo.getMember_mail());
		model.addAttribute("selctMyFriend",selctMyFriend);
		
		/*MessageVo message =  messageservice.selectMessageReceived(msg_id);
		model.addAttribute("message", message);*/
		
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
	 * Method : msgClick
	 * 작성자 : pc07
	 * 변경이력 :
	 * @param memberVo
	 * @param messageVo
	 * @return
	 * Method 설명 :받은쪽지 클릭했을때 팝업에 뿌려주기 위한 
	 */
	@RequestMapping(value = "/msgClick", method= RequestMethod.GET)
	public String msgClick(@SessionAttribute("memberVo") MemberVo memberVo , MessageVo messageVo  ) {
		
		
		return "message/message";
	}
	
	
}





























