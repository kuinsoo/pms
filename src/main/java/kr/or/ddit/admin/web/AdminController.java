package kr.or.ddit.admin.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.post.model.PostVo;
import kr.or.ddit.post.service.PostServiceInf;
import kr.or.ddit.util.model.PageVo;

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
	
	@Autowired
	private PostServiceInf postService;
	
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
	
	/**
	* Method : noticeList
	* 작성자 : iks
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 게시글 리스트 조회
	*/
	@RequestMapping(value="/adminList", method= {RequestMethod.POST, RequestMethod.GET})
	public String adminList(Model model, PageVo pageVo, @SessionAttribute("memberVo") MemberVo memberVo){
		
		pageVo.setMember_mail(memberVo.getMember_mail());

		List<PostVo> adminList = postService.getPostPageList(pageVo);
		
		Map<String, Object> adminMap = new HashMap<>();
		int pageCnt = postService.totalPostCnt();
		
		adminMap.put("adminList", adminList);
		adminMap.put("pageCnt", (int)Math.ceil((double)pageCnt/pageVo.getPageSize()));
		
		model.addAttribute("adminMap", adminMap);
		
		return "admin/adminList";
	}
	
	@RequestMapping(value="/adminPaging", method={RequestMethod.POST, RequestMethod.GET})
	public String adminPaging(Model model, PageVo pageVo, @SessionAttribute("memberVo") MemberVo memberVo) {
		
		pageVo.setMember_mail(memberVo.getMember_mail());

		List<PostVo> adminList = postService.getPostPageList(pageVo);
		
		Map<String, Object> adminMap = new HashMap<>();
		int pageCnt = postService.totalPostCnt();
		
		adminMap.put("adminList", adminList);
		adminMap.put("pageCnt", (int)Math.ceil((double)pageCnt/pageVo.getPageSize()));
		
		model.addAttribute("adminMap", adminMap);
		
		return "admin/adminPaging";
	}
}