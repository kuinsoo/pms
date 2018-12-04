package kr.or.ddit.member.web;

import kr.or.ddit.member.model.MemberVo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;

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


	@RequestMapping(value = "/testPage",method = RequestMethod.GET)
	public String testPage(Model model, @SessionAttribute("memberVo") MemberVo memberVo) {
		model.addAttribute("test",memberVo.getMember_name());
		return "testPage";
	}
}
