package kr.or.ddit.card.model;

import org.apache.ibatis.type.Alias;

/**
 * kr.or.ddit.card
 * null.java
 * Desc : Card value object
 *
 * @Author : Mr.KKu
 * @Date : 2018-11-16 / 오전 10:55
 * @Version :
 */
@Alias("cardVo")
public class CardVo {

	private String wc_id;
	private String wc_work;
	private float wc_index;
	private String wc_group;
	private String work_title;
	private String work_content;
	private String pmember_member;
	private String pmember_project;
	private String member_name;

	public CardVo() {
	}

	public CardVo(String wc_id, String wc_work, float wc_index, String wc_group, String work_title, String work_content, String pmember_member, String pmember_project, String member_name) {
		this.wc_id = wc_id;
		this.wc_work = wc_work;
		this.wc_index = wc_index;
		this.wc_group = wc_group;
		this.work_title = work_title;
		this.work_content = work_content;
		this.pmember_member = pmember_member;
		this.pmember_project = pmember_project;
		this.member_name = member_name;
	}

	public String getWc_id() {
		return wc_id;
	}

	public void setWc_id(String wc_id) {
		this.wc_id = wc_id;
	}

	public String getWc_work() {
		return wc_work;
	}

	public void setWc_work(String wc_work) {
		this.wc_work = wc_work;
	}

	public float getWc_index() {
		return wc_index;
	}

	public void setWc_index(float wc_index) {
		this.wc_index = wc_index;
	}

	public String getWc_group() {
		return wc_group;
	}

	public void setWc_group(String wc_group) {
		this.wc_group = wc_group;
	}

	public String getWork_title() {
		return work_title;
	}

	public void setWork_title(String work_title) {
		this.work_title = work_title;
	}

	public String getWork_content() {
		return work_content;
	}

	public void setWork_content(String work_content) {
		this.work_content = work_content;
	}

	public String getPmember_member() {
		return pmember_member;
	}

	public void setPmember_member(String pmember_member) {
		this.pmember_member = pmember_member;
	}

	public String getPmember_project() {
		return pmember_project;
	}

	public void setPmember_project(String pmember_project) {
		this.pmember_project = pmember_project;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
}
