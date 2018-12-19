package kr.or.ddit.commons.util;

import org.springframework.web.multipart.MultipartFile;

/**
 * kr.or.ddit.commons.util
 * null.java
 * Desc : 확장자 추출
 *
 * @Author : Mr.KKu
 * @Date : 2018-12-19 / 오후 2:32
 * @Version :
 */
public class Utils {
	public static String extractExtension(MultipartFile file) {
		String fileName  = file.getOriginalFilename();
		int index = fileName.lastIndexOf(".");

		return fileName.substring(index+1,fileName.length());
	}
}
