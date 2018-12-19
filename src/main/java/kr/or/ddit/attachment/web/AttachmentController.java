package kr.or.ddit.attachment.web;

import kr.or.ddit.Application;
import kr.or.ddit.attachment.model.AttachmentVo;
import kr.or.ddit.attachment.service.AttachmentServiceInf;
import kr.or.ddit.commons.util.UUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

/**
 * kr.or.ddit.attachment.web
 * null.java
 * Desc : 첨부파일 컨트롤러
 *
 * @Author : Mr.KKu
 * @Date : 2018-11-27 / 오후 2:21
 * @Version :
 */
@Controller
public class AttachmentController {

	@Autowired
	private AttachmentServiceInf attachmentService;

	/**
	 * Provide upload info string.
	 * 작성자	: Mr.KKu
	 * 내용		: 파일 업로드 결과
	 *
	 * @param model the model
	 * @return the string
	 */
	@RequestMapping(method = RequestMethod.GET, value = "/files")
	public String provideUploadInfo(Model model) {
		File rootFolder = new File(Application.UPLOAD_DIR);

		List<String> fileNames = Arrays.stream(rootFolder.listFiles())
				.map(file -> file.getName())
				.collect(Collectors.toList());

		model.addAttribute("files", Arrays.stream(rootFolder.listFiles())
				.sorted(Comparator.comparingLong(file -> -1 * file.lastModified()))
				.map(file -> file.getName())
				.collect(Collectors.toList())
		);

		return "attachment/upload_result";
	}


	/**
	 * Single upload form string.
	 * 작성자	: Mr.KKu
	 * 내용		: 파일 업로드 폼 ( view 위치 )
	 *
	 * @return the string
	 */
	/* single file upload */
	@RequestMapping(value = "/single_upload_form", method = RequestMethod.GET)
	public String singleUploadForm() {
		return "attachment/single_upload_form";
	}

	/**
	 * File upload string.
	 *
	 * @param file the file
	 * @return the string
	 */
	@RequestMapping(method = RequestMethod.POST, value = "/single_upload")
	public String fileUpload(@RequestParam("file") MultipartFile file, @RequestParam("work_id") String work_id) {
//		FileUpload.singleFile(file, work_id);
		String msg = "";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");


		String path = Application.UPLOAD_DIR + "/" + UUID.UUID() + "_" + sdf.format(new Date()) + "_" + file.getOriginalFilename();
		String extension = path.substring(path.lastIndexOf(".") + 1, path.length());
		AttachmentVo attVo = new AttachmentVo();
		attVo.setAtt_work(work_id);
		attVo.setAtt_name(file.getOriginalFilename());
		attVo.setAtt_extension(extension);
		attVo.setAtt_path(path);
		if (!file.isEmpty()) {
			try {
				BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream(
								new File(path)));
				FileCopyUtils.copy(file.getInputStream(), stream);
				stream.close();
				attachmentService.insertAtt(attVo);
				msg = "You successfully uploaded" + file.getOriginalFilename() + "!";

			} catch (Exception e) {
				/* 실패시 */
				msg = "You failde to upload" + file.getOriginalFilename() + "==>" + e.getMessage();
			}
		} else {
			/* 파일 첨부가 안되었을시 */
			msg = "You failed to upload" + file.getOriginalFilename() + "because the file was empty";
		}

		return "redirect:/files";
	}



	/* multi file upload */

	/**
	 * Show multi upload form string.
	 * 작성자	: Mr.KKu
	 * 내용		: 다중파일 업로드 폼 ( view 위치 )
	 *
	 * @return the string
	 */
	@RequestMapping(value = "/multi_upload_form", method = RequestMethod.GET)
	public String showMultiUploadForm() {
		return "attachment/multi_upload_form";
	}

	/**
	 * Multiple save string.
	 * 작성자	: Mr.KKu
	 * 내용		: 다중파일 업로드 로직
	 *
	 * @param files the files
	 * @return the string
	 */
	@RequestMapping(value = "/multi_upload", method = RequestMethod.POST)
	public String multipleSave(@RequestParam("file") MultipartFile[] files,@RequestParam("work_id")String work_id) {
		String fileName = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		AttachmentVo attVo = new AttachmentVo();
		attVo.setAtt_work(work_id);

		if (files != null && files.length > 0) {
			for (int i = 0; i < files.length; i++) {
				try {
					if (true == files[i].isEmpty()) {
						continue;
					}
					fileName = files[i].getOriginalFilename();
					attVo.setAtt_name(files[i].getOriginalFilename());
					String path = Application.UPLOAD_DIR + "/" + UUID.UUID() + "_" + sdf.format(new Date()) + "_" + fileName;
					String extension = path.substring(path.lastIndexOf(".") + 1, path.length());
					attVo.setAtt_extension(extension);
					attVo.setAtt_path(path);
					byte[] bytes = files[i].getBytes();
					BufferedOutputStream buffStream = new BufferedOutputStream(
							new FileOutputStream(
									new File(path)));
					buffStream.write(bytes);
					buffStream.close();
					attachmentService.insertAtt(attVo);
				} catch (Exception e) {
					return "You failed to upload " + fileName + ": " + e.getMessage() + "<br />";
				}
			}
		} else {
			/* 파일 첨부가 되지 않았을 경우 */
			return "Unable to upload. File is empty";
		}

		/*return "success file upload ";*/
		return "redirect:/files";
	}

	@RequestMapping(value = "/download", method = RequestMethod.GET)
	public String download(@RequestParam("att_id")String att_id, Model model) {
		model.addAttribute("attVo",attachmentService.selectAtt(att_id));
		return "attachment/download";
	}
}
