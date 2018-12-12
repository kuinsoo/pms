package kr.or.ddit.comments.model;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * kr.or.ddit.comments.model
 * null.java
 * Desc : 댓글 VO
 *
 * @Author : Mr.KKu
 * @Date : 2018-11-27 / 오후 2:44
 * @Version :
 */
@Alias("cmtVo")
public class CommentsVo {
	private String cmt_id;
	private String cmt_work;
	private String cmt_member;
	private String cmt_content;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date cmt_date;

	public CommentsVo() {
	}

	public CommentsVo(String cmt_id, String cmt_work, String cmt_member, String cmt_content, Date cmt_date) {
		this.cmt_id = cmt_id;
		this.cmt_work = cmt_work;
		this.cmt_member = cmt_member;
		this.cmt_content = cmt_content;
		this.cmt_date = cmt_date;
	}

	public String getCmt_id() {
		return cmt_id;
	}

	public void setCmt_id(String cmt_id) {
		this.cmt_id = cmt_id;
	}

	public String getCmt_work() {
		return cmt_work;
	}

	public void setCmt_work(String cmt_work) {
		this.cmt_work = cmt_work;
	}

	public String getCmt_member() {
		return cmt_member;
	}

	public void setCmt_member(String cmt_member) {
		this.cmt_member = cmt_member;
	}

	public String getCmt_content() {
		return cmt_content;
	}

	public void setCmt_content(String cmt_content) {
		this.cmt_content = cmt_content;
	}

	public Date getCmt_date() {
		return cmt_date;
	}

	public void setCmt_date(Date cmt_date) {
		this.cmt_date = cmt_date;
	}
}
