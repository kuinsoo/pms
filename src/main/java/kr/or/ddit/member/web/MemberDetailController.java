package kr.or.ddit.member.web;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

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
	
	@RequestMapping(value="/memberUpdate",method = RequestMethod.GET)
	public String memberUpdate(Model model, @SessionAttribute("memberVo")MemberVo memberVo) {
		
		memberservice.selectUser(memberVo.getMember_mail());
		model.addAttribute("memberVo",memberVo);
		return "/member/update";
	}
	
	
	 
	@RequestMapping(value="/memberDetailUpdate", method=RequestMethod.POST)
	public String memberDetailUpdate(Model model, @SessionAttribute("memberVo")MemberVo memberVo,
		@RequestPart("member_profile") MultipartFile part, HttpServletRequest request) {
		
		try {
			if(part.getSize()>0) {
				String path = request.getServletContext().getRealPath("/profile");
				
				String fileName = part.getOriginalFilename();
				
				part.transferTo(new File(path + File.separator + fileName));
							
				// profile
				memberVo.setMember_profile("/member_profile/"+fileName);
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		int updateUser = memberservice.updateUser(memberVo);
		
		model.addAttribute("memberVo",memberVo);
		
		return "redirect:/memberDetail?member_mail="+memberVo.getMember_mail();
	}
}

