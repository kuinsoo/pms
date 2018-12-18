package kr.or.ddit.message.model;

import java.util.Date;

import org.apache.ibatis.type.Alias;

/**
 * kr.or.ddit.message.model
 * null.java
 * Desc : 쪽지 VO
 *
 * @Author : Mr.KKu
 * @Date : 2018-11-27 / 오후 3:11
 * @Version :
 */
@Alias("msgVo")
public class MessageVo {
	
	private int rnum;
	private String msg_id;
	private String msg_smember;
	private Date msg_time;
	private String msg_type;
	private String msg_content;
	private String msgmember_msg;
	private String msg_rmember;
	private Date msg_rdate;
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getMsg_id() {
		return msg_id;
	}
	public void setMsg_id(String msg_id) {
		this.msg_id = msg_id;
	}
	public Date getMsg_time() {
		return msg_time;
	}
	public void setMsg_time(Date msg_time) {
		this.msg_time = msg_time;
	}
	public String getMsg_type() {
		return msg_type;
	}
	public void setMsg_type(String msg_type) {
		this.msg_type = msg_type;
	}
	public String getMsg_content() {
		return msg_content;
	}
	public void setMsg_content(String msg_content) {
		this.msg_content = msg_content;
	}
	public String getMsgmember_msg() {
		return msgmember_msg;
	}
	public void setMsgmember_msg(String msgmember_msg) {
		this.msgmember_msg = msgmember_msg;
	}
	public String getMsg_rmember() {
		return msg_rmember;
	}
	public void setMsg_rmember(String msg_rmember) {
		this.msg_rmember = msg_rmember;
	}
	public Date getMsg_rdate() {
		return msg_rdate;
	}
	public void setMsg_rdate(Date msg_rdate) {
		this.msg_rdate = msg_rdate;
	}

	@Override
	public String toString() {
		return "MessageVo [rnum=" + rnum + ", msg_id=" + msg_id + ", msg_smember=" + msg_smember + ", msg_time="
				+ msg_time + ", msg_type=" + msg_type + ", msg_content=" + msg_content + ", msgmember_msg="
				+ msgmember_msg + ", msg_rmember=" + msg_rmember + ", msg_rdate=" + msg_rdate + "]";
	}
	public String getMsg_smember() {
		return msg_smember;
	}
	public void setMsg_smember(String msg_smember) {
		this.msg_smember = msg_smember;
	}
	public MessageVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
