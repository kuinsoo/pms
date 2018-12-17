package kr.or.ddit.card.web;

import kr.or.ddit.card.model.CardVo;
import kr.or.ddit.card.service.CardServiceInf;
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
	private CardServiceInf cardService;

	@RequestMapping("/updateCard")
	public String updateCard(Model model, @RequestParam("wc_id")int wc_id,
							 @RequestParam("wc_group")String wc_group,
							 @RequestParam("wc_index")float wc_index,
							 @RequestParam("project_id")String project_id){
		/*CardVo cardVo = cardService.selectCard(wc_id);

		cardVo.setWc_id(wc_group);
		cardVo.setWc_index(wc_index);

		cardService.updateCard(cardVo);
		model.addAttribute("wcList",cardService.selectWorkCard(project_id));*/
		return "redirect:/subMain?project_id="+project_id;
	}


//	@RequestMapping(value = "/card", method = RequestMethod.GET)
//	public String selectAllCard(Model model,) {
//		model.addAttribute("cardList",cardService.selectWorkCard(pmember_project));
//
//		return "card/cardChart";
//	}
}
