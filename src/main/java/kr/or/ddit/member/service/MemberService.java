package kr.or.ddit.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.member.mapper.MemberMapper;
import kr.or.ddit.member.model.MemberVo;

/**
 * kr.or.ddit.member.service
 * null.java
 * Desc : 회원 서비스
 *
 * @Author : Mr.KKu
 * @Date : 2018-11-27 / 오후 3:08
 * @Version :
 */

@Service
@Transactional
public class MemberService implements MemberServiceInf {

	@Autowired
	private MemberMapper memberMapper;

	/**
	 * Method : seletUser
	 * 작성자 : 나진실
	 * 변경이력 :
	 * @param member_mail
	 * @return
	 * Method 설명 : 로그인 - 회원 아이디 가져오는 
	 */
	@Override
	public MemberVo seletUser(String member_mail) {
		return memberMapper.selectUser(member_mail);
	}
	
}
