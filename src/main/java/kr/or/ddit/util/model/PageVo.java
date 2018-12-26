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
	private String searchTodoText;
	private String searchEndText;
	private String searchTextFriend;
	private String searchTextFriendList;
	private String searchTextMySendFriendList;
	private String searchTextyouGiveFriendList;
	


	@Override
	public String toString() {
		return "PageVo [page=" + page + ", pageSize=" + pageSize + ", member_mail=" + member_mail + ", searchText="
				+ searchText + ", searchBookText=" + searchBookText + ", searchTodoText=" + searchTodoText
				+ ", searchEndText=" + searchEndText + ", searchTextFriend=" + searchTextFriend
				+ ", searchTextFriendList=" + searchTextFriendList + ", searchTextMySendFriendList="
				+ searchTextMySendFriendList + ", searchTextyouGiveFriendList=" + searchTextyouGiveFriendList + "]";
	}
	
	public String getSearchTextyouGiveFriendList() {
		return searchTextyouGiveFriendList;
	}
	
	
	public void setSearchTextyouGiveFriendList(String searchTextyouGiveFriendList) {
		this.searchTextyouGiveFriendList = searchTextyouGiveFriendList;
	}
	
	public String getSearchTextMySendFriendList() {
		return searchTextMySendFriendList;
	}


	public void setSearchTextMySendFriendList(String searchTextMySendFriendList) {
		this.searchTextMySendFriendList = searchTextMySendFriendList;
	}


	public String getSearchTextFriendList() {
		return searchTextFriendList;
	}
	public void setSearchTextFriendList(String searchTextFriendList) {
		this.searchTextFriendList = searchTextFriendList;
	}
	public String getSearchTextFriend() {
		return searchTextFriend;
	}
	public void setSearchTextFriend(String searchTextFriend) {
		this.searchTextFriend = searchTextFriend;
	}

	public String getSearchEndText() {
		return searchEndText;
	}
	public void setSearchEndText(String searchEndText) {
		this.searchEndText = searchEndText;
	}
	public String getSearchTodoText() {
		return searchTodoText;
	}
	public void setSearchTodoText(String searchTodoText) {
		this.searchTodoText = searchTodoText;
	}
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
	
}
