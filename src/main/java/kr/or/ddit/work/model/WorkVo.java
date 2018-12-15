package kr.or.ddit.work.model;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * kr.or.ddit.work.model
 * null.java
 * Desc : 업무 Vo
 *
 * @Author : Mr.KKu, jerry
 * @Date : 2018-11-27 / 오후 3:32
 * @Version :
 */
@Alias("workVo")
public class WorkVo {
	
	private String work_id;				//	업무번호(pk)
	private String work_project;		//	업무프로젝트번호(fk)
	private String work_title;			//	업무제목
	private String work_content;		//	업무내용
	private String work_type;			//	업무유형
	private int work_importance;		//	업무중요도
	@DateTimeFormat(pattern="yyyy-MM-dd'T'HH:mm")
	private Date   work_sdate;			//	업무시작일자
	private String format_work_sdate;	//	업무시작일자(String)
	@DateTimeFormat(pattern="yyyy-MM-dd'T'HH:mm")
	private Date   work_eedate;			//	업무예상마감일자
	private String format_work_eedate;	//	업무예상마감일자(String)
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date   work_edate;			//	업무마감일자
	private String format_work_edate;	//	업무마감일자(String)
	private int    work_progress;		//	업무진척도
	private String work_approval;		//	업무마감승인여부(ex: Y or N)
	private String work_public;			//	업무공개여부      (ex: Y or N)
	private String work_color;			//	일정 색깔

	@DateTimeFormat(pattern="yyyy-MM-dd'T'HH:mm")
	private String work_wdate;		// 작성일

	private String member_mail; 	// 작성자
	private String member_profile;  // 작성자 프로필사진

	
	/* 기본생성자 */
	public WorkVo() {}
	
	/* 생성자 */

	public WorkVo(String work_id, String work_project, String work_title, String work_content, String work_type, int work_importance, Date work_sdate, String format_work_sdate, Date work_eedate, String format_work_eedate, Date work_edate, String format_work_edate, int work_progress, String work_approval, String work_public, String work_color, String work_wdate, String member_mail, String member_profile, SimpleDateFormat sdf) {
		this.work_id = work_id;
		this.work_project = work_project;
		this.work_title = work_title;
		this.work_content = work_content;
		this.work_type = work_type;
		this.work_importance = work_importance;
		this.work_sdate = work_sdate;
		this.format_work_sdate = format_work_sdate;
		this.work_eedate = work_eedate;
		this.format_work_eedate = format_work_eedate;
		this.work_edate = work_edate;
		this.format_work_edate = format_work_edate;
		this.work_progress = work_progress;
		this.work_approval = work_approval;
		this.work_public = work_public;
		this.work_color = work_color;
		this.work_wdate = work_wdate;
		this.member_mail = member_mail;
		this.member_profile = member_profile;
		this.sdf = sdf;
	}

	/* getter & setter */
	public String getWork_id() {
		return work_id;
	}
	public void setWork_id(String work_id) {
		this.work_id = work_id;
	}
	public String getWork_project() {
		return work_project;
	}
	public void setWork_project(String work_project) {
		this.work_project = work_project;
	}
	public String getWork_title() {
		return work_title;
	}
	public void setWork_title(String work_title) {
		this.work_title = work_title;
	}
	public String getWork_content() {
		return work_content;
	}
	public void setWork_content(String work_content) {
		this.work_content = work_content;
	}
	public String getWork_type() {
		return work_type;
	}
	public void setWork_type(String work_type) {
		this.work_type = work_type;
	}
	public int getWork_importance() {
		return work_importance;
	}
	public void setWork_importance(int work_importance) {
		this.work_importance = work_importance;
	}
	public Date getWork_sdate() {
		return work_sdate;
	}
	public void setWork_sdate(Date work_sdate) {
		this.work_sdate = work_sdate;
	}
	public Date getWork_eedate() {
		return work_eedate;
	}
	public void setWork_eedate(Date work_eedate) {
		this.work_eedate = work_eedate;
	}
	public Date getWork_edate() {
		return work_edate;
	}
	public void setWork_edate(Date work_edate) {
		this.work_edate = work_edate;
	}
	public int getWork_progress() {
		return work_progress;
	}
	public void setWork_progress(int work_progress) {
		this.work_progress = work_progress;
	}
	public String getWork_approval() {
		return work_approval;
	}
	public void setWork_approval(String work_approval) {
		this.work_approval = work_approval;
	}
	public String getWork_public() {
		return work_public;
	}
	public void setWork_public(String work_public) {
		this.work_public = work_public;
	}
	public String getWork_color() {
		return work_color;
	}
	public void setWork_color(String work_color) {
		this.work_color = work_color;
	}
	public String getWork_wdate() {
		return work_wdate;
	}

	public void setWork_wdate(String work_wdate) {
		this.work_wdate = work_wdate;
	}

	public String getMember_mail() {
		return member_mail;
	}

	public void setMember_mail(String member_mail) {
		this.member_mail = member_mail;
	}

	public String getMember_profile() {
		return member_profile;
	}

	public void setMember_profile(String member_profile) {
		this.member_profile = member_profile;
	}

	/* 형변환 getter */
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	public String getFormat_work_sdate() {
		return sdf.format(work_sdate);
	}
	public String getFormat_work_eedate() {
		return sdf.format(work_eedate);
	}
	public String getFormat_work_edate() {
		return sdf.format(work_edate);
	}

	/* toString */
	@Override
	public String toString() {
		return "WorkVo{" +
				"work_id='" + work_id + '\'' +
				", work_project='" + work_project + '\'' +
				", work_title='" + work_title + '\'' +
				", work_content='" + work_content + '\'' +
				", work_type='" + work_type + '\'' +
				", work_importance=" + work_importance +
				", work_sdate=" + work_sdate +
				", work_eedate=" + work_eedate +
				", work_edate=" + work_edate +
				", work_progress=" + work_progress +
				", work_approval='" + work_approval + '\'' +
				", work_public='" + work_public + '\'' +
				", work_color='" + work_color + '\'' +
				", work_wdate='" + work_wdate + '\'' +
				", member_mail='" + member_mail + '\'' +
				", member_profile='" + member_profile + '\'' +
				'}';
	}




}

