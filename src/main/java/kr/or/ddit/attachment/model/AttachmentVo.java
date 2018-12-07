package kr.or.ddit.attachment.model;

import org.apache.ibatis.type.Alias;

import java.util.Arrays;

/**
 * kr.or.ddit.attachment.model
 * null.java
 * Desc : 첨부파일 VO
 *
 * @Author : Mr.KKu
 * @Date : 2018-11-27 / 오후 2:16
 * @Version :
 */
@Alias("attVo")
public class AttachmentVo {

	private String att_id;
	private String att_work;
	private String att_name;
	private String att_extension;
	private String att_path;
	private byte[] att_file;

	public AttachmentVo() {
	}

	public AttachmentVo(String att_id, String att_work, String att_name, String att_extension, String att_path, byte[] att_file) {
		this.att_id = att_id;
		this.att_work = att_work;
		this.att_name = att_name;
		this.att_extension = att_extension;
		this.att_path = att_path;
		this.att_file = att_file;
	}

	@Override
	public String toString() {
		return "AttachmentVo{" +
				"att_id='" + att_id + '\'' +
				", att_work='" + att_work + '\'' +
				", att_name='" + att_name + '\'' +
				", att_extension='" + att_extension + '\'' +
				", att_path='" + att_path + '\'' +
				", att_file=" + Arrays.toString(att_file) +
				'}';
	}

	public String getAtt_id() {
		return att_id;
	}

	public void setAtt_id(String att_id) {
		this.att_id = att_id;
	}

	public String getAtt_work() {
		return att_work;
	}

	public void setAtt_work(String att_work) {
		this.att_work = att_work;
	}

	public String getAtt_name() {
		return att_name;
	}

	public void setAtt_name(String att_name) {
		this.att_name = att_name;
	}

	public String getAtt_extension() {
		return att_extension;
	}

	public void setAtt_extension(String att_extension) {
		this.att_extension = att_extension;
	}

	public String getAtt_path() {
		return att_path;
	}

	public void setAtt_path(String att_path) {
		this.att_path = att_path;
	}

	public byte[] getAtt_file() {
		return att_file;
	}

	public void setAtt_file(byte[] att_file) {
		this.att_file = att_file;
	}
}
