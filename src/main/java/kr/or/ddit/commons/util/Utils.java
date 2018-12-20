package kr.or.ddit.commons.util;

import org.springframework.web.multipart.MultipartFile;

import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;

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

	public static byte[] toByteArray (String filePath) throws Exception {
		byte[] returnValue = null;

		ByteArrayOutputStream baos = null;
		FileInputStream fis = null;

		try {
			baos = new ByteArrayOutputStream();
			fis= new FileInputStream(filePath);

			byte[] buf = new byte[1024];
			int read = 0;

			while ((read=fis.read(buf, 0, buf.length)) != -1) {
				baos.write(buf,0,read);
			}

			returnValue = baos.toByteArray();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(baos != null)
				baos.close();
			if (fis != null)
				fis.close();
		}
		return returnValue;
	}
}
