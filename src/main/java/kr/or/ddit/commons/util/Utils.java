package kr.or.ddit.commons.util;

import kr.or.ddit.Application;
import kr.or.ddit.attachment.model.AttachmentVo;
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

	/**
	 * File upload string.
	 * 작성자	: Mr.KKu
	 * 내용		: 싱글 파일 업로드
	 *
	 * @param file the file
	 * @return the string
	 */
	public static String singleFile(MultipartFile file, String work_id) {
		String msg = "";
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//
//		AttachmentServiceInf attachmentService =  new AttachmentService();
//		String path = Application.UPLOAD_DIR + "/"+ UUID.UUID() + "_" + sdf.format(new Date()) + "_" +  file.getOriginalFilename();
//		String extension = path.substring(path.lastIndexOf(".")+1, path.length());
//		AttachmentVo attVo = new AttachmentVo();
//		attVo.setAtt_work(work_id);
//		attVo.setAtt_name(file.getOriginalFilename());
//		attVo.setAtt_extension(extension);
//		attVo.setAtt_path(path);
//		attachmentService.insertAtt(attVo);
//
//		if(!file.isEmpty()) {
//			try {
//				BufferedOutputStream stream = new BufferedOutputStream(
//						new FileOutputStream(
//								new File(path)));
//				FileCopyUtils.copy(file.getInputStream(), stream);
//				stream.close();
//				msg = "You successfully uploaded" + file.getOriginalFilename() + "!";
//
//			} catch (Exception e) {
//				/* 실패시 */
//				msg = "You failde to upload" + file.getOriginalFilename() + "==>" + e.getMessage();
//			}
//		}else {
//			/* 파일 첨부가 안되었을시 */
//			msg = "You failed to upload" + file.getOriginalFilename() + "because the file was empty";
//		}
		return msg;
	}

	public static AttachmentVo multiFiles(MultipartFile[] files) {
		//System.out.println("filse Size = " + files.length);
		AttachmentVo attVo = new AttachmentVo();
		if (files != null && files.length > 0) {
			for (int i = 0; i < files.length; i++) {
				try {
					if (true == files[i].isEmpty()) {
						continue;
					}
					String fileName = files[i].getOriginalFilename();
					attVo.setAtt_name(files[i].getOriginalFilename());
					String path = Application.UPLOAD_DIR + "/" + UUID.UUID() + "_" + fileName;
					String extension = path.substring(path.lastIndexOf(".") + 1, path.length());
					attVo.setAtt_extension(extension);
					attVo.setAtt_file(files[i].getBytes());
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}

		return attVo;
	}
}
