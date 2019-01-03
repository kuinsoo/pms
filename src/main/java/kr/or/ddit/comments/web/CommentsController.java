package kr.or.ddit.comments.web;

import kr.or.ddit.comments.model.CommentsVo;
import kr.or.ddit.comments.service.CommentsServiceInf;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.message.service.MessageServiceInf;
import kr.or.ddit.post.service.PostServiceInf;
import kr.or.ddit.work.service.WorkServiceInf;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

/**
 * kr.or.ddit.comments.web
 * null.java
 * Desc : 댓글 컨트롤러
 *
 * @Author : Mr.KKu
 * @Date : 2018-11-27 / 오후 2:45
 * @Version :
 */
@Controller
public class CommentsController {

	@Autowired
	private CommentsServiceInf commentsService;

	@Autowired
	private WorkServiceInf workService;

	@Autowired
	private PostServiceInf postService;

	@Autowired
	private MessageServiceInf messageService;

	@RequestMapping(value = "/ajaxInsertCmt", method = RequestMethod.GET)
	public String ajaxInsertCmt(Model model, CommentsVo cmtVo, @SessionAttribute("memberVo")MemberVo memberVo,
								@RequestParam("project_id")String project_id,@RequestParam("work_id")String work_id,
								@RequestParam("cmt_content")String cmt_content){
		cmtVo.setCmt_member(memberVo.getMember_mail());
		cmtVo.setCmt_content(cmt_content);
		cmtVo.setCmt_work(work_id);

		Map<String,String> cmtMap = new HashMap<>();
		cmtMap.put("work_project", project_id);
		cmtMap.put("cmt_work", work_id);

		commentsService.insertCmt(cmtVo);
		model.addAttribute("workList",workService.selectWorks(project_id));
		model.addAttribute("cmtList", commentsService.ajaxCmtList(cmtMap));

		/* 알림기능 - IKS */
		model.addAttribute("pageCnt", postService.totalPostCnt());
		model.addAttribute("workMemberTotalCnt", workService.workMemberTotalCnt(memberVo.getMember_mail()));
		model.addAttribute("totalMsgReceived", messageService.totalMsgReceived(memberVo.getMember_mail()));

	return "work/ajaxCmtList";
	}

	@RequestMapping(value = "/deleteCmt", method = RequestMethod.GET)
	public String ajaxInsertCmt(Model model, @RequestParam("project_id")String project_id,
								@RequestParam("cmt_id")String cmt_id,
								@RequestParam("work_id")String work_id, MemberVo memberVo){
		commentsService.deleteCmt(cmt_id);

		Map<String,String> cmtMap = new HashMap<>();
		cmtMap.put("work_project", project_id);
		cmtMap.put("cmt_work", work_id);

		model.addAttribute("workList",workService.selectWorks(project_id));
		model.addAttribute("cmtList", commentsService.ajaxCmtList(cmtMap));

		/* 알림기능 - IKS */
		model.addAttribute("pageCnt", postService.totalPostCnt());
		model.addAttribute("workMemberTotalCnt", workService.workMemberTotalCnt(memberVo.getMember_mail()));
		model.addAttribute("totalMsgReceived", messageService.totalMsgReceived(memberVo.getMember_mail()));

		return "work/ajaxCmtList";
	}

	@RequestMapping(value = "/updateCmt", method = RequestMethod.GET)
	@ResponseBody
	public CommentsVo updateCmt(Model model, @RequestParam("project_id")String project_id,
								CommentsVo cmtVo,
								@RequestParam("work_id")String work_id, MemberVo memberVo){
		commentsService.updateCmt(cmtVo);
/*		Map<String,String> cmtMap = new HashMap<>();
		cmtMap.put("work_project", project_id);
		cmtMap.put("cmt_work", work_id);
		model.addAttribute("workList",workService.selectWorks(project_id));
		model.addAttribute("cmtList", commentsService.ajaxCmtList(cmtMap));*/
        /* 알림기능 - IKS */
        model.addAttribute("pageCnt", postService.totalPostCnt());
        model.addAttribute("workMemberTotalCnt", workService.workMemberTotalCnt(memberVo.getMember_mail()));
        model.addAttribute("totalMsgReceived", messageService.totalMsgReceived(memberVo.getMember_mail()));
        return  cmtVo;



	}



}
