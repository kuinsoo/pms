package kr.or.ddit.member.model;

import kr.or.ddit.project.model.ProjectVo;
import org.apache.ibatis.type.Alias;

import java.util.List;

@Alias("memberVo")
public class MemberVo {
	private String member_mail;
	private String member_name;
	private String member_pass;
	private String member_tel;
	private String member_profile;
	private String member_withdrawal;
	private List<ProjectVo> projectList;
	private int pmemberCount;
	
	@Override
	public String toString() {
		return "MemberVo [member_mail=" + member_mail + ", member_name=" + member_name + ", member_pass=" + member_pass
				+ ", member_tel=" + member_tel + ", member_profile=" + member_profile + ", member_withdrawal="
				+ member_withdrawal + "]";
	}

	public String getMember_mail() {
		return member_mail;
	}

	public void setMember_mail(String member_mail) {
		this.member_mail = member_mail;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_pass() {
		return member_pass;
	}

	public void setMember_pass(String member_pass) {
		this.member_pass = member_pass;
	}

	public String getMember_tel() {
		return member_tel;
	}

	public void setMember_tel(String member_tel) {
		this.member_tel = member_tel;
	}

	public String getMember_profile() {
		return member_profile;
	}

	public void setMember_profile(String member_profile) {
		this.member_profile = member_profile;
	}

	public String getMember_withdrawal() {
		return member_withdrawal;
	}

	public void setMember_withdrawal(String member_withdrawal) {
		this.member_withdrawal = member_withdrawal;
	}

	public MemberVo() {
	}

	public int getPmemberCount() {
		return pmemberCount;
	}

	public void setPmemberCount(int pmemberCount) {
		this.pmemberCount = pmemberCount;
	}

	public List<ProjectVo> getProjectList() {
		return projectList;
	}

	public void setProjectList(List<ProjectVo> projectList) {
		this.projectList = projectList;
	}
}
