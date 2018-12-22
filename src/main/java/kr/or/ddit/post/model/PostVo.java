package kr.or.ddit.post.model;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * kr.or.ddit.board.model
 * null.java
 * Desc : 게시글
 *
 * @Author : 변찬우 
 * @Date : 2018-12-17 / 오후 10:10
 * @Version :
 */
@Alias("postVo")
public class PostVo {
    
	private String post_id;
	private String board_id;
	private String post_hierarchy;
	private String post_writer;
	private String post_pass;
	private String post_title;
	private String post_content;
	private String post_public;
	private String post_group;
	
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm")
	private Date post_date;
	private String format_post_date;	
	
	private String title;		//게시글 목록용 

	public PostVo() {
		
	}

	public String getPost_id() {
		return post_id;
	}

	public void setPost_id(String post_id) {
		this.post_id = post_id;
	}

	public String getBoard_id() {
		return board_id;
	}

	public void setBoard_id(String board_id) {
		this.board_id = board_id;
	}

	public String getPost_hierarchy() {
		return post_hierarchy;
	}

	public void setPost_hierarchy(String post_hierarchy) {
		this.post_hierarchy = post_hierarchy;
	}

	public String getPost_writer() {
		return post_writer;
	}

	public void setPost_writer(String post_writer) {
		this.post_writer = post_writer;
	}

	public String getPost_pass() {
		return post_pass;
	}

	public void setPost_pass(String post_pass) {
		this.post_pass = post_pass;
	}

	public String getPost_title() {
		return post_title;
	}

	public void setPost_title(String post_title) {
		this.post_title = post_title;
	}

	public String getPost_content() {
		return post_content;
	}

	public void setPost_content(String post_content) {
		this.post_content = post_content;
	}

	public String getPost_public() {
		return post_public;
	}

	public void setPost_public(String post_public) {
		this.post_public = post_public;
	}

	public String getPost_group() {
		return post_group;
	}

	public void setPost_group(String post_group) {
		this.post_group = post_group;
	}

	public Date getPost_date() {
		return post_date;
	}

	public void setPost_date(Date post_date) {
		this.post_date = post_date;
	}
	
	/* 형변환 getter */
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	public String getFormat_post_date() {
		if(post_date == null) {
			return "";
		}
		return sdf.format(post_date);
	}
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}	
	
	

}
