package kr.or.ddit.message.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.or.ddit.friendslist.model.FriendsListVo;
import kr.or.ddit.friendslist.service.FriendsListServiceInf;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.member.web.LoginController;

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
	public String message(@SessionAttribute("memberVo") MemberVo memberVo, Model model, FriendsListVo friendVo) {
		
		/*FriendsListVo selctMyFriend = friendservice.selectMyFriends(memberVo.getMember_mail());
		
		model.addAttribute("selctMyFriend",selctMyFriend);*/
		
		return "message/message";
	}
	
}
