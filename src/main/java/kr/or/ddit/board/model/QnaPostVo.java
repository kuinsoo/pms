package kr.or.ddit.board.model;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * kr.or.ddit.board.model
 * null.java
 * Desc : 뿜게시글
 *
 * @Author : 변찬우 
 * @Date : 2018-12-17 / 오후 10:10
 * @Version :
 */
@Alias("qpostVo")
public class QnaPostVo extends PostVo{
	private String qpost_id;
	private String qboard_id;
	private String qpost_hierarchy;
	private String qpost_writer;
	private String qpost_pass;
	private String qpost_title;
	private String qpost_content;
	private String qpost_public;
	private String qpost_group;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String qpost_date;
	
	public QnaPostVo(){
	}
	
	@Override
	public String toString() {
		return "QnaPostVo [qpost_id=" + qpost_id + ", qboard_id=" + qboard_id + ", qpost_hierarchy=" + qpost_hierarchy
				+ ", qpost_writer=" + qpost_writer + ", qpost_pass=" + qpost_pass + ", qpost_title=" + qpost_title
				+ ", qpost_content=" + qpost_content + ", qpost_public=" + qpost_public + ", qpost_group=" + qpost_group
				+ ", qpost_date=" + qpost_date + "]";
	}

	public String getQpost_id() {
		return qpost_id;
	}
	public void setQpost_id(String qpost_id) {
		this.qpost_id = qpost_id;
	}
	public String getQboard_id() {
		return qboard_id;
	}
	public void setQboard_id(String qboard_id) {
		this.qboard_id = qboard_id;
	}
	public String getQpost_hierarchy() {
		return qpost_hierarchy;
	}
	public void setQpost_hierarchy(String qpost_hierarchy) {
		this.qpost_hierarchy = qpost_hierarchy;
	}
	public String getQpost_writer() {
		return qpost_writer;
	}
	public void setQpost_writer(String qpost_writer) {
		this.qpost_writer = qpost_writer;
	}
	public String getQpost_pass() {
		return qpost_pass;
	}
	public void setQpost_pass(String qpost_pass) {
		this.qpost_pass = qpost_pass;
	}
	public String getQpost_title() {
		return qpost_title;
	}
	public void setQpost_title(String qpost_title) {
		this.qpost_title = qpost_title;
	}
	public String getQpost_content() {
		return qpost_content;
	}
	public void setQpost_content(String qpost_content) {
		this.qpost_content = qpost_content;
	}
	public String getQpost_public() {
		return qpost_public;
	}
	public void setQpost_public(String qpost_public) {
		this.qpost_public = qpost_public;
	}
	public String getQpost_group() {
		return qpost_group;
	}
	public void setQpost_group(String qpost_group) {
		this.qpost_group = qpost_group;
	}
	public String getQpost_date() {
		return qpost_date;
	}
	public void setQpost_date(String qpost_date) {
		this.qpost_date = qpost_date;
	}
	
    
}
