package kr.or.ddit.commons.web;

import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.member.service.MemberServiceInf;
import kr.or.ddit.project.service.ProjectServiceInf;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.Map;

@Controller
public class MainController {

	@Autowired
	private MemberServiceInf memberService;

	@Autowired
	private ProjectServiceInf projectService;
	
	@RequestMapping(value="/inviteProject", method=RequestMethod.GET)
	public String inviteProject(Model model, @SessionAttribute("memberVo")MemberVo memberVo, @RequestParam("project_id")String project_id) {
		Map<String, String > inviteMap = new HashMap<>();
		model.addAttribute("project_id", project_id);
		inviteMap.put("project_id",project_id);
		inviteMap.put("member_mail", memberVo.getMember_mail());
		
		model.addAttribute("inviteProjectList", memberService.selectInviteProjectMap(inviteMap));
		return "main/inviteProject";
	}

	@RequestMapping(value = "/favorites", method = RequestMethod.GET)
	public String favorites(Model model,@SessionAttribute("memberVo")MemberVo memberVo) {

		model.addAttribute("pMemberList", projectService.bookMarkProjects(memberVo.getMember_mail()));
		model.addAttribute("inviteProjectList", memberService.selectInviteProject(memberVo.getMember_mail()));
		return "main/favoriteMain";
	}

	@RequestMapping(value = "/testFileUpload", method = RequestMethod.POST)
	public @ResponseBody String testFileUpload(MultipartFile[] files) {
		String fileName = null;
		String msg = "";
		if(files != null && files.length > 0) {
			for (int i = 0; i < files.length ; i++) {
				try {
					if (true == files[i].isEmpty()) {
						continue;
					}

					fileName = files[i].getOriginalFilename();
					byte[] bytes = files[i].getBytes();
//					BufferedOutputStream buffStream = new BufferedOutputStream(
//							new FileOutputStream(
//							new File(ExattachApplication.UPLOAD_DIR + "/" + fileName)));
//					buffStream.write(bytes);
//					buffStream.close();
				} catch (Exception e) {
					return "You failed to upload " + fileName + ": " + e.getMessage() + "<br />";
				}
			}
			return msg;
		}else {
			return "Unable to upload. File is empty";
		}
	}
}
