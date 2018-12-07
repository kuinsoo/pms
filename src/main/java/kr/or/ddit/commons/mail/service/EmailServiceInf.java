package kr.or.ddit.commons.mail.service;

/**
 * kr.or.ddit.commons.mail.service
 * null.java
 * Desc : 메일 서비스 인터페이스
 *
 * @Author : Mr.KKu
 * @Date : 2018-12-03 / 오후 3:55
 * @Version :
 */
public interface EmailServiceInf {
	/**
	 * Send mail.
	 * 이메일을 전송해준다.
	 *
	 * @param to      the 상대방 Email
	 * @param subject the 제목
	 * @param content the content
	 */
	void sendMail(String to, String subject, String content);
}
