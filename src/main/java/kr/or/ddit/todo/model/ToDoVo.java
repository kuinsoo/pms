package kr.or.ddit.todo.model;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * kr.or.ddit.todo.model
 * null.java
 * Desc : 할일 Vo
 *
 * @Author : Mr.KKu, jerry
 * @Date : 2018-11-27 / 오후 3:30
 * @Version :
 */
@Alias("todoVo")
public class ToDoVo {
	
	private int rnum;
	private String todo_id;				//	할일번호(pk)
	private String todo_work;			//	할일업무번호(fk)
	private String todo_pmember;		//	할일담당자
	private String todo_content;		//	할일내용
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm")
	private Date todo_sdate;			//	할일시작일시
	private String format_todo_sdate;	//	할일시작일시(String)
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm")
	private Date todo_edate;			//	할일마감일시
	private String format_todo_edate;	//	할일마감일시(String)
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm")
	private Date todo_eedate;			//	할일예상마감일시
	private String format_todo_eedate;	//	할일예상감일시(String)
	private String todo_complet;		//	할일완료여부
	private String todo_color;			//	할일 색깔
	private String todo_issue;			//	할일이슈번호(fk)
	
	/* 기능단위 */
	private String member_name;			//	참여자 이름
	private String todo_member;			//	참여자 이메일
	private String member_profile;		//	참여자 프로필사진
	private String issue_id;			//	이슈아이디
	private String work_project;		//	참여중인 프로젝트 ID
	private String pmember_member;		//	참여자 이메일
	
	/* 기본생성자 */
	public ToDoVo() {}

	/* 생성자 */
	public ToDoVo(String todo_id, String todo_work, String todo_pmember, String todo_content, Date todo_sdate,
			String format_todo_sdate, Date todo_edate, String format_todo_edate, Date todo_eedate,
			String format_todo_eedate, String todo_complet, String todo_color, int rnum, String todo_issue, 
			String member_name, String todo_member, String member_profile, String issue_id, String work_project, String pmember_member) {
		super();
		this.todo_id = todo_id;
		this.todo_work = todo_work;
		this.todo_pmember = todo_pmember;
		this.todo_content = todo_content;
		this.todo_sdate = todo_sdate;
		this.format_todo_sdate = format_todo_sdate;
		this.todo_edate = todo_edate;
		this.format_todo_edate = format_todo_edate;
		this.todo_eedate = todo_eedate;
		this.format_todo_eedate = format_todo_eedate;
		this.todo_complet = todo_complet;
		this.todo_color = todo_color;
		this.rnum = rnum;
		this.todo_issue = todo_issue;
		this.member_name = member_name;
		this.todo_member = todo_member;
		this.member_profile = member_profile;
		this.issue_id = issue_id;
		this.work_project = work_project;
		this.pmember_member = pmember_member;
	}

	/* getter & setter */
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getTodo_id() {
		return todo_id;
	}
	public void setTodo_id(String todo_id) {
		this.todo_id = todo_id;
	}
	public String getTodo_work() {
		return todo_work;
	}
	public void setTodo_work(String todo_work) {
		this.todo_work = todo_work;
	}
	public String getTodo_pmember() {
		return todo_pmember;
	}
	public void setTodo_pmember(String todo_pmember) {
		this.todo_pmember = todo_pmember;
	}
	public String getTodo_content() {
		return todo_content;
	}
	public void setTodo_content(String todo_content) {
		this.todo_content = todo_content;
	}
	public Date getTodo_sdate() {
		return todo_sdate;
	}
	public void setTodo_sdate(Date todo_sdate) {
		this.todo_sdate = todo_sdate;
	}
	public Date getTodo_edate() {
		return todo_edate;
	}
	public void setTodo_edate(Date todo_edate) {
		this.todo_edate = todo_edate;
	}
	public Date getTodo_eedate() {
		return todo_eedate;
	}
	public void setTodo_eedate(Date todo_eedate) {
		this.todo_eedate = todo_eedate;
	}
	public String getTodo_complet() {
		return todo_complet;
	}
	public void setTodo_complet(String todo_complet) {
		this.todo_complet = todo_complet;
	}
	public String getTodo_color() {
		return todo_color;
	}
	public void setTodo_color(String todo_color) {
		this.todo_color = todo_color;
	}
	 public String getTodo_issue() {
		return todo_issue;
	}
	public void setTodo_issue(String todo_issue) {
		this.todo_issue = todo_issue;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getTodo_member() {
		return todo_member;
	}
	public void setTodo_member(String todo_member) {
		this.todo_member = todo_member;
	}
	public String getMember_profile() {
		return member_profile;
	}
	public void setMember_profile(String member_profile) {
		this.member_profile = member_profile;
	}
	public String getIssue_id() {
		return issue_id;
	}
	public void setIssue_id(String issue_id) {
		this.issue_id = issue_id;
	}
	public String getWork_project() {
		return work_project;
	}
	public void setWork_project(String work_project) {
		this.work_project = work_project;
	}
	public String getPmember_member() {
		return pmember_member;
	}
	public void setPmember_member(String pmember_member) {
		this.pmember_member = pmember_member;
	}

	/* 형변환 getter */
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	public String getFormat_todo_sdate() {
		if(todo_sdate == null) {
			return "";
		}
		return sdf.format(todo_sdate);
	}
	public String getFormat_todo_eedate() {
		if(todo_eedate == null) {
			return "";
		}
		return sdf.format(todo_eedate);
	}
	public String getFormat_todo_edate() {
		if(todo_edate == null) {
			return "";
		}
		return sdf.format(todo_edate);
	}

	/* toString */
	@Override
	public String toString() {
		return "ToDoVo{" +
				"rnum=" + rnum +
				", todo_id='" + todo_id + '\'' +
				", todo_work='" + todo_work + '\'' +
				", todo_pmember='" + todo_pmember + '\'' +
				", todo_content='" + todo_content + '\'' +
				", todo_sdate=" + todo_sdate +
				", format_todo_sdate='" + format_todo_sdate + '\'' +
				", todo_edate=" + todo_edate +
				", format_todo_edate='" + format_todo_edate + '\'' +
				", todo_eedate=" + todo_eedate +
				", format_todo_eedate='" + format_todo_eedate + '\'' +
				", todo_complet='" + todo_complet + '\'' +
				", todo_color='" + todo_color + '\'' +
				", todo_issue='" + todo_issue + '\'' +
				", member_name='" + member_name + '\'' +
				", todo_member='" + todo_member + '\'' +
				", pmember_member='" + pmember_member + '\'' +
				", member_profile='" + member_profile + '\'' +
				", issue_id='" + issue_id + '\'' +
				", work_project='" + work_project + '\'' +
				", sdf=" + sdf +
				'}';
	}
}
