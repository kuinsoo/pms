package kr.or.ddit.authority.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.authority.mapper.AuthorityMapper;
import kr.or.ddit.authority.model.AuthorityVo;
import kr.or.ddit.member.mapper.MemberMapper;
import kr.or.ddit.member.model.MemberVo;

/**
 * kr.or.ddit.authority.service
 * null.java
 * Desc : 권한 서비스
 *
 * @Author : Mr.KKu
 * @Date : 2018-11-27 / 오후 2:35
 * @Version :
 */
@Service
@Transactional
public class AuthorityService implements AuthorityServiceInf{
	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private AuthorityMapper authorityMapper;
	
	@Override
	public int insertUserMember(AuthorityVo authVo, MemberVo memberVo) {
		memberMapper.insertUser(memberVo);
		return authorityMapper.insertUserMember(authVo);
	}

}
