package kr.or.ddit.post.model;

import org.apache.ibatis.type.Alias;

/**
 * kr.or.ddit.board.model
 * null.java
 * Desc : 게시글 페이징 및 검색 처리 
 *
 * @Author : 변찬우 
 * @Date : 2018-12-17 / 오후 10:10
 * @Version :
 */
@Alias("PostPageVo")
public class PostPageVo {
	
	private String board_id;
	private String pageNum;
	private String searchText;
	
	public PostPageVo(){
	}

	public String getBoard_id() {
		return board_id;
	}

	public void setBoard_id(String board_id) {
		this.board_id = board_id;
	}

	public String getPageNum() {
		return pageNum;
	}

	public void setPageNum(String pageNum) {
		this.pageNum = pageNum;
	}

	public String getSearchText() {
		return searchText;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}

	@Override
	public String toString() {
		return "PageVo [board_id=" + board_id + ", pageNum=" + pageNum + ", searchText=" + searchText + "]";
	}
	
}
