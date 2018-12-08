package kr.or.ddit.member.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.member.service.MemberServiceInf;


/**
 * MemberDetailController.java : 마이페이지 
 *
 * @author 나진실
 * @version 1.0
 * @see
 */
@Controller
public class MemberDetailController {
	Logger logger = LoggerFactory.getLogger(MemberDetailController.class);

	@Autowired
	private MemberServiceInf memberservice;


	/**
	 * Method : memberDetail
	 * 작성자 : 나진실
	 * 변경이력 :
	 * @return
	 * Method 설명 : 마이페이지 
	 */
	@RequestMapping(value="/memberDetail")
	public String memberDetail() {
		return "/member/detail";
		
	}
}

