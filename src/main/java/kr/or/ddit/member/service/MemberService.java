package kr.or.ddit.member.service;

import kr.or.ddit.member.mapper.MemberMapper;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.member.model.PMemberListVo;
import kr.or.ddit.member.model.PMemberVo;
import kr.or.ddit.project.model.InviteProjectVo;
import kr.or.ddit.project.model.ProjectVo;
import kr.or.ddit.project.service.ProjectServiceInf;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

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

	@Autowired
	private ProjectServiceInf projectService;

	/**
	 * Method : seletUser
	 * 작성자 : 나진실
	 * 변경이력 :
	 * @param member_mail
	 * @return
	 * Method 설명 : 로그인
	 */
	@Override
	public MemberVo selectUser(String member_mail) {
		return memberMapper.selectUser(member_mail);
	}

	/**
	 * Method : insertUser
	 * 작성자 : 나진실
	 * 변경이력 :
	 * @param memberVo
	 * @return
	 * Method 설명 : 회원가입
	 */
	@Override
	public int insertUser(MemberVo memberVo) {
		return memberMapper.insertUser(memberVo);
	}
	
	/**
	 * Method : selectfindId
	 * 작성자 : 나진실
	 * 변경이력 :
	 * @param memberVo
	 * @return
	 * Method 설명 : 아이디 찾기
	 */
	@Override
	public MemberVo selectfindId(MemberVo memberVo) {
		return memberMapper.selectfindId(memberVo);
	}
	
	/**
	 * Method : selectfindPass
	 * 작성자 : 나진실
	 * 변경이력 :
	 * @param member_mail
	 * @return
	 * Method 설명 : 비밀번호 찾기
	 */
	@Override
	public MemberVo selectfindPass(String member_mail) {
		return memberMapper.selectfindPass(member_mail);
	}
	
	/**
	 * Method : selectfindPass
	 * 작성자 : 나진실
	 * 변경이력 :
	 * @param memberVo
	 * @return
	 * Method 설명 : 비밀번호 찾기 - 임시 비밀번호 업데이트 
	 */
	@Override
	public int updatePass(MemberVo memberVo) {
		return memberMapper.updatePass(memberVo);
	}

	/**
	 * Select main view list.
	 * 작성자 : Mr.KKu
	 * 메인 페이지 프로젝트 리스트
	 * @param member_mail the member mail
	 * @return the list
	 */
	@Override
	public List<PMemberListVo> selectMainView(String member_mail) {
		return memberMapper.selectMainView(member_mail);
	}

	/**
	 * Sets team leader.
	 * 작성자 : Mr.KKu
	 * 프로젝트 참여자 권한 설정
	 * @param mapPMember the map p member
	 * @return the team leader
	 */
	@Override
	public int setTeamLeader(Map<String, String> mapPMember, ProjectVo projectVo) {
		projectService.createProject(projectVo);
		return memberMapper.setTeamLeader(mapPMember);
	}

	/**
	 * Invite team int.
	 * 작성자 : Mr. KKu
	 * 프로젝트 초대 수락시 팀에 포함시킨다.
	 *
	 * @param pMemberVo the p member vo
	 * @return the int
	 */
	@Override
	public int inviteTeam(PMemberVo pMemberVo) {
		return memberMapper.inviteTeam(pMemberVo);
	}

	/**
	 * Invited projects int.
	 * 작성자 : Mr.KKu
	 * 회원 프로젝트 초대
	 * @param inviteProjectVo the invite project vo
	 * @return the int
	 */
	@Override
	public int invitedProjects(InviteProjectVo inviteProjectVo) {
		return memberMapper.invitedProjects(inviteProjectVo);
	}

	/**
	 * Search team member p member vo.
	 * 작성자 : Mr.KKu
	 * 현재 프로젝트에 포함된 회원인지 검색
	 * @param pMemberVo the p member vo
	 * @return the p member vo
	 */
	@Override
	public PMemberVo searchTeamMember(PMemberVo pMemberVo) {
		return memberMapper.searchTeamMember(pMemberVo);
	}

	/**
	 * Select invite project list.
	 * 작성자 : Mr.KKu
	 * 초대받은 프로젝트 리스트
	 *
	 * @param member_email the member email
	 * @return the list
	 */
	@Override
	public List<InviteProjectVo> selectInviteProject(String member_email) {
		return memberMapper.selectInviteProject(member_email);
	}

	/**
	 * Delete invite project int.
	 * 작성자 : Mr.KKu
	 * 초대받은 프로젝트 리스트에서 삭제
	 *
	 * @param member_mail the member mail
	 * @return the int
	 */
	@Override
	public int deleteInviteProject(String member_mail, PMemberVo pMemberVo) {
						memberMapper.inviteTeam(pMemberVo);
		return memberMapper.deleteInviteProject(member_mail);
	}

	@Override
	public int deleteInviteProject(String member_mail) {
		return memberMapper.deleteInviteProject(member_mail);
	}
}
