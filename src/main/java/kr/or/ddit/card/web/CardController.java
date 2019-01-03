package kr.or.ddit.card.web;

import kr.or.ddit.card.model.CardVo;
import kr.or.ddit.card.service.CardServiceInf;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.message.service.MessageServiceInf;
import kr.or.ddit.post.service.PostServiceInf;
import kr.or.ddit.project.model.ProjectVo;
import kr.or.ddit.project.service.ProjectServiceInf;
import kr.or.ddit.work.service.WorkServiceInf;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.slf4j.spi.LoggerFactoryBinder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * kr.or.ddit.card.web
 * null.java
 * Desc : card Controller
 *
 * @Author : Mr.KKu
 * @Date : 2018-11-16 / 오후 9:29
 * @Version :
 */
@Controller
public class CardController {

	@Autowired
	private PostServiceInf postService;
	
	@Autowired
	private WorkServiceInf workService;
	
	@Autowired
	private MessageServiceInf messageService;

	@Autowired
	private CardServiceInf cardService;

	@Autowired
	private ProjectServiceInf projectService;

	@RequestMapping("/ajaxUpdateCard")
	public String updateCard(Model model, @RequestParam("wc_id")String wc_id,
							 @RequestParam("wc_group")String wc_group,
							 @RequestParam("wc_index")float wc_index,
							 @RequestParam("project_id")String project_id, MemberVo memberVo){
		if(wc_id.equals('0') || wc_group.equals('0') || wc_index == 0) {

		} else {
			CardVo cardVo = cardService.selectCard(wc_id);
			cardVo.setWc_group(wc_group);
			cardVo.setWc_index(wc_index);
			cardService.updateCard(cardVo);
		}

		ProjectVo projectVo =  projectService.selectProject(project_id);
		/* 프로젝트 객체  */
		model.addAttribute("projectVo", projectVo);
		model.addAttribute("wcList",cardService.selectWorkCard(project_id));
		
		/* 알림기능 - IKS */
		model.addAttribute("pageCnt", postService.totalPostCnt());
		model.addAttribute("workMemberTotalCnt", workService.workMemberTotalCnt(memberVo.getMember_mail()));
		model.addAttribute("totalMsgReceived", messageService.totalMsgReceived(memberVo.getMember_mail()));
		
		return "card/cardChart";
	}


//	@RequestMapping(value = "/card", method = RequestMethod.GET)
//	public String selectAllCard(Model model,) {
//		model.addAttribute("cardList",cardService.selectWorkCard(pmember_project));
//
//		return "card/cardChart";
//	}
}
