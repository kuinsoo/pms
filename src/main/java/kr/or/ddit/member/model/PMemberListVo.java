package kr.or.ddit.member.model;

import org.apache.ibatis.type.Alias;

/**
 * kr.or.ddit.member.model
 * null.java
 * Desc : Project Member List  for Main
 *
 * @Author : Mr.KKu
 * @Date : 2018-12-06 / 오후 7:08
 * @Version :
 */
@Alias("pMemberListVo")
public class PMemberListVo {

	private String member_name;
	private String member_profile;
	private String pmember_member;
	private String pmemberCount;
	private String pmember_position;
	private String project_title;
	private String project_overview;
	private String project_bookmark;
	private String project_id;

	public PMemberListVo() {
	}

	public PMemberListVo(String member_name, String member_profile, String pmember_member, String pmemberCount, String pmember_position, String project_title, String project_overview, String project_bookmark, String project_id) {
		this.member_name = member_name;
		this.member_profile = member_profile;
		this.pmember_member = pmember_member;
		this.pmemberCount = pmemberCount;
		this.pmember_position = pmember_position;
		this.project_title = project_title;
		this.project_overview = project_overview;
		this.project_bookmark = project_bookmark;
		this.project_id = project_id;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_profile() {
		return member_profile;
	}

	public void setMember_profile(String member_profile) {
		this.member_profile = member_profile;
	}

	public String getPmemberCount() {
		return pmemberCount;
	}

	public void setPmemberCount(String pmemberCount) {
		this.pmemberCount = pmemberCount;
	}

	public String getPmember_position() {
		return pmember_position;
	}

	public void setPmember_position(String pmember_position) {
		this.pmember_position = pmember_position;
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

	public String getProject_bookmark() {
		return project_bookmark;
	}

	public void setProject_bookmark(String project_bookmark) {
		this.project_bookmark = project_bookmark;
	}

	public String getProject_id() {
		return project_id;
	}

	public void setProject_id(String project_id) {
		this.project_id = project_id;
	}

	public String getPmember_member() {
		return pmember_member;
	}

	public void setPmember_member(String pmember_member) {
		this.pmember_member = pmember_member;
	}
}
