package kr.or.ddit.evaluation.model;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * kr.or.ddit.evaluation.model
 * null.java
 * Desc :
 *
 * @Author : Mr.KKu
 * @Date : 2018-12-20 / 오후 5:15
 * @Version :
 */
@Alias("evalVo")
public class EvaluationVo {
	private String 	project_id;
	private String 	project_title;
	private String 	project_overview;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date 	project_sdate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date 	project_eedate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date 	project_edate;

	private String 	pmember_id;
	private String 	work_title;
	private String 	work_content;

	private int issueCnt;
	private int workCnt;
	private int memberCnt;
	private int myWorkCnt;
	private int myIssueCnt;

	public EvaluationVo() {
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

	public String getPmember_id() {
		return pmember_id;
	}

	public void setPmember_id(String pmember_id) {
		this.pmember_id = pmember_id;
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

	public int getIssueCnt() {
		return issueCnt;
	}

	public void setIssueCnt(int issueCnt) {
		this.issueCnt = issueCnt;
	}

	public int getWorkCnt() {
		return workCnt;
	}

	public void setWorkCnt(int workCnt) {
		this.workCnt = workCnt;
	}

	public int getMemberCnt() {
		return memberCnt;
	}

	public void setMemberCnt(int memberCnt) {
		this.memberCnt = memberCnt;
	}

	public int getMyWorkCnt() {
		return myWorkCnt;
	}

	public void setMyWorkCnt(int myWorkCnt) {
		this.myWorkCnt = myWorkCnt;
	}

	public int getMyIssueCnt() {
		return myIssueCnt;
	}

	public void setMyIssueCnt(int myIssueCnt) {
		this.myIssueCnt = myIssueCnt;
	}
}
