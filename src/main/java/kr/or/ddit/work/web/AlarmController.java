package kr.or.ddit.work.web;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.post.model.PostVo;
import kr.or.ddit.post.service.PostServiceInf;
import kr.or.ddit.util.model.PageVo;
import kr.or.ddit.work.model.WorkVo;
import kr.or.ddit.work.service.WorkServiceInf;

/**
 * kr.or.ddit.work.web
 * null.java
 * Desc : 알림 컨트롤러
 *
 * @Author : 임규승
 * @Date : 2018-12-18 / 오후 2:00
 * @Version :
 */
@Controller
public class AlarmController {
	
	Logger logger = LoggerFactory.getLogger(AlarmController.class);
	
	@Autowired
	private WorkServiceInf workService;
	
	@Autowired
	private PostServiceInf postService;
	
	@RequestMapping(value="/ajaxAlarm", method=RequestMethod.GET)
	public String ajaxAlarm(Model model, @SessionAttribute("memberVo") MemberVo memberVo){		
		
		List<WorkVo> workList = workService.workMember(memberVo.getMember_mail());
		
		model.addAttribute("workMemberList", workList);
		
		return "alarm/ajaxAlarm";
	}
	
	/**
	* Method : ajaxNoticeAlarm
	* 작성자 : iks
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 공지 알림 조회
	*/
	@RequestMapping(value="/ajaxNoticeAlarm", method=RequestMethod.GET)
	public String ajaxNoticeAlarm(Model model, PageVo pageVo, @SessionAttribute("memberVo") MemberVo memberVo){		
		
		pageVo.setMember_mail(memberVo.getMember_mail());

		List<PostVo> noticeList = postService.getPostPageList(pageVo);
		
		Map<String, Object> noticeMap = new HashMap<>();
		int pageCnt = postService.totalPostCnt();
		
		noticeMap.put("noticeList", noticeList);
		noticeMap.put("pageCnt", (int)Math.ceil((double)pageCnt/pageVo.getPageSize()));
		
		model.addAttribute("noticeMap", noticeMap);
		model.addAttribute("pageCnt", pageCnt);
		
		return "alarm/ajaxNoticeAlarm";
	}
	
	@RequestMapping(value="/alarm", method=RequestMethod.GET)
	@ResponseBody
	public int alarm(Model model) {
		
		int pageCnt = postService.totalPostCnt();		
		
		return pageCnt;
	}
}