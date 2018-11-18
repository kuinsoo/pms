package kr.or.ddit.member.web;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.member.dao.MemberMapper;
import kr.or.ddit.member.model.MemberVo;

@Controller
public class ControllerTest {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private MemberMapper memberMapper;
	
	@RequestMapping("/main")
	public String index(Model model) {
		List<MemberVo> list = memberMapper.selectAllMember();
		logger.info("{}testlist:", list);
		
		model.addAttribute("listAllMember",list);
		model.addAttribute("test", "왜 안나올가요? 리스트");
		
		return "index";
	}
	

}
