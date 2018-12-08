package kr.or.ddit.member.web;

import kr.or.ddit.commons.mail.service.EmailServiceInf;
import kr.or.ddit.member.model.PMemberVo;
import kr.or.ddit.member.service.MemberServiceInf;
import kr.or.ddit.project.model.InviteProjectVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * kr.or.ddit.member.web
 * null.java
 * Desc : 회원 컨트롤러
 *
 * @Author : Mr.KKu
 * @Date : 2018-11-27 / 오후 3:08
 * @Version :
 */
@Controller
public class MemberController {

	@Autowired
	private EmailServiceInf emailService;

	@Autowired
	private MemberServiceInf memberService;

	@RequestMapping(value = "/inviteTeam" ,method = RequestMethod.POST)
	public String inviteTeam(@RequestParam("inviteTeam")String[] inviteMails, @RequestParam("project_id")String project_id) {
		String subject = "Current Project 초대 알람 입니다.";
		String content = "프로젝트 주소 : http://127.0.0.1:8081/?teamId="+ project_id;
		InviteProjectVo inviteProjectVo = new InviteProjectVo();
		PMemberVo pMemberVo = new PMemberVo();

		pMemberVo.setPmember_project(project_id);
		try {
			for (String inviteMail :
					inviteMails) {
				pMemberVo.setPmember_member(inviteMail);
				if( memberService.selectUser(inviteMail) == null){
					continue; // 회원이 아닐경우 발송 되지 않는다.
				}else {
					if(memberService.searchTeamMember(pMemberVo) == null){
						String to = inviteMail;

						inviteProjectVo.setMember_mail(inviteMail);
						inviteProjectVo.setProject_id(project_id);
						inviteProjectVo.setProject_invite("x");
						memberService.invitedProjects(inviteProjectVo);
						emailService.sendMail(to,subject,content);
					}else {
						continue;
					}

				}

			}
		}catch (Exception e){
			e.printStackTrace();
		}

		return "redirect:/subMain?project_id=" + project_id ;
	}

}
