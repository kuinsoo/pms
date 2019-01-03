package kr.or.ddit.authority.service;

import kr.or.ddit.authority.model.AuthorityVo;
import kr.or.ddit.member.model.MemberVo;

/**
 * kr.or.ddit.authority.service
 * null.java
 * Desc : 권한 서비스 인터페이스
 *
 * @Author : Mr.KKu
 * @Date : 2018-11-27 / 오후 2:36
 * @Version :
 */
public interface AuthorityServiceInf {
	
	/**
	 * Method : insertUserMember
	 * 작성자 : pc07
	 * 변경이력 :
	 * @param memberVo
	 * @return
	 * Method 설명 : 회원 권한을 주기위해 
	 */

	int insertUserMember(AuthorityVo authVo, MemberVo memberVo);	
	
}
