package kr.or.ddit.favorites.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import kr.or.ddit.member.web.LoginController;

/**
 * kr.or.ddit.favorites.web
 * null.java
 * Desc : 즐겨찾기 컨트롤러
 *
 * @Author : iks
 * @Date : 2018-12-13 / 오전 10:30
 * @Version :
 */
@Controller
public class FavoritesController {
	 
	Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	/**
	 * Method : favoritesView
	 * 작성자 : iks
	 * 변경이력 :
	 *
	 * @return Method 설명 : 즐겨찾기 한 프로젝트 화면단
	 */
	@RequestMapping(value= "/favorites")
	public String favoritesView() {
		return "favorites/favorites";
	}
}