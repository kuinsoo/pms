package kr.or.ddit.commons.mail.web;

import kr.or.ddit.commons.mail.service.EmailSserviceInf;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * kr.or.ddit.commons.mail
 * null.java
 * Desc : email Controller
 *
 * @Author : Mr.KKu
 * @Date : 2018-12-03 / 오후 3:14
 * @Version :
 */
@Controller
public class EmailController {

	@Autowired
	private EmailSserviceInf emailSservice;

	@RequestMapping(value = "/sendMail")
	public void sendMail() {
		String to = "sally1334@naver.com";
		String subject = " 안녕하세요 current PMS 입니다. ";
		String content = "임시 password";

		emailSservice.sendMail(to,subject,content);

	}



}
