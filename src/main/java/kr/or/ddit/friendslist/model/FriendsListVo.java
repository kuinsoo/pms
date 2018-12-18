package kr.or.ddit.friendslist.model;

import org.apache.ibatis.type.Alias;

/**
 * kr.or.ddit.friendslist.model
 * null.java
 * Desc : 친구리스트 VO
 *
 * @Author : Mr.KKu
 * @Date : 2018-11-27 / 오후 2:50
 * @Version :
 */
@Alias("friendVo")
public class FriendsListVo {

    private String friend_mymail;
    private String friend_member;
    private String friend_accept;
    private String friend_date;
   
	public String getFriend_mymail() {
		return friend_mymail;
	}
	public void setFriend_mymail(String friend_mymail) {
		this.friend_mymail = friend_mymail;
	}
	public String getFriend_member() {
		return friend_member;
	}
	public void setFriend_member(String friend_member) {
		this.friend_member = friend_member;
	}
	public String getFriend_accept() {
		return friend_accept;
	}
	public void setFriend_accept(String friend_accept) {
		this.friend_accept = friend_accept;
	}
	public String getFriend_date() {
		return friend_date;
	}
	public void setFriend_date(String friend_date) {
		this.friend_date = friend_date;
	}
	public FriendsListVo(String friend_mymail, String friend_member, String friend_accept, String friend_date) {
		super();
		this.friend_mymail = friend_mymail;
		this.friend_member = friend_member;
		this.friend_accept = friend_accept;
		this.friend_date = friend_date;
	}
	public FriendsListVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "FriendsListVo [friend_mymail=" + friend_mymail + ", friend_member=" + friend_member + ", friend_accept="
				+ friend_accept + ", friend_date=" + friend_date + "]";
	}
	   
	   
	}
