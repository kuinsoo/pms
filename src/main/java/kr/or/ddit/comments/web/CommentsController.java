package kr.or.ddit.comments.web;

import kr.or.ddit.comments.model.CommentsVo;
import kr.or.ddit.comments.service.CommentsServiceInf;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.work.service.WorkServiceInf;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

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

	@RequestMapping(value = "/ajaxInsertCmt", method = RequestMethod.GET)
	public String ajaxInsertCmt(Model model, CommentsVo cmtVo, @SessionAttribute("memberVo")MemberVo memberVo,
								@RequestParam("project_id")String project_id,@RequestParam("work_id")String work_id,
								@RequestParam("cmt_content")String cmt_content){
		cmtVo.setCmt_member(memberVo.getMember_mail());
		cmtVo.setCmt_content(cmt_content);
		cmtVo.setCmt_work(work_id);
		commentsService.insertCmt(cmtVo);

		Map<String, String> mapWork = new HashMap<>();
		mapWork.put("member_mail", memberVo.getMember_mail());
		mapWork.put("project_id", project_id);
		model.addAttribute("workList",workService.selectWorks(mapWork));
		model.addAttribute("cmtList", commentsService.cmtList(project_id));
	return "work/ajaxCreateWork";
	}
}
