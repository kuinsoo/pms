package kr.or.ddit.post.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.post.model.PostVo;
import kr.or.ddit.post.service.PostServiceInf;
import kr.or.ddit.project.model.ProjectVo;
import kr.or.ddit.util.model.PageVo;

/**
 * kr.or.ddit.post.web
 * null.java
 * Desc : 게시물 컨트롤러
 *
 * @Author : Mr.KKu
 * @Date : 2018-11-27 / 오후 3:21
 * @Version :
 */
@Controller
public class PostController {
	
	Logger logger = LoggerFactory.getLogger(PostController.class);
	
	@Autowired
	private PostServiceInf postService;
	
	@RequestMapping(value="/notice")
	public String noticeView() {
		return "notice/notice";
	}
	
	@RequestMapping(value="/guide")
	public String guideView() {
		return "guide/guide";
	}
	
	/**
	* Method : noticeList
	* 작성자 : iks
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 게시글 페이지 리스트 조회
	*/
	@RequestMapping(value="/noticeList", method=RequestMethod.GET)
	public String noticeList(Model model, PageVo pageVo, @SessionAttribute("memberVo") MemberVo memberVo){
		
		pageVo.setMember_mail(memberVo.getMember_mail());
		
		List<PostVo> noticeList = postService.getPostPageList(pageVo);
		
		Map<String, Object> postMap = new HashMap<>();
		int pageCnt = postService.totalPostCnt();
		
		postMap.put("noticeList", noticeList);
		postMap.put("pageCnt", (int)Math.ceil((double)pageCnt/pageVo.getPageSize()));
		
		model.addAttribute("noticeList", noticeList);
		
		return "notice/noticeList";
	}
	
	/**
	* Method : ajaxNoticeList
	* 작성자 : iks
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 게시글 페이지 리스트 조회
	*/
	@ResponseBody
	@RequestMapping(value="/ajaxNotice", method=RequestMethod.POST)
	public Map<String, Object> ajaxNoticeList(PageVo pageVo){
		
		List<PostVo> noticeList = postService.getPostPageList(pageVo);
		
		Map<String, Object> postMap = new HashMap<>();
		int pageCnt = postService.totalPostCnt();
		
		postMap.put("noticeList", noticeList);
		postMap.put("pageCnt", (int)Math.ceil((double)pageCnt/pageVo.getPageSize()));
		
		return postMap;
	}
	
	/**
	* Method : guideList
	* 작성자 : iks
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 가이드 게시글 페이지 리스트 조회
	*/
	@RequestMapping(value="/guideList", method=RequestMethod.GET)
	public String guideList(Model model, PageVo pageVo, @SessionAttribute("memberVo") MemberVo memberVo){
		
		pageVo.setMember_mail(memberVo.getMember_mail());
		
		List<PostVo> guideList = postService.getPostPageListGuide(pageVo);
		
		Map<String, Object> postMapGuide = new HashMap<>();
		int pageCnt = postService.totalPostCntGuide();
		
		postMapGuide.put("guideList", guideList);
		postMapGuide.put("pageCntGuide", (int)Math.ceil((double)pageCnt/pageVo.getPageSize()));
		
		model.addAttribute("guideList", guideList);
		
		return "guide/guideList";
	}
	
	/**
	* Method : ajaxGuideList
	* 작성자 : iks
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 가이드 게시글 페이지 리스트 조회
	*/
	@ResponseBody
	@RequestMapping(value="/ajaxGuide", method=RequestMethod.POST)
	public Map<String, Object> ajaxGuideList(PageVo pageVo){
		
		List<PostVo> guideList = postService.getPostPageListGuide(pageVo);
		
		Map<String, Object> postMapGuide = new HashMap<>();
		int pageCnt = postService.totalPostCntGuide();
		
		postMapGuide.put("guideList", guideList);
		postMapGuide.put("pageCnt", (int)Math.ceil((double)pageCnt/pageVo.getPageSize()));
		
		return postMapGuide;
	}
	
}