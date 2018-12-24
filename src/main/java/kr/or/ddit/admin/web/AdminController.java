package kr.or.ddit.admin.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * kr.or.ddit.admin.web
 * null.java
 * Desc : 관리자 컨트롤러
 *
 * @Author : iks
 * @Date : 2018-12-24 / 오후 4:07
 * @Version :
 */
@Controller
public class AdminController {
	
	Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	/**
	 * Method : adminView
	 * 작성자 : iks
	 * 변경이력 :
	 *
	 * @return Method 설명 : 관리자 VIEW
	 */
	@RequestMapping(value="/admin")
	public String adminView() {
		return "admin/admin";
	}
	
	/**
	 * Method : adminCreateView
	 * 작성자 : iks
	 * 변경이력 :
	 *
	 * @return Method 설명 : 관리자 공지사항 작성 VIEW
	 */
	@RequestMapping(value="/adminCreate")
	public String adminCreateView() {
		return "admin/adminCreate";
	}
}