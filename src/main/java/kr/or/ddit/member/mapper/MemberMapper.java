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
	 * Method 설명 : 로그인
	 */
	MemberVo selectUser(String member_mail);
	
	/**
	 * Method : insertUser
	 * 작성자 : 나진실
	 * 변경이력 :
	 * @param memberVo
	 * @return
	 * Method 설명 : 회원가입
	 */
	public int insertUser(MemberVo memberVo);
	
	
	/**
	 * Method : selectfindId
	 * 작성자 : 나진실
	 * 변경이력 :
	 * @param memberVo
	 * @return
	 * Method 설명 : 아이디(이메일 찾기)
	 */
	MemberVo selectfindId(MemberVo memberVo);
	
	
	/**
	 * Method : selectfindPass
	 * 작성자 : 나진실
	 * 변경이력 :
	 * @param memberVo
	 * @return
	 * Method 설명 : 비밀번호 찾기 
	 */
	MemberVo selectfindPass(MemberVo memberVo);
	
	/**
	 * Method : updatePass
	 * 작성자 : 나진실
	 * 변경이력 :
	 * @param memberVo
	 * @return
	 * Method 설명 : 비밀번호 찾기 - 임시번호 업데이트 
	 */
	public int updatePass(String member_pass);
}
