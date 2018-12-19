package kr.or.ddit.attachment.web;

import kr.or.ddit.Application;
import kr.or.ddit.commons.util.FileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;
import java.util.Arrays;
import java.util.Comparator;
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
	 * @param name               the name
	 * @param file               the file
	 * @param redirectAttributes the redirect attributes
	 * @return the string
	 */
	@RequestMapping(method = RequestMethod.POST, value = "/single_upload")
	public String fileUpload(@RequestParam("name") String name, @RequestParam("file") MultipartFile file,
							@RequestParam("workId")String workId) {

		FileUpload.singleFile(file, workId);

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
	@RequestMapping(value="/multi_upload_form", method=RequestMethod.GET)
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
	public String multipleSave(@RequestParam("file") MultipartFile[] files) {
		FileUpload.multiFiles(files);
		return "redirect:/files";
	}
}
