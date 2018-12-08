package kr.or.ddit.member.web;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.or.ddit.member.model.MemberVo;
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
	 * Method 설명 : 마이페이지 
	 * @return
	 */
	@RequestMapping(value="/memberDetail",method = RequestMethod.GET)
	public String memberDetail(Model model, @SessionAttribute("memberVo")MemberVo memberVo) {
		
		memberservice.selectUser(memberVo.getMember_mail());
		
		return "/member/detail";
		
	}
	@RequestMapping(value="/memberDetailUpdate",method = RequestMethod.GET)
	public String memberDetailUpdate(Model model, @SessionAttribute("memberVo")MemberVo memberVo , HttpServletRequest request) {
		
		String member_tel = request.getParameter("member_tel");
		String member_pass = request.getParameter("member_pass");
		
		memberservice.updateUser(memberVo);
		
		return "/member/detail";
		
	}
}

