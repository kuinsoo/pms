package kr.or.ddit.member.model;

import org.apache.ibatis.type.Alias;

@Alias("memberVo")
public class MemberVo {

	private String member_mail;
	private String member_pass;
	private String member_tel;
	private String member_name;
	private String member_leader;
	private String member_profile;
	private String member_withrawal;

	public MemberVo() {
	}

	public MemberVo(String member_mail, String member_pass, String member_tel, String member_name, String member_leader, String member_profile, String member_withrawal) {
		this.member_mail = member_mail;
		this.member_pass = member_pass;
		this.member_tel = member_tel;
		this.member_name = member_name;
		this.member_leader = member_leader;
		this.member_profile = member_profile;
		this.member_withrawal = member_withrawal;
	}

	@Override
	public String toString() {
		return "MemberVo{" +
				"member_mail='" + member_mail + '\'' +
				", member_pass='" + member_pass + '\'' +
				", member_tel='" + member_tel + '\'' +
				", member_name='" + member_name + '\'' +
				", member_leader='" + member_leader + '\'' +
				", member_profile='" + member_profile + '\'' +
				", member_withrawal='" + member_withrawal + '\'' +
				'}';
	}

	public String getMember_mail() {
		return member_mail;
	}

	public void setMember_mail(String member_mail) {
		this.member_mail = member_mail;
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

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_leader() {
		return member_leader;
	}

	public void setMember_leader(String member_leader) {
		this.member_leader = member_leader;
	}

	public String getMember_profile() {
		return member_profile;
	}

	public void setMember_profile(String member_profile) {
		this.member_profile = member_profile;
	}

	public String getMember_withrawal() {
		return member_withrawal;
	}

	public void setMember_withrawal(String member_withrawal) {
		this.member_withrawal = member_withrawal;
	}


}
