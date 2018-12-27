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
import kr.or.ddit.qna.web.QnAController;

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
	
	Logger logger = LoggerFactory.getLogger(QnAController.class);
	
	@RequestMapping(value= "/chatListAjax", method= {RequestMethod.GET,RequestMethod.POST}) // headers="Accept=application/json"
	public String meetingListView(@RequestParam("meeting_title")String meeting_title, Model model) {
		
		model.addAttribute("chatList", chattingService.chattingList(meeting_title));
		
		return "main/chatListAjax";
	}
	
}
