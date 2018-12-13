package kr.or.ddit.member.service;

import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.member.model.PMemberListVo;
import kr.or.ddit.member.model.PMemberVo;
import kr.or.ddit.project.model.InviteProjectVo;
import kr.or.ddit.project.model.ProjectVo;
import kr.or.ddit.util.model.PageVo;

import java.util.List;
import java.util.Map;

/**
 * The interface Member service inf.
 */
public interface MemberServiceInf {

	/**
	 * Method : seletUser
	 * 작성자 : 나진실
	 * 변경이력 :
	 *
	 * @param member_mail the member mail
	 * @return Method 설명 : 로그인
	 */
	MemberVo selectUser(String member_mail);

	/**
	 * Method : insertUser 작성자 : pc07 변경이력 :
	 *
	 * @param memberVo the member vo
	 * @return Method 설명 : 회원가입
	 */
	public int insertUser(MemberVo memberVo);

	/**
	 * Method : updateUser 작성자 : 나진실 변경이력 :
	 *
	 * @param
	 * @return Method 설명 : 마이페이지에서 정보 수정
	 */
	public int updateUser(MemberVo memberVo);

	/**
	 * Method : selectfindId 작성자 : pc07 변경이력 :
	 *
	 * @param memberVo the member vo
	 * @return Method 설명 : 아이디(이메일) 찾기
	 */
	MemberVo selectfindId(MemberVo memberVo);

	/**
	 * Method : selectfindPass 작성자 : pc07 변경이력 :
	 *
	 * @param member_mail the member mail
	 * @return Method 설명 : 비밀번호 찾기
	 */
	MemberVo selectfindPass(String member_mail);

	/**
	 * Method : updatePass 작성자 : 나진실 변경이력 :
	 *
	 * @param memberVo the member vo
	 * @return Method 설명 : 비밀번호 찾기 - 임시번호 업데이트
	 */
	int updatePass(MemberVo memberVo);

	/**
	 * Method : myprojectselect 작성자 : pc07 변경이력 :
	 * 
	 * @param pageVo
	 * @param pageVo
	 * @return Method 설명 : 마이페이지 초대받은 프로젝트
	 */
	List<ProjectVo> myprojectselect(PageVo pageVo);

	
	/**
	 * Method : mybookmarkselect
	 * 작성자 : pc07
	 * 변경이력 :
	 * @param pageVo
	 * @return
	 * Method 설명 : 마이페이지 즐겨찾기한 프로젝트 
	 */
	List<ProjectVo> mybookmarkselect(PageVo pageVo);
	
	/**
	 * Method : totalProjectCnt 작성자 : pc07 변경이력 :
	 * 
	 * @return Method 설명 : 프로젝트 건수 조회
	 */
	int totalProjectCnt();

	/**
	 * Select main view list. 작성자 : Mr.KKu 메인 페이지 프로젝트 리스트
	 *
	 * @param member_mail the member mail
	 * @return the list
	 */
	List<PMemberListVo> selectMainView(String member_mail);

	/**
	 * Sets team leader. 작성자 : Mr.KKu 프로젝트 참여자 권한 설정
	 *
	 * @param mapPMember the map p member
	 * @param projectVo  the project vo
	 * @return the team leader
	 */
	int setTeamLeader(Map<String, String> mapPMember, ProjectVo projectVo);

	/**
	 * Invite team int. 작성자 : Mr. KKu 프로젝트 초대 수락시 팀에 포함시킨다.
	 *
	 * @param pMemberVo the p member vo
	 * @return the int
	 */
	int inviteTeam(PMemberVo pMemberVo);

	/**
	 * Invited projects int. 작성자 : Mr.KKu 회원 프로젝트 초대
	 *
	 * @param inviteProjectVo the invite project vo
	 * @return the int
	 */
	int invitedProjects(InviteProjectVo inviteProjectVo);

	/**
	 * Search team member p member vo. 작성자 : Mr.KKu 현재 프로젝트에 포함된 회원인지 검색
	 *
	 * @param pMemberVo the p member vo
	 * @return the p member vo
	 */
	PMemberVo searchTeamMember(PMemberVo pMemberVo);

	/**
	 * Method : searchInviteMember
	 * 작성자 : Mr.KKu
	 * 변경이력 :
	 *
	 * @param pMemberVo the p member vo
	 * @return Method 설명 : 이미 초대된 회원인지 검색
	 */
	InviteProjectVo searchInviteMember(PMemberVo pMemberVo);

	/**
	 * Select invite project list.
	 * 작성자 : Mr.KKu
	 * 초대받은 프로젝트 리스트
	 *
	 * @param member_mail the member mail
	 * @return the list
	 */
	List<InviteProjectVo> selectInviteProject(String member_mail);


	/**
	 * Method : selectInviteProjectMap
	 * 작성자 : Mr.KKu
	 * 변경이력 :
	 * @param map
	 * @return
	 * Method 설명 : 맵방식 초대받은 프로젝트
	 */
	List<InviteProjectVo> selectInviteProjectMap(Map<String, String> map);

	/**
	 * Delete invite project int.
	 * 작성자 : Mr.KKu
	 * 초대받은 프로젝트 리스트에서 삭제
	 *
	 * @param delMap    the del map
	 * @param pMemberVo the p member vo
	 * @return the int
	 */
	int  deleteInviteProject(Map<String, String> delMap, PMemberVo pMemberVo);

	/**
	 * Delete invite project int.
	 * 작성자 : Mr.KKu
	 * 초대받은 프로젝트 리스트에서 삭제
	 *
	 * @param delMap the del map
	 * @return the int
	 */
	int  deleteInviteProject(Map<String, String> delMap);


	/**
	 * Project member list list.
	 * 작성자 : Mr.KKu
	 * 프로젝트 참여자 목록 관리
	 * @param project_id the project id
	 * @return the list
	 */
	List<PMemberListVo> projectMemberList(String project_id);

}
