package kr.or.ddit.commons.web;

import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.member.service.MemberServiceInf;
import kr.or.ddit.post.service.PostServiceInf;
import kr.or.ddit.message.model.MessageVo;
import kr.or.ddit.message.service.MessageServiceInf;
import kr.or.ddit.project.service.ProjectServiceInf;
import kr.or.ddit.util.model.PageVo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class MainController {

	@Autowired
	private MemberServiceInf memberService;

	@Autowired
	private ProjectServiceInf projectService;
	
	@Autowired
	private PostServiceInf postService;

	/**
	 * Main string.
	 * 작성자: Mr.KKu
	 * 변경이력:
	 *
	 * @param model    the model
	 * @param memberVo the member vo
	 * @return the string
	 * 설명: 메인화면에 프로젝트리스트를 출력해준다. (Member / Project / project_member  Join)
	 */
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(Model model, @SessionAttribute("memberVo") MemberVo memberVo) {

		int pageCnt = postService.totalPostCnt();
		
		model.addAttribute("pMemberList", memberService.selectMainView(memberVo.getMember_mail()));
		model.addAttribute("inviteProjectList", memberService.selectInviteProject(memberVo.getMember_mail()));
		
		model.addAttribute("pageCnt", pageCnt);
		
		// model.addAttribute("workMemberList", workService.workMember(memberVo.getMember_mail()));
		return "main/main";
	}
	
	@RequestMapping(value="/inviteProject", method=RequestMethod.GET)
	public String inviteProject(Model model, @SessionAttribute("memberVo")MemberVo memberVo, @RequestParam("project_id")String project_id) {
		
		Map<String, String > inviteMap = new HashMap<>();
		model.addAttribute("project_id", project_id);
		inviteMap.put("project_id",project_id);
		inviteMap.put("member_mail", memberVo.getMember_mail());
		
		model.addAttribute("inviteProjectList", memberService.selectInviteProjectMap(inviteMap));
		return "main/inviteProject";
	}

	@RequestMapping(value = "/favorites", method = RequestMethod.GET)
	public String favorites(Model model,@SessionAttribute("memberVo")MemberVo memberVo) {

		model.addAttribute("pMemberList", projectService.bookMarkProjects(memberVo.getMember_mail()));
		return "main/favoriteMain";
	}
}
