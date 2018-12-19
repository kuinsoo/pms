package kr.or.ddit.commons.util;

/**
 * kr.or.ddit.commons.util
 * null.java
 * Desc : 중복 방지  UUID
 *
 * @Author : Mr.KKu
 * @Date : 2018-12-19 / 오전 11:25
 * @Version :
 */
public class UUID {
	public static String UUID() {
		return java.util.UUID.randomUUID().toString();
	}
}
