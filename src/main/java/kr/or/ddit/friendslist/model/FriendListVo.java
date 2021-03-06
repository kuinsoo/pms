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
public class FriendListVo {

	private int rnum;
	
    private String friend_myemail;
    private String friend_member;
    private String friend_accept;
    private String friend_date;
    private String friend_code;
    private String member_name;   
    
    
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getFriend_code() {
		return friend_code;
	}
	public void setFriend_code(String friend_code) {
		this.friend_code = friend_code;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
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


	@Override
	public String toString() {
		return "FriendListVo [rnum=" + rnum + ", friend_myemail=" + friend_myemail + ", friend_member=" + friend_member
				+ ", friend_accept=" + friend_accept + ", friend_date=" + friend_date + ", friend_code=" + friend_code
				+ ", member_name=" + member_name + "]";
	}
	public String getFriend_myemail() {
		return friend_myemail;
	}
	public void setFriend_myemail(String friend_myemail) {
		this.friend_myemail = friend_myemail;
	}
	public FriendListVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	}
