package kr.or.ddit.schedule.model;

import org.apache.ibatis.type.Alias;

/**
 * kr.or.ddit.work.model
 * null.java
 * Desc : 일정 Vo
 *
 * @Author : jerry
 * @Date : 2018-12-03 16:14
 * @Version :
 */
@Alias("scheduleVo")
public class ScheduleVo {
	private String sid;				//	session id
	private String project_id;		//	프로젝트아이디
	private String project_title;	//	프로젝트명

	/* 기본생성자 */
	public ScheduleVo() {}

	/* 생성자 */
	public ScheduleVo(String sid, String project_id, String project_title) {
		this.sid = sid;
		this.project_id = project_id;
		this.project_title = project_title;
	}

	/* getter & setter */
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	public String getProject_title() {
		return project_title;
	}
	public void setProject_title(String project_title) {
		this.project_title = project_title;
	}
	public String getProject_id() {
		return project_id;
	}
	public void setProject_id(String project_id) {
		this.project_id = project_id;
	}

	/* toString */
	@Override
	public String toString() {
		return "ScheduleVo [sid=" + sid + ", project_id=" + project_id + ", project_title=" + project_title + "]";
	}

}

