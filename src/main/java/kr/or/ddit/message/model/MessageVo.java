package kr.or.ddit.message.model;

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
	
	private String msg_id;
	private String msg_smemeber;
	private String msg_time;
	private String msg_type;
	private String msg_content;
	
	
	public String getMsg_id() {
		return msg_id;
	}
	public void setMsg_id(String msg_id) {
		this.msg_id = msg_id;
	}
	public String getMsg_smemeber() {
		return msg_smemeber;
	}
	public void setMsg_smemeber(String msg_smemeber) {
		this.msg_smemeber = msg_smemeber;
	}
	public String getMsg_time() {
		return msg_time;
	}
	public void setMsg_time(String msg_time) {
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
	
	@Override
	public String toString() {
		return "MessageVo [msg_id=" + msg_id + ", msg_smemeber=" + msg_smemeber + ", msg_time=" + msg_time
				+ ", msg_type=" + msg_type + ", msg_content=" + msg_content + "]";
	}
	public MessageVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
