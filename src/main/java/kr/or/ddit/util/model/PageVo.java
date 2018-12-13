package kr.or.ddit.util.model;

import org.apache.ibatis.type.Alias;

@Alias("pageVo")
public class PageVo {
	
	private int page;
	private int pageSize;
	private String member_mail;
	
	// 마이페이지 검색부분 
	private String searchText;
	private String searchBookText;
	
	public String getSearchText() {
		return searchText;
	}
	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}
	
	public String getSearchBookText() {
		return searchBookText;
	}
	public void setSearchBookText(String searchBookText) {
		this.searchBookText = searchBookText;
	}
	public String getMember_mail() {
		return member_mail;
	}
	public void setMember_mail(String member_mail) {
		this.member_mail = member_mail;
	}
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
	
	public PageVo() {
	}

	@Override
	public String toString() {
		return "PageVo [member_mail=" + member_mail + ", page=" + page + ", pageSize=" + pageSize + "]";
	}
	
}
