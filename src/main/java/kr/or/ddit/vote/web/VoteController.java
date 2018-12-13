package kr.or.ddit.vote.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import kr.or.ddit.member.web.LoginController;

/**
 * kr.or.ddit.vote.web
 * null.java
 * Desc : 투표 컨트롤러
 *
 * @Author : iks
 * @Date : 2018-12-12 / 오후 6:59
 * @Version :
 */
@Controller
public class VoteController {
	 
	Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	/**
	 * Method : voteView
	 * 작성자 : iks
	 * 변경이력 :
	 *
	 * @return Method 설명 : 투표 화면단
	 */
	@RequestMapping(value= "/vote")
	public String voteView() {
		return "vote/vote";
	}
}