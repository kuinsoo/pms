package kr.or.ddit.project.model;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * kr.or.ddit.project.model
 * null.java
 * Desc : 프로젝트 Vo
 *
 * @Author : Mr.KKu
 * @Date : 2018-11-27 / 오후 3:22
 * @Version :
 */
@Alias("projectVo")
public class ProjectVo {

	private String project_id;
	private String project_title;
	private String project_overview;
	private String project_bookmark;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date project_sdate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date project_edate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date project_eedate;

	public ProjectVo() {
	}

	public ProjectVo(String project_id, String project_title, String project_overview, String project_bookmark, Date project_sdate, Date project_edate, Date project_eedate) {
		this.project_id = project_id;
		this.project_title = project_title;
		this.project_overview = project_overview;
		this.project_bookmark = project_bookmark;
		this.project_sdate = project_sdate;
		this.project_edate = project_edate;
		this.project_eedate = project_eedate;
	}

	public String getProject_id() {
		return project_id;
	}

	public void setProject_id(String project_id) {
		this.project_id = project_id;
	}

	public String getProject_title() {
		return project_title;
	}

	public void setProject_title(String project_title) {
		this.project_title = project_title;
	}

	public String getProject_overview() {
		return project_overview;
	}

	public void setProject_overview(String project_overview) {
		this.project_overview = project_overview;
	}

	public String getProject_bookmark() {
		return project_bookmark;
	}

	public void setProject_bookmark(String project_bookmark) {
		this.project_bookmark = project_bookmark;
	}

	public Date getProject_sdate() {
		return project_sdate;
	}

	public void setProject_sdate(Date project_sdate) {
		this.project_sdate = project_sdate;
	}

	public Date getProject_edate() {
		return project_edate;
	}

	public void setProject_edate(Date project_edate) {
		this.project_edate = project_edate;
	}

	public Date getProject_eedate() {
		return project_eedate;
	}

	public void setProject_eedate(Date project_eedate) {
		this.project_eedate = project_eedate;
	}
}
