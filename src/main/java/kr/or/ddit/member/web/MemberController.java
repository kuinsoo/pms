package kr.or.ddit.member.web;

import kr.or.ddit.commons.mail.service.EmailServiceInf;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * kr.or.ddit.member.web
 * null.java
 * Desc : 회원 컨트롤러
 *
 * @Author : Mr.KKu
 * @Date : 2018-11-27 / 오후 3:08
 * @Version :
 */
@Controller
public class MemberController {

	@Autowired
	private EmailServiceInf emailService;

	@RequestMapping(value = "/inviteTeam" ,method = RequestMethod.POST)
	public String inviteTeam(@RequestParam("inviteTeam")String[] inviteMails) {
		String subject = "Current Project 초대 알람 입니다.";
		String content = "프로젝트 주소 : http://127.0.0.1:8081/?teamId=8";
		for (String inviteMail :
				inviteMails) {
			String to = inviteMail;
			emailService.sendMail(to,subject,content);
		}
		return "redirect:/";
	}
}
