package kr.or.ddit.member.mapper;

import static org.junit.Assert.*;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import kr.or.ddit.commons.ResetSQL;
import kr.or.ddit.commons.util.KISA_SHA256;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.member.service.MemberServiceInf;

public class MyPageMapperTest extends ResetSQL{

	@Autowired
	private MemberServiceInf memberService;

	
	
	@Test
	public void myPageTest() {
		/*** Given ***/
		MemberVo memberVo = new MemberVo();
		
		String kisa = KISA_SHA256.encrypt("123456"); //toLowerCase :  다 소문자로 DB에 입력 
		memberVo.setMember_pass(kisa);
		
		/*** When ***/
		int update = memberService.updateUser(memberVo);

		/*** Then ***/
		assertEquals(1 , update);
	
	}

}
