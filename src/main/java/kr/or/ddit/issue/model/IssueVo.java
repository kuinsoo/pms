package kr.or.ddit.issue.model;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * kr.or.ddit.issue.model
 * null.java
 * Desc : 이슈 VO
 *
 * @Author : Mr.KKu, jerry
 * @Date : 2018-11-27 / 오후 2:53
 * @Version :
 */
@Alias("issueVo")
public class IssueVo {
	
	private String issue_id;		//	이슈번호(pk)
	private String issue_work;		//	이슈업무번호(fk)
	private String issue_member;	//	이슈담당자
	private String issue_helper;	//	이슈도우미
	private String issue_wc;		//	이슈업무카드번호
	private String issue_level;		//	이슈레벨
	private String issue_title;		//	이슈제목
	private String issue_content;	//	이슈내용
	private String issue_solution;	//	이슈해결방법
	private int	   issue_noviews;	//	이슈조회수
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm")
	private Date   issue_sdate;		//	이슈발행일시
	private String format_issue_sdate;//이슈발행일시(String)
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm")
	private Date   issue_edate;		//	이슈해결일시
	private String format_issue_edate;//이슈해결일시(String)
	private String issue_color;		//	이슈일시색깔
	
	/* 기능단위 */
	private String member_name;		//	참여자 이름
	private String pmember_member;	//	참여자 메일
	private String todo_id;			//	할일의 ID
	private String project_id;		//	이슈의 소속 프로젝트 아이디
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm")
	private Date   project_sdate;	//	프로젝트 시작일
	private String format_project_sdate; // 프로젝트 시작일(String)
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm")
	private Date   project_eedate;	//	프로젝트 예상종료일
	private String format_project_eedate; // 프로젝트 시작일(String)
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm")
	private Date   project_edate;	//	프로젝트 종료일
	private String format_project_edate; // 프로젝트 시작일(String)
	private int rnum;

	/* 기본생성자 */
	public IssueVo() {}

	/* 생성자 */
	public IssueVo(String issue_id, String issue_work, String issue_member, String issue_helper, String issue_wc,
			String issue_level, String issue_title, String issue_content, String issue_solution, int issue_noviews,
			Date issue_sdate, String format_issue_sdate, Date issue_edate, String format_issue_edate,
			String issue_color, String member_name, String pmember_member, String todo_id, String project_id,
			Date project_sdate, String format_project_sdate, Date project_eedate, String format_project_eedate,
			Date project_edate, String format_project_edate, int rnum) {
		this.issue_id = issue_id;
		this.issue_work = issue_work;
		this.issue_member = issue_member;
		this.issue_helper = issue_helper;
		this.issue_wc = issue_wc;
		this.issue_level = issue_level;
		this.issue_title = issue_title;
		this.issue_content = issue_content;
		this.issue_solution = issue_solution;
		this.issue_noviews = issue_noviews;
		this.issue_sdate = issue_sdate;
		this.format_issue_sdate = format_issue_sdate;
		this.issue_edate = issue_edate;
		this.format_issue_edate = format_issue_edate;
		this.issue_color = issue_color;
		this.member_name = member_name;
		this.pmember_member = pmember_member;
		this.todo_id = todo_id;
		this.project_id = project_id;
		this.project_sdate = project_sdate;
		this.format_project_sdate = format_project_sdate;
		this.project_eedate = project_eedate;
		this.format_project_eedate = format_project_eedate;
		this.project_edate = project_edate;
		this.format_project_edate = format_project_edate;
		this.rnum = rnum;
	}

	/* getter & setter */
	public String getIssue_id() {
		return issue_id;
	}
	public void setIssue_id(String issue_id) {
		this.issue_id = issue_id;
	}
	public String getIssue_work() {
		return issue_work;
	}
	public void setIssue_work(String issue_work) {
		this.issue_work = issue_work;
	}
	public String getIssue_member() {
		return issue_member;
	}
	public void setIssue_member(String issue_member) {
		this.issue_member = issue_member;
	}
	public String getIssue_helper() {
		return issue_helper;
	}
	public void setIssue_helper(String issue_helper) {
		this.issue_helper = issue_helper;
	}
	public String getIssue_wc() {
		return issue_wc;
	}
	public void setIssue_wc(String issue_wc) {
		this.issue_wc = issue_wc;
	}
	public String getIssue_level() {
		return issue_level;
	}
	public void setIssue_level(String issue_level) {
		this.issue_level = issue_level;
	}
	public String getIssue_title() {
		return issue_title;
	}
	public void setIssue_title(String issue_title) {
		this.issue_title = issue_title;
	}
	public String getIssue_content() {
		return issue_content;
	}
	public void setIssue_content(String issue_content) {
		this.issue_content = issue_content;
	}
	public String getIssue_solution() {
		return issue_solution;
	}
	public void setIssue_solution(String issue_solution) {
		this.issue_solution = issue_solution;
	}
	public int getIssue_noviews() {
		return issue_noviews;
	}
	public void setIssue_noviews(int issue_noviews) {
		this.issue_noviews = issue_noviews;
	}
	public Date getIssue_sdate() {
		return issue_sdate;
	}
	public void setIssue_sdate(Date issue_sdate) {
		this.issue_sdate = issue_sdate;
	}
	public Date getIssue_edate() {
		return issue_edate;
	}
	public void setIssue_edate(Date issue_edate) {
		this.issue_edate = issue_edate;
	}
	public String getIssue_color() {
		return issue_color;
	}
	public void setIssue_color(String issue_color) {
		this.issue_color = issue_color;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getPmember_member() {
		return pmember_member;
	}
	public void setPmember_member(String pmember_member) {
		this.pmember_member = pmember_member;
	}
	public String getTodo_id() {
		return todo_id;
	}
	public void setTodo_id(String todo_id) {
		this.todo_id = todo_id;
	}
	public String getProject_id() {
		return project_id;
	}
	public void setProject_id(String project_id) {
		this.project_id = project_id;
	}
	public Date getProject_sdate() {
		return project_sdate;
	}
	public void setProject_sdate(Date project_sdate) {
		this.project_sdate = project_sdate;
	}
	public Date getProject_eedate() {
		return project_eedate;
	}
	public void setProject_eedate(Date project_eedate) {
		this.project_eedate = project_eedate;
	}
	public Date getProject_edate() {
		return project_edate;
	}
	public void setProject_edate(Date project_edate) {
		this.project_edate = project_edate;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	/* 형변환 getter */
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	public String getFormat_issue_sdate() {
		if(issue_sdate == null) {
			return "";
		}
		return sdf.format(issue_sdate);
	}
	public String getFormat_issue_edate() {
		if(issue_edate == null) {
			return "";
		}
		return sdf.format(issue_edate);
	}
	public String getFormat_project_sdate() {
		if(project_sdate == null) {
			return "";
		}
		return sdf.format(project_sdate);
	}
	public String getFormat_project_eedate() {
		if(project_eedate == null) {
			return "";
		}
		return sdf.format(project_eedate);
	}
	public String getFormat_project_edate() {
		if(project_edate == null) {
			return "";
		}
		return sdf.format(project_edate);
	}
	
	/* toString */
	@Override
	public String toString() {
		return "IssueVo [issue_id=" + issue_id + ", issue_work=" + issue_work + ", issue_member=" + issue_member
				+ ", issue_helper=" + issue_helper + ", issue_wc=" + issue_wc + ", issue_level=" + issue_level
				+ ", issue_title=" + issue_title + ", issue_content=" + issue_content + ", issue_solution="
				+ issue_solution + ", issue_noviews=" + issue_noviews + ", issue_sdate=" + issue_sdate
				+ ", format_issue_sdate=" + format_issue_sdate + ", issue_edate=" + issue_edate
				+ ", format_issue_edate=" + format_issue_edate + ", issue_color=" + issue_color 
				+ ", member_name=" + member_name + ", pmember_member=" + pmember_member + ", todo_id=" + todo_id
				+ ", project_id=" + project_id + ", project_sdate=" + project_sdate + ", format_project_sdate=" 
				+ format_project_sdate + ", project_eedate=" + project_eedate + ", format_project_eedate=" 
				+ format_project_eedate + ", project_edate=" + project_edate + ", format_project_edate=" 
				+ format_project_edate + ", rnum=" + rnum + "]";
	}
}
