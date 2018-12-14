package kr.or.ddit.card.model;

import org.apache.ibatis.type.Alias;

/**
 * kr.or.ddit.card
 * null.java
 * Desc : Card value object
 *
 * @Author : Mr.KKu
 * @Date : 2018-11-16 / 오전 10:55
 * @Version :
 */
@Alias("cardVo")
public class CardVo {

	private String 	card_group;
	private float 	card_index;
	private int  	card_no;
	private String 	card_title;
	private String 	card_content;
	private int 	progress;

	public CardVo() {
	}

	public CardVo(String card_group, float card_index, int card_no, String card_title, String card_content, int progress) {
		this.card_group = card_group;
		this.card_index = card_index;
		this.card_no = card_no;
		this.card_title = card_title;
		this.card_content = card_content;
		this.progress = progress;
	}

	public String getCard_group() {
		return card_group;
	}

	public void setCard_group(String card_group) {
		this.card_group = card_group;
	}

	public float getCard_index() {
		return card_index;
	}

	public void setCard_index(float card_index) {
		this.card_index = card_index;
	}

	public int getCard_no() {
		return card_no;
	}

	public void setCard_no(int card_no) {
		this.card_no = card_no;
	}

	public String getCard_title() {
		return card_title;
	}

	public void setCard_title(String card_title) {
		this.card_title = card_title;
	}

	public String getCard_content() {
		return card_content;
	}

	public void setCard_content(String card_content) {
		this.card_content = card_content;
	}

	public int getProgress() {
		return progress;
	}

	public void setProgress(int progress) {
		this.progress = progress;
	}

	@Override
	public String toString() {
		return "CardVo{" +
				"card_group='" + card_group + '\'' +
				", card_index=" + card_index +
				", card_no=" + card_no +
				", card_title='" + card_title + '\'' +
				", card_content='" + card_content + '\'' +
				", progress=" + progress +
				'}';
	}
}
