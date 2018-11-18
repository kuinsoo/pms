package kr.or.ddit.member.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.member.model.MemberVo;

public interface MemberMapper {
	
	public List<MemberVo> selectAllMember();
}
