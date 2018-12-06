package kr.or.ddit.member.model;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * kr.or.ddit.member.model
 * null.java
 * Desc : 프로젝트 회원 VO
 *
 * @Author : Mr.KKu
 * @Date : 2018-12-03 / 오후 7:41
 * @Version :
 */
@Alias("pMemberVo")
public class PMemberVo {

	private String pmember_id;
	private String pmember_project;
	private String pmember_member;
	private String pmember_position;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String pmember_date;

	public PMemberVo() {
	}

	public PMemberVo(String pmember_id, String pmember_project, String pmember_member, String pmember_position, String pmember_date) {
		this.pmember_id = pmember_id;
		this.pmember_project = pmember_project;
		this.pmember_member = pmember_member;
		this.pmember_position = pmember_position;
		this.pmember_date = pmember_date;
	}

	public String getPmember_id() {
		return pmember_id;
	}

	public void setPmember_id(String pmember_id) {
		this.pmember_id = pmember_id;
	}

	public String getPmember_project() {
		return pmember_project;
	}

	public void setPmember_project(String pmember_project) {
		this.pmember_project = pmember_project;
	}

	public String getPmember_member() {
		return pmember_member;
	}

	public void setPmember_member(String pmember_member) {
		this.pmember_member = pmember_member;
	}

	public String getPmember_position() {
		return pmember_position;
	}

	public void setPmember_position(String pmember_position) {
		this.pmember_position = pmember_position;
	}

	public String getPmember_date() {
		return pmember_date;
	}

	public void setPmember_date(String pmember_date) {
		this.pmember_date = pmember_date;
	}
}
