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
import kr.or.ddit.message.service.MessageServiceInf;
import kr.or.ddit.post.model.PostVo;
import kr.or.ddit.post.service.PostServiceInf;
import kr.or.ddit.project.model.ProjectVo;
import kr.or.ddit.util.model.PageVo;
import kr.or.ddit.work.service.WorkServiceInf;

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
	
	@Autowired
	private WorkServiceInf workService;
	
	@Autowired
	private MessageServiceInf messageService;
	
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
	* Method 설명 : 게시글 리스트 조회
	*/
	@RequestMapping(value="/noticeList", method= {RequestMethod.POST, RequestMethod.GET})
	public String noticeList(Model model, PageVo pageVo, @SessionAttribute("memberVo") MemberVo memberVo){
		
		pageVo.setMember_mail(memberVo.getMember_mail());

		List<PostVo> noticeList = postService.getPostPageList(pageVo);
		
		Map<String, Object> noticeMap = new HashMap<>();
		int pageCnt = postService.totalPostCnt();
		
		noticeMap.put("noticeList", noticeList);
		noticeMap.put("pageCnt", (int)Math.ceil((double)pageCnt/pageVo.getPageSize()));
		
		model.addAttribute("noticeMap", noticeMap);
		
		/* 알림기능 - IKS */
		model.addAttribute("pageCnt", postService.totalPostCnt());
		model.addAttribute("workMemberTotalCnt", workService.workMemberTotalCnt(memberVo.getMember_mail()));
		model.addAttribute("totalMsgReceived", messageService.totalMsgReceived(memberVo.getMember_mail()));
		
		return "notice/noticeList";
	}
	
	/**
	* Method : noticePaging
	* 작성자 : iks
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 게시글 페이징
	*/
	@RequestMapping(value="/noticePaging", method={RequestMethod.POST, RequestMethod.GET})
	public String noticePaging(Model model, PageVo pageVo, @SessionAttribute("memberVo") MemberVo memberVo) {
		
		pageVo.setMember_mail(memberVo.getMember_mail());

		List<PostVo> noticeList = postService.getPostPageList(pageVo);
		
		Map<String, Object> noticeMap = new HashMap<>();
		int pageCnt = postService.totalPostCnt();
		
		noticeMap.put("noticeList", noticeList);
		noticeMap.put("pageCnt", (int)Math.ceil((double)pageCnt/pageVo.getPageSize()));
		
		model.addAttribute("noticeMap", noticeMap);
		
		/* 알림기능 - IKS */
		model.addAttribute("pageCnt", postService.totalPostCnt());
		model.addAttribute("workMemberTotalCnt", workService.workMemberTotalCnt(memberVo.getMember_mail()));
		model.addAttribute("totalMsgReceived", messageService.totalMsgReceived(memberVo.getMember_mail()));
		
		return "notice/noticePaging";
	}
	
	/**
	* Method : noticeViews
	* 작성자 : iks
	* 변경이력 :
	* @param postVo
	* @return
	* Method 설명 : 공지사항 게시글 상세조회
	*/
	@RequestMapping(value="/noticeView", method= {RequestMethod.POST, RequestMethod.GET})
	public String noticeViews(String post_id, Model model, @SessionAttribute("memberVo") MemberVo memberVo) {
		
		PostVo postVo = postService.selectAdmin(post_id);
		model.addAttribute("postVo", postVo);
		
		/* 알림기능 - IKS */
		model.addAttribute("pageCnt", postService.totalPostCnt());
		model.addAttribute("workMemberTotalCnt", workService.workMemberTotalCnt(memberVo.getMember_mail()));
		model.addAttribute("totalMsgReceived", messageService.totalMsgReceived(memberVo.getMember_mail()));
		
		return "notice/noticeView";
	}
	
	/**
	* Method : guideList
	* 작성자 : iks
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 가이드 게시글 리스트 조회
	*/
	@RequestMapping(value="/guideList", method= {RequestMethod.POST, RequestMethod.GET})
	public String guideList(Model model, PageVo pageVo, @SessionAttribute("memberVo") MemberVo memberVo){
		
		pageVo.setMember_mail(memberVo.getMember_mail());

		List<PostVo> guideList = postService.getPostPageListGuide(pageVo);
		
		Map<String, Object> guideMap = new HashMap<>();
		int pageCnt = postService.totalPostCntGuide();
		
		guideMap.put("guideList", guideList);
		guideMap.put("pageCnt", (int)Math.ceil((double)pageCnt/pageVo.getPageSize()));
		
		model.addAttribute("guideMap", guideMap);
		
		/* 알림기능 - IKS */
		model.addAttribute("pageCnt", postService.totalPostCnt());
		model.addAttribute("workMemberTotalCnt", workService.workMemberTotalCnt(memberVo.getMember_mail()));
		model.addAttribute("totalMsgReceived", messageService.totalMsgReceived(memberVo.getMember_mail()));
		
		return "guide/guideList";
	}
	
	/**
	* Method : guidePaging
	* 작성자 : iks
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 가이드 게시글 페이징
	*/
	@RequestMapping(value="/guidePaging", method={RequestMethod.POST, RequestMethod.GET})
	public String guidePaging(Model model, PageVo pageVo, @SessionAttribute("memberVo") MemberVo memberVo) {
		
		pageVo.setMember_mail(memberVo.getMember_mail());

		List<PostVo> guideList = postService.getPostPageListGuide(pageVo);
		
		Map<String, Object> guideMap = new HashMap<>();
		int pageCnt = postService.totalPostCntGuide();
		
		guideMap.put("guideList", guideList);
		guideMap.put("pageCnt", (int)Math.ceil((double)pageCnt/pageVo.getPageSize()));
		
		model.addAttribute("guideMap", guideMap);
		
		/* 알림기능 - IKS */
		model.addAttribute("pageCnt", postService.totalPostCnt());
		model.addAttribute("workMemberTotalCnt", workService.workMemberTotalCnt(memberVo.getMember_mail()));
		model.addAttribute("totalMsgReceived", messageService.totalMsgReceived(memberVo.getMember_mail()));
		
		return "guide/guidePaging";
	}
	
	/**
	* Method : guideViews
	* 작성자 : iks
	* 변경이력 :
	* @param postVo
	* @return
	* Method 설명 : 가이드 게시글 상세조회
	*/
	@RequestMapping(value="/guideView", method= {RequestMethod.POST, RequestMethod.GET})
	public String guideViews(String post_id, Model model, @SessionAttribute("memberVo") MemberVo memberVo) {
		
		PostVo postVo = postService.selectAdminGuide(post_id);
		model.addAttribute("postVo", postVo);
		
		/* 알림기능 - IKS */
		model.addAttribute("pageCnt", postService.totalPostCnt());
		model.addAttribute("workMemberTotalCnt", workService.workMemberTotalCnt(memberVo.getMember_mail()));
		model.addAttribute("totalMsgReceived", messageService.totalMsgReceived(memberVo.getMember_mail()));
		
		return "guide/guideView";
	}
}