package kr.or.ddit.member.mapper;

import kr.or.ddit.member.model.MemberVo;

/**
 * kr.or.ddit.member.service
 * null.java
 * Desc : 회원 맵퍼
 *
 * @Author : Mr.KKu
 * @Date : 2018-11-27 / 오후 3:09
 * @Version :
 */
public interface MemberMapper {
	
	/**
	 * Method : seletUser
	 * 작성자 : 나진실
	 * 변경이력 :
	 * @param member_mail
	 * @return
	 * Method 설명 : 로그인 - 회원 아이디 가져오는 
	 */
	MemberVo selectUser(String member_mail);
}
