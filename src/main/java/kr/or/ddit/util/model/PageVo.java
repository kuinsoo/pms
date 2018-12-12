package kr.or.ddit.util.model;

import org.apache.ibatis.type.Alias;

@Alias("pageVo")
public class PageVo {
	
	private String project_member;
	private String pmember_member;
	private String project_title;
	private String member_mail;
	
	public String getProject_member() {
		return project_member;
	}
	public void setProject_member(String project_member) {
		this.project_member = project_member;
	}
	public String getMember_mail() {
		return member_mail;
	}
	public void setMember_mail(String member_mail) {
		this.member_mail = member_mail;
	}
	public String getProject_title() {
		return project_title;
	}
	public void setProject_title(String project_title) {
		this.project_title = project_title;
	}
	public String getPmember_member() {
		return pmember_member;
	}
	public void setPmember_member(String pmember_member) {
		this.pmember_member = pmember_member;
	}
	
	private int page;
	private int pageSize;
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
	@Override
	public String toString() {
		return "PageVo [project_member=" + project_member + ", pmember_member=" + pmember_member + ", project_title="
				+ project_title + ", member_mail=" + member_mail + ", page=" + page + ", pageSize=" + pageSize + "]";
	}
	public PageVo() {
		
	}
	
}
