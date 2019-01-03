package kr.or.ddit.meeting.model;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * kr.or.ddit.meeting.model
 * null.java
 * Desc : 회의 VO
 *
 * @Author : Mr.KKu
 * @Date : 2018-11-27 / 오후 2:57
 * @Version :
 */
@Alias("meetingVo")
public class MeetingVo {
	private String meeting_id;
	private String meeting_project;
	private String meeting_work;
	private String meeting_type;
	private String meeting_title;
	private String meeting_overview;
	private String meeting_content;
	private String meeting_founder;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm")
	private Date meeting_sdate;
	private String format_meeting_sdate;	
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm")
	private Date meeting_eedate;
	private String format_meeting_eedate;	
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm")
	private Date meeting_edate;
	private String format_meeting_edate;	
	private String meeting_issue;
	private String meeting_color;
	//멤버 이름 
	private String member_name;
	
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	
	
	public MeetingVo() {
	}
	public String getMeeting_id() {
		return meeting_id;
	}
	public void setMeeting_id(String meeting_id) {
		this.meeting_id = meeting_id;
	}
	public String getMeeting_project() {
		return meeting_project;
	}
	public void setMeeting_project(String meeting_project) {
		this.meeting_project = meeting_project;
	}
	public String getMeeting_work() {
		return meeting_work;
	}
	public void setMeeting_work(String meeting_work) {
		this.meeting_work = meeting_work;
	}
	public String getMeeting_type() {
		return meeting_type;
	}
	public void setMeeting_type(String meeting_type) {
		this.meeting_type = meeting_type;
	}
	public String getMeeting_title() {
		return meeting_title;
	}
	public void setMeeting_title(String meeting_title) {
		this.meeting_title = meeting_title;
	}
	public String getMeeting_overview() {
		return meeting_overview;
	}
	public void setMeeting_overview(String meeting_overview) {
		this.meeting_overview = meeting_overview;
	}
	public String getMeeting_content() {
		return meeting_content;
	}
	public void setMeeting_content(String meeting_content) {
		this.meeting_content = meeting_content;
	}
	public String getMeeting_founder() {
		return meeting_founder;
	}
	public void setMeeting_founder(String meeting_founder) {
		this.meeting_founder = meeting_founder;
	}
	public Date getMeeting_sdate() {
		return meeting_sdate;
	}
	public void setMeeting_sdate(Date meeting_sdate) {
		this.meeting_sdate = meeting_sdate;
	}
	/* 형변환 getter */
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	public String getFormat_meeting_sdate() {
		if(meeting_sdate == null) {
			return "";
		}
		return sdf.format(meeting_sdate);
	}
	
	public Date getMeeting_eedate() {
		return meeting_eedate;
	}
	public void setMeeting_eedate(Date meeting_eedate) {
		this.meeting_eedate = meeting_eedate;
	}
	/* 형변환 getter */
	public String getFormat_meeting_eedate() {
		if(meeting_eedate == null) {
			return "";
		}
		return sdf.format(meeting_eedate);
	}
	
	public Date getMeeting_edate() {
		return meeting_edate;
	}
	public void setMeeting_edate(Date meeting_edate) {
		this.meeting_edate = meeting_edate;
	}
	/* 형변환 getter */
	public String getFormat_meeting_edate() {
		if(meeting_edate == null) {
			return "";
		}
		return sdf.format(meeting_edate);
	}
	public String getMeeting_issue() {
		return meeting_issue;
	}
	public void setMeeting_issue(String meeting_issue) {
		this.meeting_issue = meeting_issue;
	}
	public String getMeeting_color() {
		return meeting_color;
	}
	public void setMeeting_color(String meeting_color) {
		this.meeting_color = meeting_color;
	}
	
	@Override
	public String toString() {
		return "MeetingVo [meeting_id=" + meeting_id + ", meeting_project=" + meeting_project + ", meeting_work="
				+ meeting_work + ", meeting_type=" + meeting_type + ", meeting_title=" + meeting_title
				+ ", meeting_overview=" + meeting_overview + ", meeting_content=" + meeting_content
				+ ", meeting_founder=" + meeting_founder + ", meeting_sdate=" + meeting_sdate + ", meeting_eedate="
				+ meeting_eedate + ", meeting_edate=" + meeting_edate + ", meeting_issue=" + meeting_issue
				+ ", meeting_color=" + meeting_color + "]";
	}
}
