package kr.or.ddit.board.model;

import org.apache.ibatis.type.Alias;

/**
 * kr.or.ddit.board.model
 * null.java
 * Desc : 게시판 
 *
 * @Author : 변찬우 
 * @Date : 2018-12-17 / 오후 10:10
 * @Version :
 */
@Alias("boardVo")
public class BoardVo {       
	private String board_id;
	private String board_admin;
	private String board_title;
	
	public BoardVo(){
		
	}
	
	public BoardVo(String board_id, String board_admin, String board_title) {
		super();
		this.board_id = board_id;
		this.board_admin = board_admin;
		this.board_title = board_title;
	}

	public String getBoard_id() {
		return board_id;
	}
	public void setBoard_id(String board_id) {
		this.board_id = board_id;
	}
	public String getBoard_admin() {
		return board_admin;
	}
	public void setBoard_admin(String board_admin) {
		this.board_admin = board_admin;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

}


