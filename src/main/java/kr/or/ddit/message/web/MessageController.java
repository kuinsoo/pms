package kr.or.ddit.message.web;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.or.ddit.member.model.MemberVo;

/**
 * kr.or.ddit.message.web
 * null.java
 * Desc : 쪽지 컨트롤러
 *
 * @Author : Mr.KKu
 * @Date : 2018-11-27 / 오후 3:12
 * @Version :
 */
@RestController
public class MessageController {
	
	@RequestMapping("/messageSend")
	public String message(@SessionAttribute("memberVo") MemberVo memberVo, Model model) {
		
		model.addAttribute("memberVo",memberVo);
		return "/message/messageEx";
	}

}
