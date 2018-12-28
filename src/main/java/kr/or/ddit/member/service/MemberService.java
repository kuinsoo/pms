package kr.or.ddit.member.service;

import kr.or.ddit.attachment.model.AttachmentVo;
import kr.or.ddit.member.mapper.MemberMapper;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.member.model.PMemberListVo;
import kr.or.ddit.member.model.PMemberVo;
import kr.or.ddit.project.model.InviteProjectVo;
import kr.or.ddit.project.model.ProjectVo;
import kr.or.ddit.project.service.ProjectServiceInf;
import kr.or.ddit.todo.model.ToDoVo;
import kr.or.ddit.util.model.PageVo;

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
	 * Method : updateUser
	 * 작성자 : 나진실
	 * 변경이력 :
	 * @param memberVo
	 * @return
	 * Method 설명 : 마이페이지에서 정보 수정
	 */
	@Override
	public int updateUser(MemberVo memberVo) {
		return memberMapper.updateUser(memberVo);
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
	 * Method : myprojectselect
	 * 작성자 : 나진실
	 * 변경이력 :
	 * @param pageVo
	 * @return
	 * Method 설명 : 마이페이지 참여중인 프로젝트 리스트
	 */
	@Override
	public List<ProjectVo> myprojectselect(PageVo pageVo) {
		return memberMapper.myprojectselect(pageVo);
	}
	
	/**
	 * Method : myprojectEndselect
	 * 작성자 : 나진실
	 * 변경이력 :
	 * @param pageVo
	 * @return
	 * Method 설명 : 마이페이지 참여했던 프로젝트 리스트
	 */
	@Override
	public List<ProjectVo> myprojectEndselect(PageVo pageVo) {
		return memberMapper.myprojectEndselect(pageVo);
	}


	
	@Override
	public int selectProjectCnt(String member_mail) {
		return memberMapper.selectProjectCnt(member_mail);
	}

	@Override
	public int updateUserwithDrawal(MemberVo memberVo) {
		return memberMapper.updateUserwithDrawal(memberVo);
	}
	/**
	 * Method : mybookmarkselect
	 * 작성자 : 나진실
	 * 변경이력 :
	 * @param pageVo
	 * @return
	 * Method 설명 : 마이페이지 즐겨찾기한 프로젝트 리스트
	 */
	@Override
	public List<ProjectVo> mybookmarkselect(PageVo pageVo) {
		return memberMapper.mybookmarkselect(pageVo);
	}
	
	/**
	 * Method : myTodoselect
	 * 작성자 : 나진실
	 * 변경이력 :
	 * @param pageVo
	 * @return
	 * Method 설명 : 마이페이지 나의 업무 리스트 
	 */
	@Override
	public List<ToDoVo> myTodoselect(PageVo pageVo) {
		return memberMapper.myTodoselect(pageVo);
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
	
	@Override
	public int totalProjectCnt(String member_mail) {
		return memberMapper.totalProjectCnt(member_mail);
	}

	@Override
	public int selectTodoCnt(String member_mail) {
		return memberMapper.selectTodoCnt(member_mail);
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
	
	

	@Override
	public List<InviteProjectVo> selectInviteProjectMap(Map<String, String> map) {
		return memberMapper.selectInviteProjectMap(map);
	}

	/**
	 * Delete invite project int.
	 * 작성자 : Mr.KKu
	 * 초대받은 프로젝트 리스트에서 삭제
	 *
	 * @param delMap    the del map
	 * @param pMemberVo the p member vo
	 * @return the int
	 */
	@Override
	public int deleteInviteProject(Map<String, String> delMap, PMemberVo pMemberVo) {
						memberMapper.inviteTeam(pMemberVo);
		return memberMapper.deleteInviteProject(delMap);
	}

	@Override
	public int deleteInviteProject(Map<String, String > delMap) {
		return memberMapper.deleteInviteProject(delMap);
	}

	

	/**
	 * Project member list list.
	 * 작성자 : Mr.KKu
	 * 프로젝트 참여자 목록 관리
	 * @param project_id the project id
	 * @return the list
	 */
	@Override
	public List<PMemberListVo> projectMemberList(String project_id) {
		return memberMapper.projectMemberList(project_id);
	}

	@Override
	public InviteProjectVo searchInviteMember(PMemberVo pMemberVo) {
		// TODO Auto-generated method stub
		return memberMapper.searchInviteMember(pMemberVo);
	}


	/**
	 * Select bookmark project p member vo.
	 * 작성자 : Mr.KKu
	 * 프로젝트 즐겨 찾기 관리
	 *
	 * @param bookMap the p member vo
	 * @return the p member vo
	 */
	@Override
	public PMemberVo selectBookmarkProject(Map<String, String> bookMap) {
		return memberMapper.selectBookmarkProject(bookMap);
	}

	/**
	 * Update bookmark int.
	 * 작성자 : Mr.KKu
	 * 즐겨찾기 업데이트
	 *
	 * @param pMemberVo the p member vo
	 * @return the int
	 */
	@Override
	public int updateBookmark(PMemberVo pMemberVo) {
		return memberMapper.updateBookmark(pMemberVo);
	}

	@Override
	public ProjectVo selectProjectId(String project_title) {
		return memberMapper.selectProjectId(project_title);
	}

	@Override
	public int totalEndProjectCnt(String member_mail) {
		return memberMapper.totalEndProjectCnt(member_mail);
	}

	@Override
	public List<AttachmentVo> myFileList(PageVo pageVo) {
		return memberMapper.myFileList(pageVo);
	}

	@Override
	public int myFileListCnt(String member_mail) {
		return memberMapper.myFileListCnt(member_mail);
	}

	@Override
	public List<ProjectVo> selectProjectMember(String member_mail) {
		return memberMapper.selectProjectMember(member_mail);
	}

	@Override
	public List<AttachmentVo> myFileListProjectId(PageVo pageVo) {
		return memberMapper.myFileListProjectId(pageVo);
	}

	
}
