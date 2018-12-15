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

	private String wc_id;
	private String wc_work;
	private float wc_index;
	private String wc_group;


	public CardVo() {
	}

	public CardVo(String wc_id, String wc_work, float wc_index, String wc_group) {
		this.wc_id = wc_id;
		this.wc_work = wc_work;
		this.wc_index = wc_index;
		this.wc_group = wc_group;
	}

	public String getWc_id() {
		return wc_id;
	}

	public void setWc_id(String wc_id) {
		this.wc_id = wc_id;
	}

	public String getWc_work() {
		return wc_work;
	}

	public void setWc_work(String wc_work) {
		this.wc_work = wc_work;
	}

	public float getWc_index() {
		return wc_index;
	}

	public void setWc_index(float wc_index) {
		this.wc_index = wc_index;
	}

	public String getWc_group() {
		return wc_group;
	}

	public void setWc_group(String wc_group) {
		this.wc_group = wc_group;
	}
}
