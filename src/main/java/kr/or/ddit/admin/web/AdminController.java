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
	 * Method : adminGuideView
	 * 작성자 : iks
	 * 변경이력 :
	 *
	 * @return Method 설명 : 관리자 가이드 VIEW
	 */
	@RequestMapping(value="/adminGuide")
	public String adminGuideView() {
		return "admin/adminGuide";
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
	 * Method : adminGuideCreateView
	 * 작성자 : iks
	 * 변경이력 :
	 *
	 * @return Method 설명 : 관리자 가이드 작성 VIEW
	 */
	@RequestMapping(value="/adminGuideCreate")
	public String adminGuideCreateView() {
		return "admin/adminGuideCreate";
	}
	
	/**
	 * Method : adminUpdateView
	 * 작성자 : iks
	 * 변경이력 :
	 *
	 * @return Method 설명 : 관리자 공지사항 수정 VIEW
	 */
	@RequestMapping(value="/adminUpdateView", method={RequestMethod.POST, RequestMethod.GET})
	public String adminUpdateView(String post_id, Model model) {
		
		PostVo postVo = postService.selectAdmin(post_id);
		model.addAttribute("postVo", postVo);
		
		return "admin/adminUpdate";
	}
	
	/**
	 * Method : adminGuideUpdateView
	 * 작성자 : iks
	 * 변경이력 :
	 *
	 * @return Method 설명 : 관리자 가이드 수정 VIEW
	 */
	@RequestMapping(value="/adminGuideUpdateView", method={RequestMethod.POST, RequestMethod.GET})
	public String adminGuideUpdateView(String post_id, Model model) {
		
		PostVo postVo = postService.selectAdminGuide(post_id);
		model.addAttribute("postVo", postVo);
		
		return "admin/adminGuideUpdate";
	}
	
	/**
	* Method : adminList
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
	
	/**
	* Method : adminPaging
	* 작성자 : iks
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 게시글 페이징
	*/
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
	
	/**
	* Method : adminGuideList
	* 작성자 : iks
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 가이드 게시글 리스트 조회
	*/
	@RequestMapping(value="/adminGuideList", method= {RequestMethod.POST, RequestMethod.GET})
	public String adminGuideList(Model model, PageVo pageVo, @SessionAttribute("memberVo") MemberVo memberVo){
		
		pageVo.setMember_mail(memberVo.getMember_mail());

		List<PostVo> adminGuideList = postService.getPostPageListGuide(pageVo);
		
		Map<String, Object> adminMapGuide = new HashMap<>();
		int pageCnt = postService.totalPostCntGuide();
		
		adminMapGuide.put("adminGuideList", adminGuideList);
		adminMapGuide.put("pageCntGuide", (int)Math.ceil((double)pageCnt/pageVo.getPageSize()));
		
		model.addAttribute("adminMapGuide", adminMapGuide);
		
		return "admin/adminGuideList";
	}
	
	/**
	* Method : adminGuidePaging
	* 작성자 : iks
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 가이드 게시글 페이징
	*/
	@RequestMapping(value="/adminGuidePaging", method={RequestMethod.POST, RequestMethod.GET})
	public String adminGuidePaging(Model model, PageVo pageVo, @SessionAttribute("memberVo") MemberVo memberVo) {
		
		pageVo.setMember_mail(memberVo.getMember_mail());

		List<PostVo> adminGuideList = postService.getPostPageListGuide(pageVo);
		
		Map<String, Object> adminMapGuide = new HashMap<>();
		int pageCnt = postService.totalPostCntGuide();
		
		adminMapGuide.put("adminGuideList", adminGuideList);
		adminMapGuide.put("pageCntGuide", (int)Math.ceil((double)pageCnt/pageVo.getPageSize()));
		
		model.addAttribute("adminMapGuide", adminMapGuide);
		
		return "admin/adminGuidePaging";
	}
	
	/**
	* Method : adminInsert
	* 작성자 : iks
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 게시글 등록
	*/
	@RequestMapping(value="/adminInsert", method={RequestMethod.POST, RequestMethod.GET})
	public String adminInsert(PostVo postVo) {
		
		Map<String, Object> adminInsert = new HashMap<>();
		
		adminInsert.put("post_title", postVo.getPost_title());
		adminInsert.put("post_content", postVo.getPost_content());
		
		postService.insertNotice(postVo);
		
		return "redirect:/admin";
	}
	
	/**
	* Method : adminUpdate
	* 작성자 : iks
	* 변경이력 :
	* @param postVo
	* @return
	* Method 설명 : 게시글 수정
	*/
	@RequestMapping(value="/adminUpdate", method={RequestMethod.POST, RequestMethod.GET})
	public String adminUpdate(PostVo postVo) {
		
		postService.updateNotice(postVo);
		
		return "redirect:/admin";
	}
	
	/**
	* Method : adminDelete
	* 작성자 : iks
	* 변경이력 :
	* @param postVo
	* @return
	* Method 설명 : 게시글 삭제
	*/
	@RequestMapping(value="/adminDelete", method={RequestMethod.POST, RequestMethod.GET})
	public String adminDelete(PostVo postVo) {
		
		postService.deleteAdmin(postVo.getPost_id());
		
		return "redirect:/admin";
	}
	
	/**
	* Method : adminGuideInsert
	* 작성자 : iks
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 가이드 게시글 등록
	*/
	@RequestMapping(value="/adminInsertGuide", method={RequestMethod.POST, RequestMethod.GET})
	public String adminGuideInsert(PostVo postVo) {
		
		Map<String, Object> adminInsertGuide = new HashMap<>();
		
		adminInsertGuide.put("post_title", postVo.getPost_title());
		adminInsertGuide.put("post_content", postVo.getPost_content());
		
		postService.insertNoticeGuide(postVo);
		
		return "redirect:/adminGuide";
	}
	
	/**
	* Method : adminGuideUpdate
	* 작성자 : iks
	* 변경이력 :
	* @param postVo
	* @return
	* Method 설명 : 가이드 게시글 수정
	*/
	@RequestMapping(value="/adminUpdateGuide", method={RequestMethod.POST, RequestMethod.GET})
	public String adminGuideUpdate(PostVo postVo) {
		
		postService.updateNoticeGuide(postVo);
		
		return "redirect:/adminGuide";
	}
	
	/**
	* Method : adminGuideDelete
	* 작성자 : iks
	* 변경이력 :
	* @param postVo
	* @return
	* Method 설명 : 가이드 게시글 삭제
	*/
	@RequestMapping(value="/adminDeleteGuide", method={RequestMethod.POST, RequestMethod.GET})
	public String adminGuideDelete(PostVo postVo) {
		
		postService.deleteAdminGuide(postVo.getPost_id());
		
		return "redirect:/adminGuide";
	}
}