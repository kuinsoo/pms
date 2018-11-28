package kr.or.ddit.member.service;

import kr.or.ddit.member.model.MemberVo;

public interface MemberServiceInf {

	/**
	 * Method : seletUser
	 * 작성자 : 나진실
	 * 변경이력 :
	 * @param member_mail
	 * @return
	 * Method 설명 : 로그인
	 */
	MemberVo selectUser(String member_mail);
	
	/**
	 * Method : insertUser
	 * 작성자 : pc07
	 * 변경이력 :
	 * @param memberVo
	 * @return
	 * Method 설명 : 회원가입
	 */
	public int insertUser(MemberVo memberVo);
}
