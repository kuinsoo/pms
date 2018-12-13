package kr.or.ddit.notice.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import kr.or.ddit.member.web.LoginController;

/**
 * kr.or.ddit.notice.web
 * null.java
 * Desc : 공지사항 컨트롤러
 *
 * @Author : iks
 * @Date : 2018-12-13 / 오전 10:45
 * @Version :
 */
@Controller
public class NoticeController {
	 
	Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	/**
	 * Method : noticeView
	 * 작성자 : iks
	 * 변경이력 :
	 *
	 * @return Method 설명 : 공지사항 화면단
	 */
	@RequestMapping(value= "/notice")
	public String noticeView() {
		return "notice/notice";
	}
}