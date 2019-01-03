package kr.or.ddit.authority.mapper;

import kr.or.ddit.authority.model.AuthorityVo;

/**
 * kr.or.ddit.authority.mapper
 * null.java
 * Desc : 권한 맵퍼
 *
 * @Author : Mr.KKu
 * @Date : 2018-11-27 / 오후 2:31
 * @Version :
 */

public interface AuthorityMapper {

	
	/**
	 * Method : insertUserMember
	 * 작성자 : pc07
	 * 변경이력 :
	 * @param memberVo
	 * @return
	 * Method 설명 : 회원 권한을 주기위해 
	 */
	public int insertUserMember(AuthorityVo authVo);
	
}
