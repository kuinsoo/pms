package kr.or.ddit.qna.web;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.member.web.LoginController;
import kr.or.ddit.post.model.PostPageVo;
import kr.or.ddit.post.model.PostVo;
import kr.or.ddit.post.service.PostServiceInf;

/**
 * kr.or.ddit.qna.web
 * null.java
 * Desc : Q&A 컨트롤러
 *
 * @Author : iks
 * @Date : 2018-12-12 / 오후 6:59
 * @Version :
 */
@Controller
public class QnAController {
	@Autowired
	private PostServiceInf postService;
	
	Logger logger = LoggerFactory.getLogger(QnAController.class);
	
	/**
	 * Method : qnaView
	 * 작성자 : 변찬우 
	 * 변경이력 :
	 *
	 * @return Method 설명 : Q&A 글 목록 
	 */
	@RequestMapping(value= "/qnaList") 
	public String qnaView() {
		
		return "qna/qnaList";
	}

	
	@RequestMapping(value= "/qnaListAjax", method= {RequestMethod.GET,RequestMethod.POST})
	public String qnaListAjax(PostPageVo postPageVo, Model model) {
		
		List<PostVo> postVoList = postService.qnaPostList(postPageVo);
		
		model.addAttribute("postVoList", postVoList);

		return "qna/qnaListAjax";
	}
	
	
	@RequestMapping(value= "/qnaPagingAjax", method= {RequestMethod.GET,RequestMethod.POST})
	public String qnaPagingAjax(PostPageVo postPageVo, Model model) {
		
		int postListCnt = postService.postListCnt(postPageVo);
		System.out.println("*** : " + postListCnt);
		
		List<PostVo> postVoList = postService.qnaPostList(postPageVo);
		System.out.println("*** : " + postVoList);
		
		model.addAttribute("postListCnt", (int)Math.ceil((double)postListCnt/ postPageVo.getPostCnt()));
		model.addAttribute("postVoList", postVoList);

		return "qna/qnaPagingAjax";
	}
	
	
	/**
	 * Method : qnaFormView
	 * 작성자 : 변찬우 
	 * 변경이력 :
	 *
	 * @return Method 설명 : Q&A 글 상세 
	 */
	@RequestMapping(value= "/qnaDetail")
	public String qnaDtailView() {
		return "qna/qnaDetail";
	}
	
	
	/**
	 * Method : qnaFormView
	 * 작성자 : 변찬우 
	 * 변경이력 :
	 *
	 * @return Method 설명 : Q&A 글 작성 
	 */
	@RequestMapping(value= "/qnaForm")
	public String qnaFormView() {
		return "qna/qnaForm";
	}
	
	
	/**
	 * Method : /qnaModyView
	 * 작성자 : 변찬우 
	 * 변경이력 :
	 *
	 * @return Method 설명 : Q&A 글 수정 
	 */
	@RequestMapping(value= "/qnaMody")
	public String qnaModyView() {
		return "qna/qnaMody";
	}	
	
	
	/**
	 * Method : /qnaDel 처리 
	 * 작성자 : 변찬우 
	 * 변경이력 :
	 *
	 * @return Method 설명 : Q&A  글 삭제 
	 */
	@RequestMapping(value= "/qnaDel")
	public String qnaDelView() {
		return "qna/qnaList";
	}
	
	
	/**
	 * Method : /qnaReplyView 
	 * 작성자 : 변찬우 
	 * 변경이력 :
	 *
	 * @return Method 설명 : Q&A  답글  
	 */
	@RequestMapping(value= "/qnaReply")
	public String qnaReplyView() {
		return "qna/qnaForm";
	}
}