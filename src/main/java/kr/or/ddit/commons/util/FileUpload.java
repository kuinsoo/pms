package kr.or.ddit.commons.util;

import kr.or.ddit.Application;
import kr.or.ddit.attachment.model.AttachmentVo;
import kr.or.ddit.attachment.service.AttachmentService;
import kr.or.ddit.attachment.service.AttachmentServiceInf;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * kr.or.ddit.commons.util
 * null.java
 * Desc : 파일첨부 하나
 *
 * @Author : Mr.KKu
 * @Date : 2018-12-19 / 오후 12:02
 * @Version :
 */
public class FileUpload {

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

	public static String multiFiles(MultipartFile[] files) {
//		String fileName = null;
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//		if(files != null && files.length > 0) {
//			for (int i = 0; i < files.length ; i++) {
//				try {
//					if (true == files[i].isEmpty()) {
//						continue;
//					}
//
//					fileName = files[i].getOriginalFilename();
//					byte[] bytes = files[i].getBytes();
//					BufferedOutputStream buffStream = new BufferedOutputStream(
//							new FileOutputStream(
//									new File(Application.UPLOAD_DIR + "/" + UUID.UUID() + "_" + sdf.format(new Date()) + "_" + fileName)));
//					buffStream.write(bytes);
//					buffStream.close();
//				} catch (Exception e) {
//					return "You failed to upload " + fileName + ": " + e.getMessage() + "<br />";
//				}
//			}
//			return "success file upload ";
//		}else {
//			/* 파일 첨부가 되지 않았을 경우 */
//			return "Unable to upload. File is empty";
//		}
		return "";
	}
}

