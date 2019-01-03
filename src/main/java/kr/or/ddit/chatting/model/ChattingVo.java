package kr.or.ddit.chatting.model;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * kr.or.ddit.chatting.model
 * null.java
 * Desc : 채팅 VO
 *
 * @Author : Mr.KKu
 * @Date : 2018-11-27 / 오후 2:42
 * @Version :
 */
@Alias("chatVo")
public class ChattingVo {
	private String chat_id;
	private String chat_metting;
	private String chat_writer;

	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm")
	private Date chat_date;
	private String format_chat_date;	
	
	private String chat_content;
	private String chat_writerid;
	private String chat_mtitle;
	
	public ChattingVo(){
		
	};
	
	public String getChat_id() {
		return chat_id;
	}
	public void setChat_id(String chat_id) {
		this.chat_id = chat_id;
	}
	public String getChat_metting() {
		return chat_metting;
	}
	public void setChat_metting(String chat_metting) {
		this.chat_metting = chat_metting;
	}
	public String getChat_writer() {
		return chat_writer;
	}
	public void setChat_writer(String chat_writer) {
		this.chat_writer = chat_writer;
	}
	public Date getChat_date() {
		return chat_date;
	}
	public void setChat_date(Date chat_date) {
		this.chat_date = chat_date;
	}
	
	/* 형변환 getter */
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	public String getFormat_chat_date() {
		if(chat_date == null) {
			return "";
		}
		return sdf.format(chat_date);
	}
	
	public String getChat_content() {
		return chat_content;
	}
	public void setChat_content(String chat_content) {
		this.chat_content = chat_content;
	}
	public String getChat_writerid() {
		return chat_writerid;
	}
	public void setChat_writerid(String chat_writerid) {
		this.chat_writerid = chat_writerid;
	}
	public String getChat_mtitle() {
		return chat_mtitle;
	}
	public void setChat_mtitle(String chat_mtitle) {
		this.chat_mtitle = chat_mtitle;
	}
	
	@Override
	public String toString() {
		return "MeetingVo [chat_id=" + chat_id + ", chat_metting=" + chat_metting + ", chat_writer=" + chat_writer
				+ ", chat_date=" + chat_date + ", chat_content=" + chat_content + ", chat_writerid=" + chat_writerid
				+ ", chat_mtitle=" + chat_mtitle + "]";
	}
	
}
