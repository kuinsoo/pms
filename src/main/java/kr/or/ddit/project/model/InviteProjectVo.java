package kr.or.ddit.project.model;

import org.apache.ibatis.type.Alias;

/**
 * kr.or.ddit.project.model
 * null.java
 * Desc : 초대 받은 프로젝트 VO
 *
 * @Author : Mr.KKu
 * @Date : 2018-12-07 / 오후 2:51
 * @Version :
 */
@Alias("inviteProjectVo")
public class InviteProjectVo {

	private String member_mail;
	private String member_name;
	private String project_id;
	private String project_invite;
	private String project_title;
	private String project_overview;

	public InviteProjectVo() {
	}

	public InviteProjectVo(String member_mail, String project_id, String project_invite) {
		this.member_mail = member_mail;
		this.project_id = project_id;
		this.project_invite = project_invite;
	}

	public String getMember_mail() {
		return member_mail;
	}

	public void setMember_mail(String member_mail) {
		this.member_mail = member_mail;
	}

	public String getProject_id() {
		return project_id;
	}

	public void setProject_id(String project_id) {
		this.project_id = project_id;
	}

	public String getProject_invite() {
		return project_invite;
	}

	public void setProject_invite(String project_invite) {
		this.project_invite = project_invite;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getProject_title() {
		return project_title;
	}

	public void setProject_title(String project_title) {
		this.project_title = project_title;
	}

	public String getProject_overview() {
		return project_overview;
	}

	public void setProject_overview(String project_overview) {
		this.project_overview = project_overview;
	}
}
