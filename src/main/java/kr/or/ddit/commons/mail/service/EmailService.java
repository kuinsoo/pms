package kr.or.ddit.commons.mail.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

/**
 * kr.or.ddit.commons.mail.service
 * null.java
 * Desc : email 서비스
 *
 * @Author : Mr.KKu
 * @Date : 2018-12-03 / 오후 3:54
 * @Version :
 */
@Service
public class EmailService implements EmailSserviceInf{

	@Autowired
	public JavaMailSender emailSender;


	/**
	 * Send mail.
	 * 이메일을 전송해준다.s
	 * @param to      the 상대방 Email
	 * @param subject the 제목
	 * @param content    the 내용
	 */
	public void sendMail (String to, String subject, String content) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(to);
		message.setSubject(subject);
		message.setText(content);
		emailSender.send(message);
	}
}
