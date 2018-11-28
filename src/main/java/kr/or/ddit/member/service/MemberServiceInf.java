package kr.or.ddit.member.service;

import kr.or.ddit.member.model.MemberVo;

public interface MemberServiceInf {

	/**
	 * Method : seletUser
	 * 작성자 : 나진실
	 * 변경이력 :
	 * @param member_mail
	 * @return
	 * Method 설명 : 로그인 - 회원 아이디 가져오는 
	 */
	MemberVo seletUser(String member_mail);
}
