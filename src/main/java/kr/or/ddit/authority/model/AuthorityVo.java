package kr.or.ddit.authority.model;

import org.apache.ibatis.type.Alias;

/**
 * kr.or.ddit.authority.model
 * null.java
 * Desc : 권한 Vo
 *
 * @Author : Mr.KKu
 * @Date : 2018-11-27 / 오후 2:32
 * @Version :
 */
@Alias("authVo")
public class AuthorityVo {
	
	private String auth_id;
	private String auth_member;
	private String auth_assort;
	
	@Override
	public String toString() {
		return "AuthorityVo [auth_id=" + auth_id + ", auth_member=" + auth_member + ", auth_assort=" + auth_assort
				+ "]";
	}
	public String getAuth_id() {
		return auth_id;
	}
	public void setAuth_id(String auth_id) {
		this.auth_id = auth_id;
	}
	public String getAuth_member() {
		return auth_member;
	}
	public void setAuth_member(String auth_member) {
		this.auth_member = auth_member;
	}
	public String getAuth_assort() {
		return auth_assort;
	}
	public void setAuth_assort(String auth_assort) {
		this.auth_assort = auth_assort;
	}
	
	
	
}
