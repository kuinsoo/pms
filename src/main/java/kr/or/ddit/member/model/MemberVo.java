package kr.or.ddit.member.model;

import kr.or.ddit.todo.model.ToDoVo;
import org.apache.ibatis.type.Alias;

@Alias("memberVo")
public class MemberVo extends PMemberListVo{
	
	private int rnum;
	private String member_mail;
	private String member_name;
	private String member_pass;
	private String member_tel;
	private String member_profile;
	private String member_withdrawal;
	private String friend_accept;
	
	private ToDoVo todoVo;

	
	public String getFriend_accept() {
		return friend_accept;
	}

	public void setFriend_accept(String friend_accept) {
		this.friend_accept = friend_accept;
	}

	@Override
	public String toString() {
		return "MemberVo [rnum=" + rnum + ", member_mail=" + member_mail + ", member_name=" + member_name
				+ ", member_pass=" + member_pass + ", member_tel=" + member_tel + ", member_profile=" + member_profile
				+ ", member_withdrawal=" + member_withdrawal + ", friend_accept=" + friend_accept + ", todoVo=" + todoVo
				+ "]";
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
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

	public ToDoVo getTodoVo() {
		return todoVo;
	}

	public void setTodoVo(ToDoVo todoVo) {
		this.todoVo = todoVo;
	}
}
