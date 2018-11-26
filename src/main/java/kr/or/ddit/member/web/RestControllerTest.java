package kr.or.ddit.member.web;


import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.or.ddit.member.model.MemberVo;

import java.util.ArrayList;
import java.util.List;

@RestController
public class RestControllerTest {
	
	@RequestMapping(value="member/{mem_id}", method= RequestMethod.GET)
	public MemberVo detail(@PathVariable("mem_id")String mem_id) {
		List<MemberVo> list = new ArrayList<>();
		MemberVo memberVo = new MemberVo();
		memberVo.setMem_id("brown");
		memberVo.setMem_name("부라우니");
		memberVo.setMem_pass("1234");

		MemberVo memberV1 = new MemberVo();
		memberVo.setMem_id("sally");
		memberVo.setMem_name("샐리");
		memberVo.setMem_pass("1234");

		list.add(memberVo);
		list.add(memberV1);

		
		return memberVo;
	}

}
