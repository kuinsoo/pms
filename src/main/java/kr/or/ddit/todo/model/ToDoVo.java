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
	
	private int rnum ;
	private String todo_id;				//	할일번호(pk)
	private String todo_work;			//	할일업무번호(fk)
	private String todo_pmember;		//	할일담당자
	private String todo_content;		//	할일내용
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date todo_sdate;			//	할일시작일시
	private String format_todo_sdate;	//	할일시작일시(String)
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date todo_edate;			//	할일마감일시
	private String format_todo_edate;	//	할일마감일시(String)
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date todo_eedate;			//	할일예상마감일시
	private String format_todo_eedate;	//	할일예상감일시(String)
	private String todo_complet;		//	할일완료여부
	private String todo_color;			//	할일 색깔
	
	/* 기본생성자 */
	public ToDoVo() {}

	/* 생성자 */
	public ToDoVo(String todo_id, String todo_work, String todo_pmember, String todo_content, Date todo_sdate,
			String format_todo_sdate, Date todo_edate, String format_todo_edate, Date todo_eedate,
			String format_todo_eedate, String todo_complet, String todo_color, int rnum) {
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
	}

	
	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	/* getter & setter */
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
	
/*	 형변환 getter 
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	public String getFormat_todo_sdate() {
		return sdf.format(todo_sdate);
	}
	public String getFormat_todo_eedate() {
		return sdf.format(todo_eedate);
	}
	public String getFormat_todo_edate() {
		return sdf.format(todo_edate);
	}*/

	/* toString */
	@Override
	public String toString() {
		return "ToDoVo [todo_id=" + todo_id + ", todo_work=" + todo_work + ", todo_pmember=" + todo_pmember
				+ ", todo_content=" + todo_content + ", todo_sdate=" + todo_sdate + ", format_todo_sdate="
				+ format_todo_sdate + ", todo_edate=" + todo_edate + ", format_todo_edate=" + format_todo_edate
				+ ", todo_eedate=" + todo_eedate + ", format_todo_eedate=" + format_todo_eedate + ", todo_complet="
				+ todo_complet + ", todo_color=" + todo_color + "]";
	}
	
}
